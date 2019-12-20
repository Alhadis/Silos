package day1

import "core:fmt"
import "core:strings"
import "core:strconv"

part1 :: proc(input: []int) {
    calc_fuel :: proc(mass: int) -> int {
        return (mass / 3) - 2;
    }

    sum := 0;

    for mass in input {
        sum += calc_fuel(mass);
    }

    fmt.printf("part1: total fuel needed: %d\n", sum);
}

part2 :: proc(input: []int) {
    calc_fuel :: proc(mass: int) -> int {
        return max((mass / 3) - 2, 0);
    }

    sum := 0;

    for mass in input {
        fuel := calc_fuel(mass);

        for fuel != 0 {
            sum += fuel;
            fuel = calc_fuel(fuel);
        }
    }

    fmt.printf("part2: sum of fuel: %d\n", sum);
}

main :: proc() {
    input_strs := strings.split(input_str, "\n");
    input := make([]int, len(input_strs));
    for str, i in input_strs {
        input[i] = strconv.parse_int(str);
    }
    part1(input);
    part2(input);
}

input_str := `74392
127667
69569
148530
83690
84002
122964
107123
110494
144519
63331
61941
93209
93122
88787
67333
94900
134472
94647
104628
56171
147712
78930
58819
103374
114589
84131
52655
63193
94710
75332
75719
147913
100682
105546
73930
102283
53809
145886
133502
97903
140937
104102
89440
137660
110714
134163
63116
86505
135191
60768
126201
79596
64299
135513
53340
110859
136534
80519
56380
68566
101326
105695
146000
136744
105429
147815
88211
106856
97483
133855
73925
60995
88195
123525
98639
71255
146726
112901
119930
68304
121502
54137
75097
131582
102247
57260
66597
142929
122416
126247
64350
81531
71867
50494
101267
60412
109593
127215
110059`;
