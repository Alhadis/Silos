#!/usr/bin/env node
"use strict";


import fs from "fs";

const data = fs.readFileSync("colours.act");
let colours = [];
for(let i = 0; i < data.length; i += 3){
	let r = data[i + 0];
	let g = data[i + 1];
	let b = data[i + 2];
	if(r == null || g == null || b == null)
		break;
	r = r.toString(16).padStart(2, "0");
	g = g.toString(16).padStart(2, "0");
	b = b.toString(16).padStart(2, "0");
	colours.push("#" + (r + g + b).toUpperCase());
}
colours = [...new Set(colours.sort())];

console.log(colours.map(s => `<div style="background-color: ${s}">${s}</div>`).join("\n"));
