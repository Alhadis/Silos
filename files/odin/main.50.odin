import "core:fmt.odin"
import "core:os.odin"

import "html.odin"

/*

TODO:
 - Add optional arguments like class,id,etc. to all make_* procs
 - Add insert ability, html.insert_after(doc, aftert_element, insert_element)
 - "Cache" head tags in functions like title,charsetm,etc.
 - Support altering between body text and elements
   - union{string,^Element}
 - Return validation bool from html.gen

*/

main :: proc() {
	doc := html.make_document();

	html.lang(doc, "en");
	html.title(doc, "Amazing");
	html.title(doc, "I changed my mind.");
	html.charset(doc, "invalid");
	html.charset(doc);
	html.meta(doc, "viewport", "width=device-width, initial-scale=1.0");

	html.append(doc, html.h("Test"));
	html.append(doc, html.hr());

	html.append(doc, html.list([]^html.Element {
		html.link("Home", "#"),
		html.link("Shop", "#store"),
		html.link("News", "#news"),
		html.link("About Us", "#about"),
	}));

	html.append(doc, html.br());
	html.append(doc, html.list([]string {
		"Some",
		"Words",
		"Are",
		"Better",
		"Than",
		"Others",
	}));

	html.append(doc, html.img(
		src = "Lenna.png",
		alt = "Commonly used test image of model Lena Söderberg.",
		title = "Commonly used test image of model Lena Söderberg."
	));

	data := html.gen(doc);
	os.write_entire_file("test.html", data[..]);	
}

/*main :: proc() {
	doc := html.make_document();

	//html.add(doc, html.make_element("not valid"));

	html.set_lang(doc, "en");
	html.add_charset(doc); // Defaults to "UTF-8"
	html.add_title(doc, "This is a title!");
	html.add_css_link(doc, "./main.css");
	html.add_css(doc, "h1 { color: green; }");

	title := html.make_heading("Hello, world!");
	html.add(doc, title);

	sub_title := html.make_heading("Quiter hello world!", 3);
	html.add(doc, sub_title);

	link := html.make_link("Here", "#");
	html.set_id(link, "important-link");
	html.add(doc, link);

	html.add(doc, html.make_br());

	image := html.make_image("Lenna.png", "ooo alt text");
	html.add(doc, image);

	string_list_array := []string {
		"This",
		"is",
		"a",
		"list",
		"!",
	};
	string_list := html.make_list(string_list_array);
	html.set_class(string_list, "red");
	html.add(doc, string_list);
	html.append_to_list(string_list, "Appendage!");

	html.add(doc, html.make_br());

	element_list_array := []^html.Element {
		html.make_paragraph("This"),
		html.make_paragraph("is"),
		html.make_paragraph("another"),
		image,
		html.make_paragraph("list"),
		html.make_paragraph("!"),
	};
	element_list := html.make_list(element_list_array);
	html.set_class(element_list, "green");
	html.add(doc, element_list);
	html.append_to_list(element_list, html.make_paragraph("Even more appendage!"));

	data := html.gen(doc);
	os.write_entire_file("test.html", data[..]);
}*/