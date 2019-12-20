import "core:fmt.odin"
import "core:math.odin"

when ODIN_OS == "linux" do foreign import plt "libplt.so"
when ODIN_OS == "windows" do foreign import plt "system:plt.lib"

foreign plt {
	init :: proc() ---;
    show :: proc() ---;
    legend :: proc() ---; // NOTE: add argument?
    finish :: proc() ---;
}

simple_string_ :: proc(str: string) {
	foreign plt simple_string :: proc(str: ^u8) ---;
	simple_string(&str[0]);
}


plot :: proc(x, y: [$N]f64, format := "", label := "", linestyle := "", marker := "", alpha := -1.0, color: []f64 = nil, lw := -1.0, ms := -1.0, zorder := -9999.0)  {
	foreign plt plot :: proc(x, y: ^f64, n: i32, fmt, label, linestyle, marker: ^u8, alpha, color, lw, ms, zorder: ^f64) ---;
	
	assert(len(x) == len(y));
	plot(&x[0], &y[0], cast(i32)len(x), 
		format    == ""      ? cast(^u8)nil : &format[0], 
		label     == ""      ? cast(^u8)nil : &label[0], 
		linestyle == ""      ? cast(^u8)nil : &linestyle[0], 
		marker    == ""      ? cast(^u8)nil : &marker[0], 
		alpha     == -1.0    ? cast(^f64)nil : &alpha, 
		color     ==  nil    ? cast(^f64)nil : &color[0], 
		lw        == -1.0    ? cast(^f64)nil : &lw, 
		ms        == -1.0    ? cast(^f64)nil : &ms, 
		zorder    == -9999.0 ? cast(^f64)nil : &zorder);
}

title :: proc(str: string) {
	simple_string_(str);
}

main :: proc() {
	fmt.printf("asdasdasd\n"); 
	x, y1, y2: [60]f64;
	for _, i in x {
		x[i] = 2.0*3.1416*f64(i)/(f64(len(x))-1.0);
		y1[i] = math.sin(x[i]);
		y2[i] = math.cos(x[i]);
    }

    init();
    when false {
		simple_string_("import matplotlib.pyplot as plt");
		simple_string_("plt.figure(figsize=(16,9))");
		plot(x = x, y = y1, format="o--", label="sin");
		plot(x = x, y = y2, label="cos", alpha=0.5, lw=5.0);
		plot(x = x, y = y1+y2, label="sin + cos", color=[]f64{1.0, 0.0, 1.0});
		plot(x = x, y = y1-y2, label="sin - cos");
		plot(x = x, y = y1*y2, label="sin * cos");
		simple_string_("plt.legend(loc='best')");
		simple_string_("plt.title('Plot title! with TeX: $F(x)= \\int f(x)\\, dx + C$')");
		simple_string_("plt.xlabel('x label')");
		simple_string_("plt.ylabel('y label')");
		show();

	    finish();
    }
}