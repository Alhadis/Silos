package gui // TODO make it a different package

import "core:strings"
import "core:fmt"
import "core:unicode/utf8"

Joining :: enum {
    Dual,
    Prev,
    None,
}

Form :: enum {
    Isolated,
    Initial,
    Medial,
    Final,
}

Harf_Shapes :: struct {
    standard: rune,

    isolated, final, initial, medial: rune,

    joining: Joining
}

arabic_block_start :: '\u0600';


// this is a bit of a problem because not all unicode chars in the arabic block have shapes
// we can tell if a slot has data by checking if the .standard field is what we expect it to be
_harf_list: [255]Harf_Shapes;

harf_list := init_shapes();

init_shapes :: proc() -> []Harf_Shapes {
    fmt.println("initializing shapes!");
    forms2 :: proc(std: rune, isolated: rune) {
        harf := &_harf_list[int(std) - int(arabic_block_start)];
        harf.standard = std;
        harf.isolated = isolated;
        harf.initial = isolated;
        harf.medial = isolated + 1;
        harf.final = isolated + 1;
        harf.joining = .Prev;
        // fmt.println(harf^);
    }
    forms4 :: proc(std: rune, isolated: rune) {
        harf := &_harf_list[int(std) - int(arabic_block_start)];
        harf.standard = std;
        harf.isolated = isolated;
        harf.initial = isolated + 2;
        harf.medial = isolated + 3;
        harf.final = isolated + 1;
        harf.joining = .Dual;
        // fmt.println(harf^);
    }

    // Lam-Aleft

    // these letters don't exist in the std form so think about them later
    // forms2('\uFEFB', '\uFEFB');
    // forms2('\uFEF9', '\uFEF9');
    // forms2('\uFEF7', '\uFEF7');
    // forms2('\uFEF5', '\uFEF5');

    // Hamza groups
    forms2('\u0622', '\uFE81');
    forms2('\u0623', '\uFE83');
    forms2('\u0624', '\uFE85');
    forms2('\u0625', '\uFE87');
    forms4('\u0626', '\uFE89');
    // Main letters
    forms2('\u0627', '\uFE8D');
    forms4('\u0628', '\uFE8F');
    forms4('\u062A', '\uFE95');
    forms4('\u062B', '\uFE99');
    forms4('\u062C', '\uFE9D');
    forms4('\u062D', '\uFEA1');
    forms4('\u062E', '\uFEA5');
    forms2('\u062F', '\uFEA9');
    forms2('\u0630', '\uFEAB');
    forms2('\u0631', '\uFEAD');
    forms2('\u0632', '\uFEAF');
    forms4('\u0633', '\uFEB1');
    forms4('\u0634', '\uFEB5');
    forms4('\u0635', '\uFEB9');
    forms4('\u0636', '\uFEBD');
    forms4('\u0637', '\uFEC1');
    forms4('\u0638', '\uFEC5');
    forms4('\u0639', '\uFEC9');
    forms4('\u063A', '\uFECD');
    forms4('\u0641', '\uFED1');
    forms4('\u0642', '\uFED5');
    forms4('\u0643', '\uFED9');
    forms4('\u0644', '\uFEDD');
    forms4('\u0645', '\uFEE1');
    forms4('\u0646', '\uFEE5');
    forms4('\u0647', '\uFEE9');
    forms2('\u0648', '\uFEED');
    forms4('\u064A', '\uFEF1');
    // Letters that are not directly in the alphabet
    forms2('\u0629', '\uFE93');
    forms2('\u0649', '\uFEEF');
    // Extra sounds not in standard arabic
    forms4('\u067E', '\uFB56'); // p
    forms4('\u06A4', '\uFB6A'); // v
    forms4('\u06AF', '\uFB92'); // g

    return _harf_list[:];
}

get_shapes :: proc(std: rune) -> (result: Harf_Shapes, ok: bool) {
    // fmt.println("Checking shapes of", std);
    index := int(std) - int(arabic_block_start);
    // fmt.println(    "index is:", index);
    if index < 0 || index >= len(harf_list) {
        return result, false;
    }
    form := harf_list[index];
    if form.standard != std { // slot not filled
        // fmt.println("slot not filled? found", form.standard);
        return result, false;
    }
    return form, true;
}

Range :: struct {
    first, last: rune
}

harakat_ranges := [?]Range{
    Range{first = '\u0610', last = '\u061A'},
    Range{first = '\u064B', last = '\u065E'},
    Range{first = '\u0670', last = '\u0670'},
    Range{first = '\u06D6', last = '\u06DC'},
    Range{first = '\u06DF', last = '\u06E8'},
    Range{first = '\u06EA', last = '\u06ED'},
};

is_haraka :: proc(c: rune) -> bool {
    for r in harakat_ranges {
        if c >= r.first && c <= r.last {
            return true;
        }
    }
    return false;
}

shape :: proc(str: string) -> string {
    b := strings.make_builder();
    strings.grow_builder(&b, len(str));

    // Joining can be "delayed" by the presense of harakat
    // they take up space in the string but not in the display,
    // and their presence or absence does not alter joining rules
    Pending :: struct {
        yes: bool,
        index: int, // index in the output buffer!
        shapes: Harf_Shapes,
        tentative: rune,
    };

    // the way pending works is that we when find an item that has dual joining
    // we first only check the previous item and let the next item adjust it
    pending: Pending;

    for rune, index in str {
        if shp, ok := get_shapes(rune); ok {
            form := shp.isolated;
            if pending.yes && shp.joining != .None { // this shape join to previous and previous was waiting for this!
                form = shp.final;
                // item at pending.index needs to be adjusted
                new_form := pending.tentative; // for the pending item
                switch pending.tentative {
                    case pending.shapes.isolated:
                        new_form = pending.shapes.initial;
                    case pending.shapes.final:
                        new_form = pending.shapes.medial;
                    // case:
                        // fmt.println("invalid state! pending item at index", pending.index, "has tentative form:", pending.tentative);
                }
                if new_form != pending.tentative {
                    // fmt.println("adjusting previous rune to", new_form);
                    replace_rune(&b, pending.index, new_form);
                }
            }
            pending = Pending{}; // clear any pending item!

            if shp.joining == .Dual {
                // we are the new pending
                pending = Pending{
                    yes = true,
                    index = len(b.buf),
                    shapes = shp,
                    tentative = form,
                };
            }
            // fmt.println("tentatively going with", form);
            strings.write_rune(&b, form);
        } else if is_haraka(rune) {
            strings.write_rune(&b, rune);
        } else {
            pending = Pending{}; // clear any pending item!
            strings.write_rune(&b, rune);
        }
    }
    return strings.to_string(b);
}

// this is kind of dangerous in the general case, but since we're dealing with arabic characters they should all have the same length in utf8 encoding!
@private
replace_rune :: proc(b: ^strings.Builder, index: int, rune: rune) {
    s, n := utf8.encode_rune(rune);
    // xs, xn := utf8.decode_rune(b.buf[index:]);
    // if n != xn {
        // fmt.printf("previous rune %v took %d bytes where as the new one %v will take %d bytes!\n", xs, xn, rune, n);
    // }
    // fmt.println("replacing at", index, "using", n, "bytes");
    copy(b.buf[index:index+n], s[:n]);
}

