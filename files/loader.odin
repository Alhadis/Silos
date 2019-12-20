package main

import "core:fmt"
import "core:os"
import "core:mem"
import "core:strings"
import "elf"



RAM_SIZE :: 1024 * 1024;
ram : []byte;
x: int = 3;
y: int = 42424;








load :: proc(buffer: []byte, elf_file: elf.Elf32_File) -> bool {
	
	for sh in elf_file.section_headers {
		name: string = elf.lookup_section_name(elf_file, sh);
		switch name {
			case ".rodata", ".text":
				if(sh.addr + sh.size > RAM_SIZE) {
					fmt.eprint("RAM_SIZE too small to load this section\n");
					return false;
				} else {
					mem.copy(&buffer[sh.addr], &elf_file.data[sh.offset], int(sh.size));
				}
			case ".bss":
				if(sh.addr + sh.size > RAM_SIZE) {
					fmt.eprint("RAM_SIZE too small to load this section\n");
					return false;
				} else {
					//TODO this probably isn't even necessary in our current setup, but whatever
					mem.set(&buffer[sh.addr], 0, int(sh.size));
				}
		}
	}

	return true;
}




main :: proc() {

	ram = make([]byte, RAM_SIZE);
	fmt.printf("RAM: 0x%x\n", &ram[0]);

	if(len(os.args) < 2) {
		fmt.eprint("Usage: loader [PATH_TO_ELF_FILE].elf");
		os.exit(1);
	}

	file_bytes, success := os.read_entire_file(os.args[1]);
	if(success) {
		elf_file: elf.Elf32_File = elf.parse(file_bytes);
		elf.print_report(elf_file);
		ok := load(ram, elf_file);
		if(!ok) {
			fmt.eprint("Error loading program");
			os.exit(1);
		}
	} else {
		fmt.eprint("Error opening ELF file");
		os.exit(1);
	}
}