/*
    Copyright 2004,2005,2006 Luigi Auriemma (original C version 'CHD')
    Copyright 2019 Dirk Loss (V port)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA

    http://www.gnu.org/licenses/gpl.txt
*/

import os

version := '0.1'

fn print_bits(val byte) {
    mut bitmask := byte(128)
    for bitmask > 0 {
        if (val & bitmask) > 0 {
            print('1')
        }
        else {
            print('0')
        }
        bitmask = bitmask / 2
    }
}

println('VCHD $version')
println('')
println('Insert text:')
println('')
println('ch Hx Dec Oct Binary')
println('----------------------')

mut chr := byte(0)
for {
    line := os.get_line()
    for chr in line {
        C.printf(' %c %02x %03d %03o ',
                  chr, chr, chr, chr)
        print_bits(chr)
        println('')
    }
}
