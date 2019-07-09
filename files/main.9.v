/*
elv
size of name     --  4 byte
name of the file
size of content  --  8 byte
content
.....
*/

module main

import os

const (
	Mag = 'elv'
)

/*struct AFile {
	name string
	content string
}*/

fn main() {
	if os.args.len < 3 || os.args[1].len != 1 {
		usage()
	} else if os.args[1] == 'l' {
		println('listing')
		listing()
	} else if os.args[1] == 'a' {
		println('archiving')
		archive()
	} else if os.args[1] == 'x' {
		println('extracting')
		extracting()
	}
}

fn archive() {
	mut f_size := u64(0)
	mut filename_size := 0

	if os.args.len > 3 {
		arcname := os.args[2]
		files := os.args.right(3)    // get files to archive
		if os.file_exists(arcname) {
			println('Archive $arcname already exists.')
			exit(1)
		}
		arc := os.create(arcname) // create archive
		arc.write(Mag) // write magic number
		for file in files {
			println('Archiving $file')
			filename_size = file.len
			println('"${filename_size}"')
			arc.write_bytes(&filename_size, 4) // size of file name
			arc.write(file) // file name
			f_size = u64(os.file_size(file))
			println('"${f_size}"')
			arc.write_bytes(&f_size, 8) // size of file
			cont := os.read_file(file) or {  // read file content
				panic('file does not exists')
				return
			}
			arc.write(cont) // write content
		}
		arc.close()
	} else {
		println('no files to archive')
		exit(1)
	}
}

fn usage() {
	execname := os.args[0]
	println('usage: $execname <alx> <ARCHIVE_NAME.elv> [FILE...]')
	println('\ta - archive FILE...')
	println('\tl - list archive content')
	println('\tx - extract files to current dir')
}

fn listing() {
	/*file := os.read_file(os.args[2]) or {
		panic('archive not exists')
		return
	}
	println(file)*/
	// TODO find way to read "byted" file
}

fn extracting() {
	// TODO
}
