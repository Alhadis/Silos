@Module
package org.w3c.canvas;

import org.w3c.dom.Element;
import org.w3c.html.img;
import org.w3c.html.video;

public native interface CanvasRenderingContext2D {

  // back-reference to the canvas
//  readonly attribute 
	public org.w3c.html.canvas canvas{}

	// state
	void save(); // push state on state stack
	void restore(); // pop state stack and restore state

	// transformations (default transform is the identity matrix)
	void scale(final float x, final float y);
	void rotate(final float angle);
	void translate(final float x, final float y);
	void transform(final float m11, final float m12, final float m21, final float m22, final float dx, final float dy);
	void setTransform(final float m11, final float m12, final float m21, final float m22, final float dx, final float dy);

	// compositing
//    attribute 
	public float globalAlpha{} // (default 1.0)
//           attribute 
    public String globalCompositeOperation{} // (default source-over)

  // colors and styles
//           attribute 
    public Object strokeStyle{} // (default black)
//    attribute
    public Object fillStyle{} // (default black)
    CanvasGradient createLinearGradient(final float x0, final float y0, final float x1, final float y1);
    CanvasGradient createRadialGradient(final float x0, final float y0, final float r0, final float x1, final float y1, final float r1);
    CanvasPattern createPattern(final img image, final String repetition);
    CanvasPattern createPattern(final org.w3c.html.canvas image, final String repetition);
    CanvasPattern createPattern(final video image, final String repetition);

  // line caps/joins
//    attribute 
    public float lineWidth{} // (default 1)
//    attribute 
    public String lineCap{} // "butt", "round", "square" (default "butt")
//    attribute 
    public String lineJoin{} // "round", "bevel", "miter" (default "miter")
//    attribute 
    public float miterLimit{} // (default 10)

  // shadows
//    attribute 
    public float shadowOffsetX{} // (default 0)
//    attribute 
    public float shadowOffsetY{} // (default 0)
//    attribute 
    public float shadowBlur{} // (default 0)
//    attribute 
    public String shadowColor{} // (default transparent black)

    // rects
    void clearRect(final float x, final float y, final float w, final float h);
    void fillRect(final float x, final float y, final float w, final float h);
    void strokeRect(final float x, final float y, final float w, final float h);

    // path API
    void beginPath();
  	void closePath();
  	void moveTo(final float x, final float y);
  	void lineTo(final float x, final float y);
  	void quadraticCurveTo(final float cpx, final float cpy, final float x, final float y);
  	void bezierCurveTo(final float cp1x, final float cp1y, final float cp2x, final float cp2y, final float x, final float y);
  	void arcTo(final float x1, final float y1, final float x2, final float y2, final float radius);
  	void rect(final float x, final float y, final float w, final float h);
  	void arc(final float x, final float y, final float radius, final float startAngle, final float endAngle, final boolean anticlockwise);
  	void fill();
  	void stroke();
  	void clip();
  	boolean isPointInPath(final float x, final float y);

  	// focus management
  	boolean drawFocusRing(final Element element, final float xCaret, final float yCaret);
  
  	boolean drawFocusRing(final Element element, final float xCaret, final float yCaret, final /*optional*/ boolean canDrawCustom);

  	// text
  	//           attribute 
  	public String font{} // (default 10px sans-serif)
  	//           attribute 
  	public String textAlign{} // "start", "end", "left", "right", "center" (default: "start")
  	//           attribute 
  	String textBaseline{} // "top", "hanging", "middle", "alphabetic", "ideographic", "bottom" (default: "alphabetic")
  	void fillText(final String text, final float x, final float y);
  	void fillText(final String text, final float x, final float y, final /*optional*/ float maxWidth);
  	void strokeText(final String text, final float x, final float y);
  	void strokeText(final String text, final float x, final float y, final /*optional*/ float maxWidth);
  	TextMetrics measureText(final String text);

  	// drawing images
  	void drawImage(final img image, final float dx, final float dy, final float dh);
  	void drawImage(final img image, final float dx, final float dy, final /*optional*/ float dw, final float dh);
  	void drawImage(final img image, final float sx, final float sy, final float sw, final float sh, final float dx, final float dy, final float dw, final float dh);
  	void drawImage(final org.w3c.html.canvas image, final float dx, final float dy, final float dh);
  	void drawImage(final org.w3c.html.canvas image, final float dx, final float dy, final /*optional*/ float dw, final float dh);
  	void drawImage(final org.w3c.html.canvas image, final float sx, final float sy, final float sw, final float sh, final float dx, final float dy, final float dw, final float dh);
  	void drawImage(final video image, final float dx, final float dy, final float dh);
  	void drawImage(final video image, final float dx, final float dy, final /*optional*/ float dw, final float dh);
  	void drawImage(final video image, final float sx, final float sy, final float sw, final float sh, final float dx, final float dy, final float dw, final float dh);

  	// pixel manipulation
  	ImageData createImageData(final float sw, final float sh);
  	ImageData createImageData(final ImageData imagedata);
  	ImageData getImageData(final float sx, final float sy, final float sw, final float sh);
  	void putImageData(final ImageData imagedata, final float dx, final float dy, final float dirtyY, final float dirtyWidth, final float dirtyHeight);
  	void putImageData(final ImageData imagedata, final float dx, final float dy, final /*optional*/ float dirtyX, final float dirtyY, final float dirtyWidth, final float dirtyHeight);
}

public native interface CanvasGradient {
	// opaque object
	void addColorStop(final float offset, final String color);
}

public native interface CanvasPattern {
	// opaque object
}

public native interface TextMetrics {
	//  readonly attribute 
	public float width{}
}

public native interface ImageData {
	//  readonly attribute unsigned 
	public long width{}
	//  readonly attribute unsigned 
	public long height{}
	//  readonly attribute 
	public CanvasPixelArray data{}
}

public native interface CanvasPixelArray {
	//  readonly attribute unsigned 
	public long length{}
	//  getter octet (final unsigned long index);
	//  setter void (final unsigned long index, final octet value);
	byte this[long index];
}