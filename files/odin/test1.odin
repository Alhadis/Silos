import "core:os.odin"

import "../html.odin"

Post :: struct {
	element: ^html.Element,
	title: ^html.Element,
	author: ^html.Element,
	body: ^html.Element,
}

make_post :: proc(title_text: string, author_text: string, body_text: string) -> Post {
	using post: Post;
	element = html.div();
	html.class(element, "post");

	title = html.h(title_text, 2);
	html.append(element, title);

	author = html.h(author_text, 4);
	html.append(element, author);

	html.append(element, html.hr());

	body = html.p(body_text);
	html.append(element, body);

	return post;
}

main :: proc() {
	doc := html.make_document();

	html.lang(doc, "en");
	html.title(doc, "Neat");
	html.charset(doc);
	html.meta(doc, "viewport", "width=device-width, initial-scale=1");
	
	html.append_css(doc,
`
html,body {
	background-color: white;
	font-family: "Times New Roman";
}

#title {
	margin-top: 0;
	margin-bottom: 0;
	color: black;
	font-size: 2em;
}

#posts {
	width: 49%;
	overflow: auto;
	float: left;
}

#table {
	float: right;
	width: 49%;
	outline-style: solid;
	outline-width: 1px;
	outline-color: black;
	margin: 5px 5px;
	padding: 2px 2px;
}

.post {
	outline-style: solid;
	outline-width: 1px;
	outline-color: black;
	margin: 5px 5px;
	padding: 2px 2px;
}
`);

	title := html.h("Neat");
	html.id(title, "title");
	html.append(doc, title);

	title_line := html.make_element("hr");
	html.append(doc, html.hr());

	post_div := html.div();
	html.id(post_div, "posts");
	html.append(doc, post_div);

	html.append(post_div, make_post("We want more", "by internetjerk321", "We want more posts!!").element);
	html.append(post_div, make_post("Here is more", "by niceguy2", "https://goodstuff.com/").element);
	html.append(post_div, make_post("Even more", "by randy", "https://catpics.net/").element);
	html.append(post_div, make_post("Even more", "by randy", "https://catpics.net/").element);
	html.append(post_div, make_post("Even more", "by randy", "https://catpics.net/").element);
	html.append(post_div, make_post("Even more", "by randy", "https://catpics.net/").element);

	table_div := html.div();
	html.id(table_div, "table");
	html.append(doc, table_div);

	html.append(table_div, html.p("Text!"));

	data := html.gen(doc);
	os.write_entire_file("test1.html", data[..]);
}