import	os "core:os.odin";
import utf8 "core:utf8.odin";
import fmt "core:fmt.odin";

read_lines :: proc(path: string) -> ([]string, bool) {

	is_newline :: proc(i: int, arr: []u8) -> (bool, int) {
		if arr[i] == '\n' || arr[i] == '\r' {
				if len(arr)-1 > i && arr[i] == '\r' && arr[i+1] == '\n' {
					return true, 2;
				}
				return true, 1;
			}

		return false, 0;
	}

	fileCont, success := os.read_entire_file(path);
	if !success {
		return []string{}, success;
	}

	fileLength := len(fileCont);
	lineCount := 1;
	lastNewline := 0;
	for i := 0; i < fileLength; i += 1 {
		nl, nll := is_newline(i, fileCont);
		if nl {
			lineCount += 1;
			lastNewline = i;
			i += nll-1;
		}
	}

	foundLines := 0;
	lines := make([]string, lineCount);
	for offset, i, size := 0, 0, 0; i < fileLength; i += size {
		r: rune;
		r, size = utf8.decode_rune(fileCont[i..]);

		nl, nll := is_newline(i, fileCont);
		if nl {
			lnl, _ := is_newline(offset, fileCont);
			if lnl && i - offset == nll {
				lines[foundLines] = "";	
			}
			else {
				lines[foundLines] = string(fileCont[offset..i]);
			}

			foundLines += 1;
			i += nll - 1;
			offset = i + 1;

		} 

		eof := i >= fileLength - 1;
		if eof {
			lines[foundLines] = string(fileCont[offset..fileLength]);
			break;
		}
		
	}

	return lines, true;
}
