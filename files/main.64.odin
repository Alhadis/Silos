package day2

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"

OPERATIONS :: enum {
  ADD = 1,
  MULTIPLY = 2,
  HALT = 99
}

run_program :: proc(program: []int) -> []int {
  loop: for i := 0; i < len(program); i += 1 {
    #complete switch OPERATIONS(program[i]) {
      case .ADD:
        x := program[i + 1];
        y := program[i + 2];
        dest := program[i + 3];

        program[dest] = program[x] + program[y];
        i += 3;

      case .MULTIPLY:
        x := program[i + 1];
        y := program[i + 2];
        dest := program[i + 3];

        program[dest] = program[x] * program[y];
        i += 3;

      case .HALT:
        break loop;
    }
  }

  return program;
}

main :: proc() {
  data, success := os.read_entire_file(os.args[1]);

  if !success {
    fmt.eprintln("Could not read file.");
    return;
  }

  stringified := strings.split(string(data), ",");
  intcode := make([]int, len(stringified));

  for x, i in stringified {
    intcode[i] = strconv.parse_int(x);
  }

  desired_output :: 19690720;

  for x in 0..99 {
    for y in 0..99 {
      intcode_copy := make([]int, len(intcode));
      defer delete(intcode_copy);

      copy(intcode_copy, intcode);

      intcode_copy[1] = x;
      intcode_copy[2] = y;

      out := run_program(intcode_copy[:]);

      if out[0] == desired_output {
        fmt.printf("Program arg 1: %v\n", x);
        fmt.printf("Program arg 2: %v\n", y);

        return;
      }
    }
  }
}
