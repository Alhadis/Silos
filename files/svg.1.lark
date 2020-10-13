@Module
package org.w3c.svg;

import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.css.CSSRule;
import org.w3c.dom.css.CSSStyleDeclaration;
import org.w3c.dom.css.CSSValue;
import org.w3c.dom.css.DocumentCSS;
import org.w3c.dom.css.RGBColor;
import org.w3c.dom.css.ViewCSS;
import org.w3c.event.DocumentEvent;
import org.w3c.event.Event;
import org.w3c.event.EventTarget;
import org.w3c.event.UIEvent;
import org.w3c.views.AbstractView;

//module svg {

public class SVGException extends Exception{
//  unsigned 
	public native short code{}
	
	// SVGException code
//	const unsigned 
	public native static final short SVG_WRONG_TYPE_ERR = 0;
//	const unsigned 
	public native static final short SVG_INVALID_VALUE_ERR = 1;
//	const unsigned 
	public native static final short SVG_MATRIX_NOT_INVERTABLE = 2;
}

public native interface SVGElement extends Element {
//	attribute 
	public native String id{} //setthrows DOMException;
//	attribute 
	public native String xmlbase{} //setthrows DOMException;
//	readonly attribute
	public native SVGSVGElement ownerSVGElement{}
//	readonly attribute 
	public native SVGElement viewportElement{}
}

public native interface SVGAnimatedBoolean {
//           attribute
	public native boolean baseVal{} // setthrows DOMException;
//  readonly attribute 
	public native boolean animVal{}
}

public native interface SVGAnimatedString {
//           attribute 
	public native String baseVal{} // setthrows DOMException;
//  readonly attribute 
	public native String animVal{}
}

public native interface SVGStringList {

//  readonly attribute unsigned 
	public native long numberOfItems{}

	public native void clear() throws DOMException;
	public native String initialize(final String newItem) throws DOMException;
	public native String getItem(final /*unsigned*/ long index) throws DOMException;
	public native String insertItemBefore(final String newItem, final /*unsigned*/ long index) throws DOMException;
	public native String replaceItem(final String newItem, final /*unsigned*/ long index) throws DOMException;
	public native String removeItem(final /*unsigned*/ long index) throws DOMException;
	public native String appendItem(final String newItem) throws DOMException;
}

public native interface SVGAnimatedEnumeration {
//           attribute unsigned 
	public native short baseVal{} // setthrows DOMException;
//  readonly attribute unsigned 
	public native short animVal{}
}

public native interface SVGAnimatedInteger {
//           attribute 
	public native long baseVal{} // setthrows DOMException;
//  readonly attribute 
	public native long animVal{}
}

public native interface SVGNumber {
//  attribute 
	public native float value{} // setthrows DOMException;
}

public native interface SVGAnimatedNumber {
//           attribute
	public native float baseVal{} // setthrows DOMException;
//  readonly attribute 
	public native float animVal{}
}

public native interface SVGNumberList {

//  readonly attribute unsigned 
	public native long numberOfItems{}

	public native void clear() throws DOMException;
	public native SVGNumber initialize(final SVGNumber newItem) throws DOMException;
	public native SVGNumber getItem(final /*unsigned*/ long index) throws DOMException;
	public native SVGNumber insertItemBefore(final SVGNumber newItem, final /*unsigned*/ long index) throws DOMException;
	public native SVGNumber replaceItem(final SVGNumber newItem, final /*unsigned*/ long index) throws DOMException;
	public native SVGNumber removeItem(final /*unsigned*/ long index) throws DOMException;
	public native SVGNumber appendItem(final SVGNumber newItem) throws DOMException;
}

public native interface SVGAnimatedNumberList {
//  readonly attribute 
	public native SVGNumberList baseVal{}
//  readonly attribute 
	public native SVGNumberList animVal{}
}

public native interface SVGLength {

  // Length Unit Types
//  const unsigned 
	public native static final short SVG_LENGTHTYPE_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_LENGTHTYPE_NUMBER = 1;
//  const unsigned
	public native static final short SVG_LENGTHTYPE_PERCENTAGE = 2;
//  const unsigned 
	public native static final short SVG_LENGTHTYPE_EMS = 3;
//  const unsigned 
	public native static final short SVG_LENGTHTYPE_EXS = 4;
//  const unsigned 
	public native static final short SVG_LENGTHTYPE_PX = 5;
//  const unsigned 
	public native static final short SVG_LENGTHTYPE_CM = 6;
//  const unsigned 
	public native static final short SVG_LENGTHTYPE_MM = 7;
//  const unsigned 
	public native static final short SVG_LENGTHTYPE_IN = 8; 
//  const unsigned 
	public native static final short SVG_LENGTHTYPE_PT = 9;
//  const unsigned 
	public native static final short SVG_LENGTHTYPE_PC = 10;

//  readonly attribute unsigned 
	public native final short unitType{}
//           attribute 
	public native final float value{} // setthrows DOMException;
//           attribute
	public native final float valueInSpecifiedUnits{} // setthrows DOMException;
//           attribute 
	public native final String valueAsString{} // setthrows DOMException;

	public native void newValueSpecifiedUnits(final /*unsigned*/ short unitType, final float valueInSpecifiedUnits) throws DOMException;
	public native void convertToSpecifiedUnits(final /*unsigned*/ short unitType) throws DOMException;
}

public native interface SVGAnimatedLength {
//  readonly attribute 
	public native SVGLength baseVal{}
//  readonly attribute 
	public native SVGLength animVal{}
}

public native interface SVGLengthList {

//  readonly attribute unsigned 
	public native  long numberOfItems{}

	public native void clear() throws DOMException;
	public native SVGLength initialize(final SVGLength newItem) throws DOMException;
	public native SVGLength getItem(final /*unsigned*/ long index) throws DOMException;
	public native SVGLength insertItemBefore(final SVGLength newItem, final /*unsigned*/ long index) throws DOMException;
	public native SVGLength replaceItem(final SVGLength newItem, final /*unsigned*/ long index) throws DOMException;
	public native SVGLength removeItem(final /*unsigned*/ long index) throws DOMException;
	public native SVGLength appendItem(final SVGLength newItem) throws DOMException;
}

public native interface SVGAnimatedLengthList {
//  readonly attribute /
	public native  SVGLengthList baseVal{}
//  readonly attribute
	public native  SVGLengthList animVal{}
}

public native interface SVGAngle {

  // Angle Unit Types
//  const unsigned 
	public native static final short SVG_ANGLETYPE_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_ANGLETYPE_UNSPECIFIED = 1;
//  const unsigned 
	public native static final short SVG_ANGLETYPE_DEG = 2;
//  const unsigned 
	public native static final short SVG_ANGLETYPE_RAD = 3;
//  const unsigned 
	public native static final short SVG_ANGLETYPE_GRAD = 4;

//  readonly attribute unsigned 
	public native short unitType{}
//           attribute 
	public native float value{} // setthrows DOMException;
//           attribute 
	public native float valueInSpecifiedUnits{} // setthrows DOMException;
//           attribute 
	public native String valueAsString{} // setthrows DOMException;

	public native void newValueSpecifiedUnits(final /*unsigned*/ short unitType, final float valueInSpecifiedUnits) throws DOMException;
	public native void convertToSpecifiedUnits(final /*unsigned*/ short unitType) throws DOMException;
}

public native interface SVGAnimatedAngle {
//  readonly attribute 
	public native SVGAngle baseVal{}
//  readonly attribute 
	public native SVGAngle animVal{}
}

public native interface SVGColor extends CSSValue {

  // Color Types
//  const unsigned 
	public native static final short SVG_COLORTYPE_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_COLORTYPE_RGBCOLOR = 1;
//  const unsigned 
	public native static final short SVG_COLORTYPE_RGBCOLOR_ICCCOLOR = 2;
//  const unsigned 
	public native static final short SVG_COLORTYPE_CURRENTCOLOR = 3;

//  readonly attribute unsigned 
	public native short colorType{}
//  readonly attribute 
	public native RGBColor rgbColor{}
//  readonly attribute 
	public native SVGICCColor iccColor{}

	public native void setRGBColor(final String rgbColor) throws SVGException;
	public native void setRGBColorICCColor(final String rgbColor, final String iccColor) throws SVGException;
	public native void setColor(final /*unsigned*/ short colorType, final String rgbColor, final String iccColor) throws SVGException;
}

public native interface SVGICCColor {
//           attribute 
	public native String colorProfile{} // setthrows DOMException;
//  readonly attribute 
	public native SVGNumberList colors{}
}

public native interface SVGRect {
//  attribute 
	public native float x{} // setthrows DOMException;
//  attribute 
	public native float y{} // setthrows DOMException;
//  attribute 
	public native float width{} // setthrows DOMException;
//  attribute 
	public native float height{} // setthrows DOMException;
}

public native interface SVGAnimatedRect {
//  readonly attribute 
	public native SVGRect baseVal{}
//  readonly attribute 
	public native SVGRect animVal{}
}

public native interface SVGUnitTypes {
  // Unit Types
//  const unsigned 
	public native static final short SVG_UNIT_TYPE_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_UNIT_TYPE_USERSPACEONUSE = 1;
//  const unsigned 
	public native static final short SVG_UNIT_TYPE_OBJECTBOUNDINGBOX = 2;
}

public native interface SVGStylable {

//  readonly attribute 
	public native SVGAnimatedString className{}
//  readonly attribute 
	public native CSSStyleDeclaration style{}

	public native CSSValue getPresentationAttribute(final String name);
}

public native interface SVGLocatable {

//  readonly attribute 
	public native SVGElement nearestViewportElement{}
//  readonly attribute 
	public native SVGElement farthestViewportElement{}

	public native SVGRect getBBox();
	public native SVGMatrix getCTM();
	public native SVGMatrix getScreenCTM();
	public native SVGMatrix getTransformToElement(final SVGElement element) throws SVGException;
}

public native interface SVGTransformable extends SVGLocatable {
//  readonly attribute 
	public native SVGAnimatedTransformList transform{}
}

public native interface SVGTests {

//  readonly attribute 
	public native SVGStringList requiredFeatures{}
//  readonly attribute 
	public native SVGStringList requiredExtensions{}
//  readonly attribute 
	public native SVGStringList systemLanguage{}

	public native boolean hasExtension(final String extension);
}

public native interface SVGLangSpace {
//  attribute
	public native String xmllang{} // setthrows DOMException;
//  attribute 
	public native String xmlspace{} // setthrows DOMException;
}

public native interface SVGExternalResourcesRequired {
//  readonly attribute 
	public native SVGAnimatedBoolean externalResourcesRequired{}
}

public native interface SVGFitToViewBox {
//  readonly attribute 
	public native SVGAnimatedRect viewBox{}
//  readonly attribute 
	public native SVGAnimatedPreserveAspectRatio preserveAspectRatio{}
}

public native interface SVGZoomAndPan {

  // Zoom and Pan Types
//  const unsigned 
	public native static final short SVG_ZOOMANDPAN_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_ZOOMANDPAN_DISABLE = 1;
//  const unsigned 
	public native static final short SVG_ZOOMANDPAN_MAGNIFY = 2;

//  attribute unsigned 
	public native short zoomAndPan{} //setthrows DOMException;
}

public native interface SVGViewSpec extends SVGZoomAndPan,
                        SVGFitToViewBox {
//  readonly attribute 
	public native SVGTransformList transform{}
//  readonly attribute 
	public native SVGElement viewTarget{}
//  readonly attribute 
	public native String viewBoxString{}
//  readonly attribute 
	public native String preserveAspectRatioString{}
//  readonly attribute 
	public native String transformString{}
//  readonly attribute 
	public native String viewTargetString{}
}

public native interface SVGURIReference {
//  readonly attribute 
	public native SVGAnimatedString href{}
}

public native interface SVGCSSRule extends CSSRule {
//  const unsigned 
	public native static final short COLOR_PROFILE_RULE = 7;
}

public native interface SVGRenderingIntent {
  // Rendering Intent Types
//  const unsigned 
	public native static final short RENDERING_INTENT_UNKNOWN = 0;
//  const unsigned 
	public native static final short RENDERING_INTENT_AUTO = 1;
//  const unsigned 
	public native static final short RENDERING_INTENT_PERCEPTUAL = 2;
//  const unsigned
	public native static final short RENDERING_INTENT_RELATIVE_COLORIMETRIC = 3;
//  const unsigned 
	public native static final short RENDERING_INTENT_SATURATION = 4;
//  const unsigned 
	public native static final short RENDERING_INTENT_ABSOLUTE_COLORIMETRIC = 5;
}

public native interface SVGDocument extends Document,
                        DocumentEvent {
//  readonly attribute 
	public native String title{}
//  readonly attribute 
	public native String referrer{}
//  readonly attribute 
	public native String domain{}
//  readonly attribute 
	public native String URL{}
//  readonly attribute 
	public native SVGSVGElement rootElement{}
}

public native interface SVGSVGElement extends SVGElement,
                          SVGTests,
                          SVGLangSpace,
                          SVGExternalResourcesRequired,
                          SVGStylable,
                          SVGLocatable,
                          SVGFitToViewBox,
                          SVGZoomAndPan,
                          DocumentEvent,
                          ViewCSS,
                          DocumentCSS {

//  readonly attribute 
	public native SVGAnimatedLength x{}
//  readonly attribute 
	public native SVGAnimatedLength y{}
//  readonly attribute 
	public native SVGAnimatedLength width{}
//  readonly attribute
	public native SVGAnimatedLength height{}
//           attribute
	public native String contentScriptType{} // setthrows DOMException;
//           attribute 
	public native String contentStyleType{} // setthrows DOMException;
//  readonly attribute 
	public native SVGRect viewport{}
//  readonly attribute 
	public native float pixelUnitToMillimeterX{}
//  readonly attribute 
	public native float pixelUnitToMillimeterY{}
//  readonly attribute 
	public native float screenPixelToMillimeterX{}
//  readonly attribute 
	public native float screenPixelToMillimeterY{}
//  readonly attribute 
	public native boolean useCurrentView{}
//  readonly attribute 
	public native SVGViewSpec currentView{}
//           attribute
	public native float currentScale{}
//  readonly attribute 
	public native SVGPoint currentTranslate{}

  /*unsigned*/ 
	public native long suspendRedraw(final /*unsigned*/ long maxWaitMilliseconds);
    public native void unsuspendRedraw(final /*unsigned*/ long suspendHandleID);
    public native void unsuspendRedrawAll();
    public native void forceRedraw();
    public native void pauseAnimations();
    public native void unpauseAnimations();
    public native boolean animationsPaused();
    public native float getCurrentTime();
    public native void setCurrentTime(final float seconds);
    public native NodeList getIntersectionList(final SVGRect rect, final SVGElement referenceElement);
    public native NodeList getEnclosureList(final SVGRect rect, final SVGElement referenceElement);
  	public native boolean checkIntersection(final SVGElement element, final SVGRect rect);
  	public native boolean checkEnclosure(final SVGElement element, final SVGRect rect);
  	public native void deselectAll();
  	public native SVGNumber createSVGNumber();
  	public native SVGLength createSVGLength();
  	public native SVGAngle createSVGAngle();
  	public native SVGPoint createSVGPoint();
  	public native SVGMatrix createSVGMatrix();
  	public native SVGRect createSVGRect();
  	public native SVGTransform createSVGTransform();
  	public native SVGTransform createSVGTransformFromMatrix(final SVGMatrix matrix);
  	public native Element getElementById(final String elementId);
}

public native interface SVGGElement extends SVGElement,
                        SVGTests,
                        SVGLangSpace,
                        SVGExternalResourcesRequired,
                        SVGStylable,
                        SVGTransformable {
}

public native interface SVGDefsElement extends SVGElement,
                           SVGTests,
                           SVGLangSpace,
                           SVGExternalResourcesRequired,
                           SVGStylable,
                           SVGTransformable {
}

public native interface SVGDescElement extends SVGElement,
                           SVGLangSpace,
                          SVGStylable {
}

public native interface SVGTitleElement extends SVGElement,
                            SVGLangSpace,
                            SVGStylable {
}

public native interface SVGSymbolElement extends SVGElement,
                             SVGLangSpace,
                             SVGExternalResourcesRequired,
                             SVGStylable,
                             SVGFitToViewBox {
}

public native interface SVGUseElement extends SVGElement,
                          SVGURIReference,
                          SVGTests,
                          SVGLangSpace,
                          SVGExternalResourcesRequired,
                          SVGStylable,
                          SVGTransformable {
//  readonly attribute 
	public native SVGAnimatedLength x{}
//  readonly attribute 
	public native SVGAnimatedLength y{}
//  readonly attribute 
	public native SVGAnimatedLength width{}
//  readonly attribute 
	public native SVGAnimatedLength height{}
//  readonly attribute 
	public native SVGElementInstance instanceRoot{}
//  readonly attribute 
	public native SVGElementInstance animatedInstanceRoot{}
}

public native interface SVGElementInstance extends EventTarget {
//  readonly attribute 
	public native SVGElement correspondingElement{}
//  readonly attribute 
	public native SVGUseElement correspondingUseElement{}
//  readonly attribute 
	public native SVGElementInstance parentNode{}
//  readonly attribute 
	public native SVGElementInstanceList childNodes{}
//  readonly attribute 
	public native SVGElementInstance firstChild{}
//  readonly attribute 
	public native SVGElementInstance lastChild{}
//  readonly attribute 
	public native SVGElementInstance previousSibling{}
//  readonly attribute 
	public native SVGElementInstance nextSibling{}
}

public native interface SVGElementInstanceList {

//  readonly attribute unsigned 
	public native long length{}

	public native SVGElementInstance item(final /*unsigned*/ long index);
}

public native interface SVGImageElement extends SVGElement,
                            SVGURIReference,
                            SVGTests,
                            SVGLangSpace,
                            SVGExternalResourcesRequired,
                            SVGStylable,
                            SVGTransformable {
//  readonly attribute 
	public native SVGAnimatedLength x{}
//  readonly attribute
	public native SVGAnimatedLength y{}
//  readonly attribute
	public native SVGAnimatedLength width{}
//  readonly attribute 
	public native SVGAnimatedLength height{}
//  readonly attribute 
	public native SVGAnimatedPreserveAspectRatio preserveAspectRatio{}
}

public native interface SVGSwitchElement extends SVGElement,
                             SVGTests,
                             SVGLangSpace,
                             SVGExternalResourcesRequired,
                             SVGStylable,
                             SVGTransformable {
}

public native interface GetSVGDocument {
	public native SVGDocument getSVGDocument();
}

public native interface SVGStyleElement extends SVGElement,
                            SVGLangSpace {
//  attribute 
	public native String type{} // setthrows DOMException;
//  attribute 
	public native String media{} // setthrows DOMException;
//  attribute 
	public native String title{} // setthrows DOMException;
}

public native interface SVGPoint {

//  attribute 
	public native float x{} // setthrows DOMException;
//  attribute 
	public native float y{} //setthrows DOMException;

	public native SVGPoint matrixTransform(final SVGMatrix matrix);
}

public native interface SVGPointList {

//  readonly attribute unsigned 
	public native long numberOfItems{}

	public native void clear() throws DOMException;
	public native SVGPoint initialize(final SVGPoint newItem) throws DOMException;
	public native SVGPoint getItem(final /*unsigned*/ long index) throws DOMException;
	public native SVGPoint insertItemBefore(final SVGPoint newItem, final /*unsigned*/ long index) throws DOMException;
	public native SVGPoint replaceItem(final SVGPoint newItem, final /*unsigned*/ long index) throws DOMException;
	public native SVGPoint removeItem(final /*unsigned*/ long index) throws DOMException;
	public native SVGPoint appendItem(final SVGPoint newItem) throws DOMException;
}

public native interface SVGMatrix {

//  attribute 
	public native float a{} // setthrows DOMException;
//  attribute
	public native float b{} // setthrows DOMException;
//  attribute 
	public native float c{} // setthrows DOMException;
//  attribute
	public native float d{} // setthrows DOMException;
//  attribute
	public native float e{} // setthrows DOMException;
//  attribute
	public native float f{} // setthrows DOMException;

	public native SVGMatrix multiply(final SVGMatrix secondMatrix);
	public native SVGMatrix inverse() throws SVGException;
	public native SVGMatrix translate(final float x, final float y);
	public native SVGMatrix scale(final float scaleFactor);
	public native SVGMatrix scaleNonUniform(final float scaleFactorX, final float scaleFactorY);
	public native SVGMatrix rotate(final float angle);
	public native SVGMatrix rotateFromVector(final float x, final float y) throws SVGException;
	public native SVGMatrix flipX();
	public native SVGMatrix flipY();
	public native SVGMatrix skewX(final float angle);
	public native SVGMatrix skewY(final float angle);
}

public native interface SVGTransform {

  // Transform Types
//  const unsigned
	public native final static short SVG_TRANSFORM_UNKNOWN = 0;
//  const unsigned 
	public native final static short SVG_TRANSFORM_MATRIX = 1;
//  const unsigned 
	public native final static short SVG_TRANSFORM_TRANSLATE = 2;
//  const unsigned 
	public native final static short SVG_TRANSFORM_SCALE = 3;
//  const unsigned 
	public native final static short SVG_TRANSFORM_ROTATE = 4;
//  const unsigned 
	public native final static short SVG_TRANSFORM_SKEWX = 5;
//  const unsigned 
	public native final static short SVG_TRANSFORM_SKEWY = 6;

//	readonly attribute unsigned 
	public native short type{}
//	readonly attribute 
	public native SVGMatrix matrix{}
//	readonly attribute 
	public native float angle{}

	public native void setMatrix(final SVGMatrix matrix) throws DOMException;
	public native void setTranslate(final float tx, final float ty) throws DOMException;
	public native void setScale(final float sx, final float sy) throws DOMException;
	public native void setRotate(final float angle, final float cx, final float cy) throws DOMException;
	public native void setSkewX(final float angle) throws DOMException;
	public native void setSkewY(final float angle) throws DOMException;
}

public native interface SVGTransformList {

//  readonly attribute unsigned 
	public native long numberOfItems{}

	public native void clear() throws DOMException;
	public native SVGTransform initialize(final SVGTransform newItem) throws DOMException;
	public native SVGTransform getItem(final /*unsigned*/ long index) throws DOMException;
	public native SVGTransform insertItemBefore(final SVGTransform newItem, final /*unsigned*/ long index) throws DOMException;
	public native SVGTransform replaceItem(final SVGTransform newItem, final /*unsigned*/ long index) throws DOMException;
	public native SVGTransform removeItem(final /*unsigned*/ long index) throws DOMException;
	public native SVGTransform appendItem(final SVGTransform newItem) throws DOMException;
	public native SVGTransform createSVGTransformFromMatrix(final SVGMatrix matrix);
	public native SVGTransform consolidate() throws DOMException;
}

public native interface SVGAnimatedTransformList {
//  readonly attribute 
	public native SVGTransformList baseVal{}
//  readonly attribute 
	public native SVGTransformList animVal{}
}

public native interface SVGPreserveAspectRatio {

  // Alignment Types
//  const unsigned 
	public native static final short SVG_PRESERVEASPECTRATIO_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_PRESERVEASPECTRATIO_NONE = 1;
//  const unsigned 
	public native static final short SVG_PRESERVEASPECTRATIO_XMINYMIN = 2;
//  const unsigned 
	public native static final short SVG_PRESERVEASPECTRATIO_XMIDYMIN = 3;
//  const unsigned 
	public native static final short SVG_PRESERVEASPECTRATIO_XMAXYMIN = 4;
//  const unsigned 
	public native static final short SVG_PRESERVEASPECTRATIO_XMINYMID = 5;
//  const unsigned 
	public native static final short SVG_PRESERVEASPECTRATIO_XMIDYMID = 6;
//  const unsigned 
	public native static final short SVG_PRESERVEASPECTRATIO_XMAXYMID = 7;
//  const unsigned 
	public native static final short SVG_PRESERVEASPECTRATIO_XMINYMAX = 8;
//  const unsigned 
	public native static final short SVG_PRESERVEASPECTRATIO_XMIDYMAX = 9;
//  const unsigned 
	public native static final short SVG_PRESERVEASPECTRATIO_XMAXYMAX = 10;

  // Meet-or-slice Types
//  const unsigned 
	public native static final short SVG_MEETORSLICE_UNKNOWN = 0;
//  const unsigned public static final 
	public native short SVG_MEETORSLICE_MEET = 1;
//  const unsigned 
	public native static final short SVG_MEETORSLICE_SLICE = 2;

//  attribute unsigned 
	public native short align{} // setthrows DOMException;
//  attribute unsigned 
	public native short meetOrSlice{} // setthrows DOMException;
}

public native interface SVGAnimatedPreserveAspectRatio {
//  readonly attribute 
	public native SVGPreserveAspectRatio baseVal{}
//  readonly attribute 
	public native SVGPreserveAspectRatio animVal{}
}

public native interface SVGPathSeg {

  // Path Segment Types
//  const unsigned 
	public native static final short PATHSEG_UNKNOWN = 0;
//  const unsigned 
	public native static final short PATHSEG_CLOSEPATH = 1;
//  const unsigned 
	public native static final short PATHSEG_MOVETO_ABS = 2;
//  const unsigned 
	public native static final short PATHSEG_MOVETO_REL = 3;
//  const unsigned 
	public native static final short PATHSEG_LINETO_ABS = 4;
//  const unsigned 
	public native static final short PATHSEG_LINETO_REL = 5;
//  const unsigned 
	public native static final short PATHSEG_CURVETO_CUBIC_ABS = 6;
//  const unsigned 
	public native static final short PATHSEG_CURVETO_CUBIC_REL = 7;
//  const unsigned 
	public native static final short PATHSEG_CURVETO_QUADRATIC_ABS = 8;
//  const unsigned 
	public native static final short PATHSEG_CURVETO_QUADRATIC_REL = 9;
//  const unsigned 
	public native static final short PATHSEG_ARC_ABS = 10;
//  const unsigned 
	public native static final short PATHSEG_ARC_REL = 11;
//  const unsigned 
	public native static final short PATHSEG_LINETO_HORIZONTAL_ABS = 12;
//  const unsigned 
	public native static final short PATHSEG_LINETO_HORIZONTAL_REL = 13;
//  const unsigned 
	public native static final short PATHSEG_LINETO_VERTICAL_ABS = 14;
//  const unsigned
	public native static final short PATHSEG_LINETO_VERTICAL_REL = 15;
//  const unsigned 
	public native static final short PATHSEG_CURVETO_CUBIC_SMOOTH_ABS = 16;
//  const unsigned
	public native static final short PATHSEG_CURVETO_CUBIC_SMOOTH_REL = 17;
//  const unsigned 
	public native static final short PATHSEG_CURVETO_QUADRATIC_SMOOTH_ABS = 18;
//  const unsigned 
	public native static final short PATHSEG_CURVETO_QUADRATIC_SMOOTH_REL = 19;

//  readonly attribute unsigned
	public native short pathSegType{}
//  readonly attribute 
	public native String pathSegTypeAsLetter{}
}

public native interface SVGPathSegClosePath extends SVGPathSeg {
}

public native interface SVGPathSegMovetoAbs extends SVGPathSeg {
//  attribute 
	public native float x{} //setthrows DOMException;
//  attribute 
	public native float y{} //setthrows DOMException;
}

public native interface SVGPathSegMovetoRel extends SVGPathSeg {
//  attribute 
	public native float x{} //setthrows DOMException;
//  attribute 
	public native float y{} //setthrows DOMException;
}

public native interface SVGPathSegLinetoAbs extends SVGPathSeg {
//  attribute 
	public native float x{} //setthrows DOMException;
//  attribute 
	public native float y{} //setthrows DOMException;
}

public native interface SVGPathSegLinetoRel extends SVGPathSeg {
//  attribute
	public float x{} //setthrows DOMException;
//  attribute
	public float y{} //setthrows DOMException;
}

public native interface SVGPathSegCurvetoCubicAbs extends SVGPathSeg {
//  attribute 
	public native float x{} //setthrows DOMException;
//  attribute 
	public native float y{} //setthrows DOMException;
//  attribute
	public native float x1{} //setthrows DOMException;
//  attribute
	public native float y1{} //setthrows DOMException;
//  attribute
	public native float x2{} //setthrows DOMException;
//  attribute
	public native float y2{} //setthrows DOMException;
}

public native interface SVGPathSegCurvetoCubicRel extends SVGPathSeg {
//  attribute
	public native float x{} // setthrows DOMException;
//  attribute
	public native float y{} // setthrows DOMException;
//  attribute
	public native float x1{} // setthrows DOMException;
//  attribute
	public native float y1{} // setthrows DOMException;
//  attribute
	public native float x2{} // setthrows DOMException;
//  attribute
	public native float y2{} // setthrows DOMException;
}

public native interface SVGPathSegCurvetoQuadraticAbs extends SVGPathSeg {
//  attribute
	public native float x{} // setthrows DOMException;
//  attribute
	public native float y{} // setthrows DOMException;
//  attribute
	public native float x1{} // setthrows DOMException;
//  attribute
	public native float y1{} // setthrows DOMException;
}

public native interface SVGPathSegCurvetoQuadraticRel extends SVGPathSeg {
//  attribute
	public native float x{} // setthrows DOMException;
//  attribute
	public native float y{} // setthrows DOMException;
//  attribute
	public native float x1{} // setthrows DOMException;
//  attribute
	public native float y1{} // setthrows DOMException;
}

public native interface SVGPathSegArcAbs extends SVGPathSeg {
//  attribute
	public native float x{} // setthrows DOMException;
//  attribute
	public native float y{} // setthrows DOMException;
//  attribute
	public native float r1{} // setthrows DOMException;
//  attribute
	public native float r2{} // setthrows DOMException;
//  attribute
	public native float angle{} // setthrows DOMException;
//  attribute
	public native boolean largeArcFlag{} // setthrows DOMException;
//  attribute
	public native boolean sweepFlag{} // setthrows DOMException;
}

public native interface SVGPathSegArcRel extends SVGPathSeg {
//  attribute 
	public native float x{} // setthrows DOMException;
//  attribute
	public native float y{} // setthrows DOMException;
//  attribute
	public native float r1{} // setthrows DOMException;
//  attribute
	public native float r2{} // setthrows DOMException;
//  attribute
	public native float angle{} // setthrows DOMException;
//  attribute
	public native boolean largeArcFlag{} // setthrows DOMException;
//  attribute
	public native boolean sweepFlag{} // setthrows DOMException;
}

public native interface SVGPathSegLinetoHorizontalAbs extends SVGPathSeg {
//  attribute
	public native float x{} // setthrows DOMException;
}

public native interface SVGPathSegLinetoHorizontalRel extends SVGPathSeg {
//  attribute
	public native float x{} // setthrows DOMException;
}

public native interface SVGPathSegLinetoVerticalAbs extends SVGPathSeg {
//  attribute
	public native float y{} // setthrows DOMException;
}

public native interface SVGPathSegLinetoVerticalRel extends SVGPathSeg {
//  attribute
	public native float y{} // setthrows DOMException;
}

public native interface SVGPathSegCurvetoCubicSmoothAbs extends SVGPathSeg {
//  attribute
	public native float x{} // setthrows DOMException;
//  attribute
	public native float y{} // setthrows DOMException;
//  attribute
	public native float x2{} // setthrows DOMException;
//  attribute
	public native float y2{} // setthrows DOMException;
}

public native interface SVGPathSegCurvetoCubicSmoothRel extends SVGPathSeg {
//  attribute
	public native float x{} // setthrows DOMException;
//  attribute
	public native float y{} // setthrows DOMException;
//  attribute
	public native float x2{} // setthrows DOMException;
//  attribute
	public native float y2{} // setthrows DOMException;
}

public native interface SVGPathSegCurvetoQuadraticSmoothAbs extends SVGPathSeg {
//  attribute 
	public native float x{} // setthrows DOMException;
//  attribute
	public native float y{} // setthrows DOMException;
}

public native interface SVGPathSegCurvetoQuadraticSmoothRel extends SVGPathSeg {
//  attribute
	public native float x{} // setthrows DOMException;
//  attribute
	public native float y{} // setthrows DOMException;
}

public native interface SVGPathSegList {

//  readonly attribute unsigned 
	public native long numberOfItems{}

	public native void clear() throws DOMException;
	public native SVGPathSeg initialize(final SVGPathSeg newItem) throws DOMException;
	public native SVGPathSeg getItem(final /*unsigned*/ long index) throws DOMException;
	public native SVGPathSeg insertItemBefore(final SVGPathSeg newItem, final /*unsigned*/ long index) throws DOMException;
	public native SVGPathSeg replaceItem(final SVGPathSeg newItem, final /*unsigned*/ long index) throws DOMException;
	public native SVGPathSeg removeItem(final /*unsigned*/ long index) throws DOMException;
	public native SVGPathSeg appendItem(final SVGPathSeg newItem) throws DOMException;
}

public native interface SVGAnimatedPathData {
//  readonly attribute 
	public native SVGPathSegList pathSegList{}
//  readonly attribute 
	public native SVGPathSegList normalizedPathSegList{}
//  readonly attribute 
	public native SVGPathSegList animatedPathSegList{}
//  readonly attribute 
	public native SVGPathSegList animatedNormalizedPathSegList{}
}

public native interface SVGPathElement extends SVGElement,
                           SVGTests,
                           SVGLangSpace,
                           SVGExternalResourcesRequired,
                           SVGStylable,
                           SVGTransformable,
                           SVGAnimatedPathData {

//  readonly attribute 
	public native SVGAnimatedNumber pathLength{}

	public native float getTotalLength();
	public native SVGPoint getPointAtLength(final float distance);
  /*unsigned*/ 
	public native long getPathSegAtLength(final float distance);
	public native SVGPathSegClosePath createSVGPathSegClosePath();
	public native SVGPathSegMovetoAbs createSVGPathSegMovetoAbs(final float x, final float y);
	public native SVGPathSegMovetoRel createSVGPathSegMovetoRel(final float x, final float y);
	public native SVGPathSegLinetoAbs createSVGPathSegLinetoAbs(final float x, final float y);
	public native SVGPathSegLinetoRel createSVGPathSegLinetoRel(final float x, final float y);
	public native SVGPathSegCurvetoCubicAbs createSVGPathSegCurvetoCubicAbs(final float x, final float y, final float x1, final float y1, final float x2, final float y2);
	public native SVGPathSegCurvetoCubicRel createSVGPathSegCurvetoCubicRel(final float x, final float y, final float x1, final float y1, final float x2, final float y2);
	public native SVGPathSegCurvetoQuadraticAbs createSVGPathSegCurvetoQuadraticAbs(final float x, final float y, final float x1, final float y1);
	public native SVGPathSegCurvetoQuadraticRel createSVGPathSegCurvetoQuadraticRel(final float x, final float y, final float x1, final float y1);
	public native SVGPathSegArcAbs createSVGPathSegArcAbs(final float x, final float y, final float r1, final float r2, final float angle, final boolean largeArcFlag, final boolean sweepFlag);
	public native SVGPathSegArcRel createSVGPathSegArcRel(final float x, final float y, final float r1, final float r2, final float angle, final boolean largeArcFlag, final boolean sweepFlag);
	public native SVGPathSegLinetoHorizontalAbs createSVGPathSegLinetoHorizontalAbs(final float x);
	public native SVGPathSegLinetoHorizontalRel createSVGPathSegLinetoHorizontalRel(final float x);
	public native SVGPathSegLinetoVerticalAbs createSVGPathSegLinetoVerticalAbs(final float y);
	public native SVGPathSegLinetoVerticalRel createSVGPathSegLinetoVerticalRel(final float y);
	public native SVGPathSegCurvetoCubicSmoothAbs createSVGPathSegCurvetoCubicSmoothAbs(final float x, final float y, final float x2, final float y2);
	public native SVGPathSegCurvetoCubicSmoothRel createSVGPathSegCurvetoCubicSmoothRel(final float x, final float y, final float x2, final float y2);
	public native SVGPathSegCurvetoQuadraticSmoothAbs createSVGPathSegCurvetoQuadraticSmoothAbs(final float x, final float y);
	public native SVGPathSegCurvetoQuadraticSmoothRel createSVGPathSegCurvetoQuadraticSmoothRel(final float x, final float y);
}

public native interface SVGRectElement extends SVGElement,
                           SVGTests,
                           SVGLangSpace,
                           SVGExternalResourcesRequired,
                           SVGStylable,
                           SVGTransformable {
//  readonly attribute 
	public native SVGAnimatedLength x{}
//  readonly attribute 
	public native SVGAnimatedLength y{}
//  readonly attribute 
	public native SVGAnimatedLength width{}
//  readonly attribute 
	public native SVGAnimatedLength height{}
//  readonly attribute 
	public native SVGAnimatedLength rx{}
//  readonly attribute 
	public native SVGAnimatedLength ry{}
}

public native interface SVGCircleElement extends SVGElement,
                             SVGTests,
                             SVGLangSpace,
                             SVGExternalResourcesRequired,
                             SVGStylable,
                             SVGTransformable {
//  readonly attribute 
	public native SVGAnimatedLength cx{}
//  readonly attribute 
	public native SVGAnimatedLength cy{}
//  readonly attribute 
	public native SVGAnimatedLength r{}
}

public native interface SVGEllipseElement extends SVGElement,
                              SVGTests,
                              SVGLangSpace,
                              SVGExternalResourcesRequired,
                              SVGStylable,
                              SVGTransformable {
//  readonly attribute 
	public native SVGAnimatedLength cx{}
//  readonly attribute 
	public native SVGAnimatedLength cy{}
//  readonly attribute 
	public native SVGAnimatedLength rx{}
//  readonly attribute 
	public native SVGAnimatedLength ry{}
}

public native interface SVGLineElement extends SVGElement,
                           SVGTests,
                           SVGLangSpace,
                           SVGExternalResourcesRequired,
                           SVGStylable,
                           SVGTransformable {
//  readonly attribute
	public native SVGAnimatedLength x1{}
//  readonly attribute 
	public native SVGAnimatedLength y1{}
//  readonly attribute
	public native SVGAnimatedLength x2{}
//  readonly attribute 
	public native SVGAnimatedLength y2{}
}

public native interface SVGAnimatedPoints {
//  readonly attribute 
	public native SVGPointList points{}
//  readonly attribute 
	public native SVGPointList animatedPoints{}
}

public native interface SVGPolylineElement extends SVGElement,
                               SVGTests,
                               SVGLangSpace,
                               SVGExternalResourcesRequired,
                               SVGStylable,
                               SVGTransformable,
                               SVGAnimatedPoints {
}

public native interface SVGPolygonElement extends SVGElement,
                              SVGTests,
                              SVGLangSpace,
                              SVGExternalResourcesRequired,
                              SVGStylable,
                              SVGTransformable,
                              SVGAnimatedPoints {
}

public native interface SVGTextContentElement extends SVGElement,
                                  SVGTests,
                                  SVGLangSpace,
                                  SVGExternalResourcesRequired,
                                  SVGStylable {

  // lengthAdjust Types
//  const unsigned 
	public native static final short LENGTHADJUST_UNKNOWN = 0;
//  const unsigned 
	public native static final short LENGTHADJUST_SPACING = 1;
//  const unsigned 
	public native static final short LENGTHADJUST_SPACINGANDGLYPHS = 2;

//  readonly attribute 
	public native SVGAnimatedLength textLength{}
//  readonly attribute 
	public native SVGAnimatedEnumeration lengthAdjust{}

	public native long getNumberOfChars();
	public native float getComputedTextLength();
	public native float getSubStringLength(final /*unsigned*/ long charnum, final /*unsigned*/ long nchars) throws DOMException;
	public native SVGPoint getStartPositionOfChar(final /*unsigned*/ long charnum) throws DOMException;
	public native SVGPoint getEndPositionOfChar(final /*unsigned*/ long charnum) throws DOMException;
	public native SVGRect getExtentOfChar(final /*unsigned*/ long charnum) throws DOMException;
	public native float getRotationOfChar(final /*unsigned*/ long charnum) throws DOMException;
	public native long getCharNumAtPosition(final SVGPoint point);
	public native void selectSubString(final /*unsigned*/ long charnum, final /*unsigned*/ long nchars) throws DOMException;
}

public native interface SVGTextPositioningElement extends SVGTextContentElement {
//  readonly attribute 
	public native SVGAnimatedLengthList x{}
//  readonly attribute 
	public native SVGAnimatedLengthList y{}
//  readonly attribute 
	public native SVGAnimatedLengthList dx{}
//  readonly attribute 
	public native SVGAnimatedLengthList dy{}
//  readonly attribute 
	public native SVGAnimatedNumberList rotate{}
}

public native interface SVGTextElement extends SVGTextPositioningElement,
                           SVGTransformable {
}

public native interface SVGTSpanElement extends SVGTextPositioningElement {
}

public native interface SVGTRefElement extends SVGTextPositioningElement,
                           SVGURIReference {
}

public native interface SVGTextPathElement extends SVGTextContentElement,
                               SVGURIReference {

  // textPath Method Types
//  const unsigned short 
	public native static final short TEXTPATH_METHODTYPE_UNKNOWN = 0;
//  const unsigned 
	public native static final short TEXTPATH_METHODTYPE_ALIGN = 1;
//  const unsigned
	public native static final short TEXTPATH_METHODTYPE_STRETCH = 2;

  // textPath Spacing Types
//  const unsigned
	public native static final short TEXTPATH_SPACINGTYPE_UNKNOWN = 0;
//  const unsigned
	public native static final short TEXTPATH_SPACINGTYPE_AUTO = 1;
//  const unsigned 
	public native static final short TEXTPATH_SPACINGTYPE_EXACT = 2;

//  readonly attribute 
	public native SVGAnimatedLength startOffset{}
//  readonly attribute
	public native SVGAnimatedEnumeration method{}
//  readonly attribute 
	public native SVGAnimatedEnumeration spacing{}
}

public native interface SVGAltGlyphElement extends SVGTextPositioningElement,
                               SVGURIReference {
//  attribute 
	public native String glyphRef{} // setthrows DOMException;
//  attribute 
	public native String format{} // setthrows DOMException;
}

public native interface SVGAltGlyphDefElement extends SVGElement {
}

public native interface SVGAltGlyphItemElement extends SVGElement {
}

public native interface SVGGlyphRefElement extends SVGElement,
                               SVGURIReference,
                               SVGStylable {
//  attribute 
	public native String glyphRef{} // setthrows DOMException;
//  attribute 
	public native String format{} // setthrows DOMException;
//  attribute
	public native float x{} // setthrows DOMException;
//  attribute 
	public native float y{} // setthrows DOMException;
//  attribute
	public native float dx{} // setthrows DOMException;
//  attribute
	public native float dy{} // setthrows DOMException;
}

public native interface SVGPaint extends SVGColor {

  // Paint Types
//  const unsigned 
	public native static final short SVG_PAINTTYPE_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_PAINTTYPE_RGBCOLOR = 1;
//  const unsigned 
	public native static final short SVG_PAINTTYPE_RGBCOLOR_ICCCOLOR = 2;
//  const unsigned 
	public native static final short SVG_PAINTTYPE_NONE = 101;
//  const unsigned 
	public native static final short SVG_PAINTTYPE_CURRENTCOLOR = 102;
//  const unsigned 
	public native static final short SVG_PAINTTYPE_URI_NONE = 103;
//  const unsigned
	public native static final short SVG_PAINTTYPE_URI_CURRENTCOLOR = 104;
//  const unsigned 
	public native static final short SVG_PAINTTYPE_URI_RGBCOLOR = 105;
//  const unsigned 
	public native static final short SVG_PAINTTYPE_URI_RGBCOLOR_ICCCOLOR = 106;
//  const unsigned 
	public native static final short SVG_PAINTTYPE_URI = 107;

//  readonly attribute unsigned 
	public native short paintType{}
//  readonly attribute 
	public native String uri{}

	public native void setUri(final String uri);
	public native void setPaint(final /*unsigned*/ short paintType, final String uri, final String rgbColor, final String iccColor) throws SVGException;
}

public native interface SVGMarkerElement extends SVGElement,
                             SVGLangSpace,
                             SVGExternalResourcesRequired,
                             SVGStylable,
                             SVGFitToViewBox {

  // Marker Unit Types
//  const unsigned 
	public native static final short SVG_MARKERUNITS_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_MARKERUNITS_USERSPACEONUSE = 1;
//  const unsigned 
	public native static final short SVG_MARKERUNITS_STROKEWIDTH = 2;

  // Marker Orientation Types
//  const unsigned 
	public native static final short SVG_MARKER_ORIENT_UNKNOWN = 0;
//  const unsigned
	public native static final short SVG_MARKER_ORIENT_AUTO = 1;
//  const unsigned 
	public native static final short SVG_MARKER_ORIENT_ANGLE = 2;

//  readonly attribute 
	public native SVGAnimatedLength refX{}
//  readonly attribute 
	public native SVGAnimatedLength refY{}
//  readonly attribute
	public native SVGAnimatedEnumeration markerUnits{}
//  readonly attribute 
	public native SVGAnimatedLength markerWidth{}
//  readonly attribute 
	public native SVGAnimatedLength markerHeight{}
//  readonly attribute 
	public native SVGAnimatedEnumeration orientType{}
//  readonly attribute 
	public native SVGAnimatedAngle orientAngle{}

	public native void setOrientToAuto() throws DOMException;
	public native void setOrientToAngle(final SVGAngle angle) throws DOMException;
}

public native interface SVGColorProfileElement extends SVGElement,
                                   SVGURIReference,
                                   SVGRenderingIntent {
//  attribute 
	public native String local{}
//  attribute
	public native String name{}
//  attribute unsigned
	public native short renderingIntent{}
}

public native interface SVGColorProfileRule extends SVGCSSRule,
                                SVGRenderingIntent {
//  attribute 
	public native String src{} // setthrows DOMException;
//  attribute 
	public native String name{} // setthrows DOMException;
//  attribute unsigned 
	public native short renderingIntent{} // setthrows DOMException;
}

public native interface SVGGradientElement extends SVGElement,
                               SVGURIReference,
                               SVGExternalResourcesRequired,
                               SVGStylable,
                               SVGUnitTypes {

  // Spread Method Types
//  const unsigned 
	public native static final short SVG_SPREADMETHOD_UNKNOWN = 0;
//  const unsigned
	public native static final short SVG_SPREADMETHOD_PAD = 1;
//  const unsigned 
	public native static final short SVG_SPREADMETHOD_REFLECT = 2;
//  const unsigned
	public native static final short SVG_SPREADMETHOD_REPEAT = 3;

//  readonly attribute 
	public native SVGAnimatedEnumeration gradientUnits{}
//  readonly attribute 
	public native SVGAnimatedTransformList gradientTransform{}
//  readonly attribute 
	public native SVGAnimatedEnumeration spreadMethod{}
}

public native interface SVGLinearGradientElement extends SVGGradientElement {
//  readonly attribute 
	public native SVGAnimatedLength x1{}
//  readonly attribute 
	public native SVGAnimatedLength y1{}
//  readonly attribute 
	public native SVGAnimatedLength x2{}
//  readonly attribute 
	public native SVGAnimatedLength y2{}
}

public native interface SVGRadialGradientElement extends SVGGradientElement {
//  readonly attribute 
	public native SVGAnimatedLength cx{}
//  readonly attribute 
	public native SVGAnimatedLength cy{}
//  readonly attribute 
	public native SVGAnimatedLength r{}
//  readonly attribute 
	public native SVGAnimatedLength fx{}
//  readonly attribute 
	public native SVGAnimatedLength fy{}
}

public native interface SVGStopElement extends SVGElement,
                           SVGStylable {
//  readonly attribute 
	public native SVGAnimatedNumber offset{}
}

public native interface SVGPatternElement extends SVGElement,
                              SVGURIReference,
                              SVGTests,
                              SVGLangSpace,
                              SVGExternalResourcesRequired,
                              SVGStylable,
                              SVGFitToViewBox,
                              SVGUnitTypes {
//  readonly attribute 
	public native SVGAnimatedEnumeration patternUnits{}
//  readonly attribute 
	public native SVGAnimatedEnumeration patternContentUnits{}
//  readonly attribute 
	public native SVGAnimatedTransformList patternTransform{}
//  readonly attribute 
	public native SVGAnimatedLength x{}
//  readonly attribute 
	public native SVGAnimatedLength y{}
//  readonly attribute 
	public native SVGAnimatedLength width{}
//  readonly attribute 
	public native SVGAnimatedLength height{}
}

public native interface SVGClipPathElement extends SVGElement,
                               SVGTests,
                               SVGLangSpace,
                               SVGExternalResourcesRequired,
                               SVGStylable,
                               SVGTransformable,
                               SVGUnitTypes {
//  readonly attribute 
	public native SVGAnimatedEnumeration clipPathUnits{}
}

public native interface SVGMaskElement extends SVGElement,
                           SVGTests,
                           SVGLangSpace,
                           SVGExternalResourcesRequired,
                           SVGStylable,
                           SVGUnitTypes {
//  readonly attribute 
	public native SVGAnimatedEnumeration maskUnits{}
//  readonly attribute 
	public native SVGAnimatedEnumeration maskContentUnits{}
//  readonly attribute 
	public native SVGAnimatedLength x{}
//  readonly attribute 
	public native SVGAnimatedLength y{}
//  readonly attribute 
	public native SVGAnimatedLength width{}
//  readonly attribute 
	public native SVGAnimatedLength height{}
}

public native interface SVGFilterElement extends SVGElement,
                             SVGURIReference,
                             SVGLangSpace,
                             SVGExternalResourcesRequired,
                             SVGStylable,
                             SVGUnitTypes {

//  readonly attribute 
	public native SVGAnimatedEnumeration filterUnits{}
//  readonly attribute
	public native SVGAnimatedEnumeration primitiveUnits{}
//  readonly attribute
	public native SVGAnimatedLength x{}
//  readonly attribute 
	public native SVGAnimatedLength y{}
//  readonly attribute 
	public native SVGAnimatedLength width{}
//  readonly attribute 
	public native SVGAnimatedLength height{}
//  readonly attribute 
	public native SVGAnimatedInteger filterResX{}
//  readonly attribute 
	public native SVGAnimatedInteger filterResY{}

	public native void setFilterRes(final /*unsigned*/ long filterResX, final /*unsigned*/ long filterResY) throws DOMException;
}

public native interface SVGFilterPrimitiveStandardAttributes extends SVGStylable {
//  readonly attribute 
	public native SVGAnimatedLength x{}
//  readonly attribute 
	public native SVGAnimatedLength y{}
//  readonly attribute 
	public native SVGAnimatedLength width{}
//  readonly attribute 
	public native SVGAnimatedLength height{}
//  readonly attribute 
	public native SVGAnimatedString result{}
}

public native interface SVGFEBlendElement extends SVGElement,
                              SVGFilterPrimitiveStandardAttributes {

  // Blend Mode Types
//  const unsigned 
	public native static final short SVG_FEBLEND_MODE_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_FEBLEND_MODE_NORMAL = 1;
//  const unsigned 
	public native static final short SVG_FEBLEND_MODE_MULTIPLY = 2;
//  const unsigned 
	public native static final short SVG_FEBLEND_MODE_SCREEN = 3;
//  const unsigned 
	public native static final short SVG_FEBLEND_MODE_DARKEN = 4;
//  const unsigned 
	public native static final short SVG_FEBLEND_MODE_LIGHTEN = 5;

//  readonly attribute 
	public native SVGAnimatedString in1{}
//  readonly attribute 
	public native SVGAnimatedString in2{}
//  readonly attribute 
	public native SVGAnimatedEnumeration mode{}
}

public native interface SVGFEColorMatrixElement extends SVGElement,
                                    SVGFilterPrimitiveStandardAttributes {

  // Color Matrix Types
//  const unsigned 
	public native static final short SVG_FECOLORMATRIX_TYPE_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_FECOLORMATRIX_TYPE_MATRIX = 1;
//  const unsigned 
	public native static final short SVG_FECOLORMATRIX_TYPE_SATURATE = 2;
//  const unsigned 
	public native static final short SVG_FECOLORMATRIX_TYPE_HUEROTATE = 3;
//  const unsigned 
	public native static final short SVG_FECOLORMATRIX_TYPE_LUMINANCETOALPHA = 4;

//  readonly attribute
	public native SVGAnimatedString in1{}
//  readonly attribute 
	public native SVGAnimatedEnumeration type{}
//  readonly attribute
	public native SVGAnimatedNumberList values{}
}

public native interface SVGFEComponentTransferElement extends SVGElement,
                                          SVGFilterPrimitiveStandardAttributes {
//  readonly attribute 
	public SVGAnimatedString in1{}
}

public native interface SVGComponentTransferFunctionElement extends SVGElement {

  // Component Transfer Types
//  const unsigned 
	public native static final short SVG_FECOMPONENTTRANSFER_TYPE_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_FECOMPONENTTRANSFER_TYPE_IDENTITY = 1;
//  const unsigned 
	public native static final short SVG_FECOMPONENTTRANSFER_TYPE_TABLE = 2;
//  const unsigned 
	public native static final short SVG_FECOMPONENTTRANSFER_TYPE_DISCRETE = 3;
//  const unsigned 
	public native static final short SVG_FECOMPONENTTRANSFER_TYPE_LINEAR = 4;
//  const unsigned 
	public native static final short SVG_FECOMPONENTTRANSFER_TYPE_GAMMA = 5;

//  readonly attribute 
	public native SVGAnimatedEnumeration type{}
//  readonly attribute
	public native SVGAnimatedNumberList tableValues{}
//  readonly attribute 
	public native SVGAnimatedNumber slope{}
//  readonly attribute 
	public native SVGAnimatedNumber intercept{}
//  readonly attribute 
	public native SVGAnimatedNumber amplitude{}
//  readonly attribute
	public native SVGAnimatedNumber exponent{}
//  readonly attribute 
	public native SVGAnimatedNumber offset{}
}

public native interface SVGFEFuncRElement extends SVGComponentTransferFunctionElement {
}

public native interface SVGFEFuncGElement extends SVGComponentTransferFunctionElement {
}

public native interface SVGFEFuncBElement extends SVGComponentTransferFunctionElement {
}

public native interface SVGFEFuncAElement extends SVGComponentTransferFunctionElement {
}

public native interface SVGFECompositeElement extends SVGElement,
                                  SVGFilterPrimitiveStandardAttributes {

  // Composite Operators
//  const unsigned 
	public native static final short SVG_FECOMPOSITE_OPERATOR_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_FECOMPOSITE_OPERATOR_OVER = 1;
//  const unsigned
	public native static final short SVG_FECOMPOSITE_OPERATOR_IN = 2;
//  const unsigned
	public native static final short SVG_FECOMPOSITE_OPERATOR_OUT = 3;
//  const unsigned 
	public native static final short SVG_FECOMPOSITE_OPERATOR_ATOP = 4;
//  const unsigned 
	public native static final short SVG_FECOMPOSITE_OPERATOR_XOR = 5;
//  const unsigned 
	public native static final short SVG_FECOMPOSITE_OPERATOR_ARITHMETIC = 6;

//  readonly attribute 
	public native SVGAnimatedString in1{}
//  readonly attribute 
	public native SVGAnimatedString in2{}
//  readonly attribute
	public native SVGAnimatedEnumeration operator{}
//  readonly attribute
	public native SVGAnimatedNumber k1{}
//  readonly attribute
	public native SVGAnimatedNumber k2{}
//  readonly attribute 
	public native SVGAnimatedNumber k3{}
//  readonly attribute
	public native SVGAnimatedNumber k4{}
}

public native interface SVGFEConvolveMatrixElement extends SVGElement,
                                       SVGFilterPrimitiveStandardAttributes {

  // Edge Mode Values
//  const unsigned 
	public native static final short SVG_EDGEMODE_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_EDGEMODE_DUPLICATE = 1;
//  const unsigned
	public native static final short SVG_EDGEMODE_WRAP = 2;
//  const unsigned 
	public native static final short SVG_EDGEMODE_NONE = 3;

//  readonly attribute 
	public native SVGAnimatedString in1{}
//  readonly attribute 
	public native SVGAnimatedInteger orderX{}
//  readonly attribute
	public native SVGAnimatedInteger orderY{}
//  readonly attribute 
	public native SVGAnimatedNumberList kernelMatrix{}
//  readonly attribute 
	public native SVGAnimatedNumber divisor{}
//  readonly attribute 
	public native SVGAnimatedNumber bias{}
//  readonly attribute 
	public native SVGAnimatedInteger targetX{}
//  readonly attribute 
	public native SVGAnimatedInteger targetY{}
//  readonly attribute 
	public native SVGAnimatedEnumeration edgeMode{}
//  readonly attribute 
	public native SVGAnimatedNumber kernelUnitLengthX{}
//  readonly attribute
	public native SVGAnimatedNumber kernelUnitLengthY{}
//  readonly attribute 
	public native SVGAnimatedBoolean preserveAlpha{}
}

public native interface SVGFEDiffuseLightingElement extends SVGElement,
                                        SVGFilterPrimitiveStandardAttributes {
//  readonly attribute 
	public native SVGAnimatedString in1{}
//  readonly attribute 
	public native SVGAnimatedNumber surfaceScale{}
//  readonly attribute
	public native SVGAnimatedNumber diffuseConstant{}
//  readonly attribute 
	public native SVGAnimatedNumber kernelUnitLengthX{}
//  readonly attribute 
	public native SVGAnimatedNumber kernelUnitLengthY{}
}

public native interface SVGFEDistantLightElement extends SVGElement {
//  readonly attribute 
	public native SVGAnimatedNumber azimuth{}
//  readonly attribute
	public native SVGAnimatedNumber elevation{}
}

public native interface SVGFEPointLightElement extends SVGElement {
//  readonly attribute 
	public native SVGAnimatedNumber x{}
//  readonly attribute 
	public native SVGAnimatedNumber y{}
//  readonly attribute
	public native SVGAnimatedNumber z{}
}

public native interface SVGFESpotLightElement extends SVGElement {
//  readonly attribute 
	public native SVGAnimatedNumber x{}
//  readonly attribute 
	public native SVGAnimatedNumber y{}
//  readonly attribute 
	public native SVGAnimatedNumber z{}
//  readonly attribute 
	public native SVGAnimatedNumber pointsAtX{}
//  readonly attribute 
	public native SVGAnimatedNumber pointsAtY{}
//  readonly attribute 
	public native SVGAnimatedNumber pointsAtZ{}
//  readonly attribute 
	public native SVGAnimatedNumber specularExponent{}
//  readonly attribute 
	public native SVGAnimatedNumber limitingConeAngle{}
}

public native interface SVGFEDisplacementMapElement extends SVGElement,
                                        SVGFilterPrimitiveStandardAttributes {

  // Channel Selectors
//  const unsigned 
	public native static final short SVG_CHANNEL_UNKNOWN = 0;
//  const unsigned
	public native static final short SVG_CHANNEL_R = 1;
//  const unsigned 
	public native static final short SVG_CHANNEL_G = 2;
//  const unsigned 
	public native static final short SVG_CHANNEL_B = 3;
//  const unsigned
	public native static final short SVG_CHANNEL_A = 4;

//  readonly attribute 
	public native SVGAnimatedString in1{}
//  readonly attribute 
	public native SVGAnimatedString in2{}
//  readonly attribute 
	public native SVGAnimatedNumber scale{}
//  readonly attribute 
	public native SVGAnimatedEnumeration xChannelSelector{}
//  readonly attribute 
	public native SVGAnimatedEnumeration yChannelSelector{}
}

public native interface SVGFEFloodElement extends SVGElement,
                              SVGFilterPrimitiveStandardAttributes {
}

public native interface SVGFEGaussianBlurElement extends SVGElement,
                                     SVGFilterPrimitiveStandardAttributes {

//  readonly attribute 
	public native SVGAnimatedString in1{}
//  readonly attribute 
	public native SVGAnimatedNumber stdDeviationX{}
//  readonly attribute 
	public native SVGAnimatedNumber stdDeviationY{}

	public native void setStdDeviation(final float stdDeviationX, final float stdDeviationY) throws DOMException;
}

public native interface SVGFEImageElement extends SVGElement,
                              SVGURIReference,
                              SVGLangSpace,
                              SVGExternalResourcesRequired,
                              SVGFilterPrimitiveStandardAttributes {
//  readonly attribute 
	public native SVGAnimatedPreserveAspectRatio preserveAspectRatio{}
}

public native interface SVGFEMergeElement extends SVGElement,
                              SVGFilterPrimitiveStandardAttributes {
}

public native interface SVGFEMergeNodeElement extends SVGElement {
//  readonly attribute
	public native SVGAnimatedString in1{}
}

public native interface SVGFEMorphologyElement extends SVGElement,
                                   SVGFilterPrimitiveStandardAttributes {

  // Morphology Operators
//  const unsigned 
	public native static final short SVG_MORPHOLOGY_OPERATOR_UNKNOWN = 0;
//  const unsigned
	public native static final short SVG_MORPHOLOGY_OPERATOR_ERODE = 1;
//  const unsigned 
	public native static final short SVG_MORPHOLOGY_OPERATOR_DILATE = 2;

//  readonly attribute
	public native SVGAnimatedString in1{}
//  readonly attribute 
	public native SVGAnimatedEnumeration operator{}
//  readonly attribute 
	public native SVGAnimatedNumber radiusX{}
//  readonly attribute 
	public native SVGAnimatedNumber radiusY{}
}

public native interface SVGFEOffsetElement extends SVGElement,
                               SVGFilterPrimitiveStandardAttributes {
//  readonly attribute 
	public native SVGAnimatedString in1{}
//  readonly attribute 
	public native SVGAnimatedNumber dx{}
//  readonly attribute 
	public native SVGAnimatedNumber dy{}
}

public native interface SVGFESpecularLightingElement extends SVGElement,
                                         SVGFilterPrimitiveStandardAttributes {
//  readonly attribute 
	public native SVGAnimatedString in1{}
//  readonly attribute 
	public native SVGAnimatedNumber surfaceScale{}
//  readonly attribute 
	public native SVGAnimatedNumber specularConstant{}
//  readonly attribute 
	public native SVGAnimatedNumber specularExponent{}
//  readonly attribute 
	public native SVGAnimatedNumber kernelUnitLengthX{}
//  readonly attribute
	public native SVGAnimatedNumber kernelUnitLengthY{}
}

public native interface SVGFETileElement extends SVGElement,
                             SVGFilterPrimitiveStandardAttributes {
//  readonly attribute 
	public native SVGAnimatedString in1{}
}

public native interface SVGFETurbulenceElement extends SVGElement,
                                   SVGFilterPrimitiveStandardAttributes {

  // Turbulence Types
//  const unsigned 
	public native static final short SVG_TURBULENCE_TYPE_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_TURBULENCE_TYPE_FRACTALNOISE = 1;
//  const unsigned 
	public native static final short SVG_TURBULENCE_TYPE_TURBULENCE = 2;

  // Stitch Options
//  const unsigned 
	public native static final short SVG_STITCHTYPE_UNKNOWN = 0;
//  const unsigned 
	public native static final short SVG_STITCHTYPE_STITCH = 1;
//  const unsigned 
	public native static final short SVG_STITCHTYPE_NOSTITCH = 2;

//  readonly attribute 
	public native SVGAnimatedNumber baseFrequencyX{}
//  readonly attribute 
	public native SVGAnimatedNumber baseFrequencyY{}
//  readonly attribute 
	public native SVGAnimatedInteger numOctaves{}
//  readonly attribute 
	public native SVGAnimatedNumber seed{}
//  readonly attribute 
	public native SVGAnimatedEnumeration stitchTiles{}
//  readonly attribute
	public native SVGAnimatedEnumeration type{}
}

public native interface SVGCursorElement extends SVGElement,
                             SVGURIReference,
                             SVGTests,
                             SVGExternalResourcesRequired {
//  readonly attribute 
	public native SVGAnimatedLength x{}
//  readonly attribute 
	public native SVGAnimatedLength y{}
}

public native interface SVGAElement extends SVGElement,
                        SVGURIReference,
                        SVGTests,
                        SVGLangSpace,
                        SVGExternalResourcesRequired,
                        SVGStylable,
                        SVGTransformable {
//  readonly attribute
	public native SVGAnimatedString target{}
}

public native interface SVGViewElement extends SVGElement,
                           SVGExternalResourcesRequired,
                           SVGFitToViewBox,
                           SVGZoomAndPan {
//  readonly attribute
	public native SVGStringList viewTarget{}
}

public native interface SVGScriptElement extends SVGElement,
                             SVGURIReference,
                             SVGExternalResourcesRequired {
//  attribute 
	public native String type{} // setthrows DOMException;
}

public native interface SVGZoomEvent extends UIEvent {
//  readonly attribute 
	public native SVGRect zoomRectScreen{}
//  readonly attribute 
	public native float previousScale{}
//  readonly attribute
	public native SVGPoint previousTranslate{}
//  readonly attribute 
	public native float newScale{}
//  readonly attribute 
	public native SVGPoint newTranslate{}
}

public native interface SVGAnimationElement extends SVGElement,
                                SVGTests,
                                SVGExternalResourcesRequired,
                                ElementTimeControl {

//  readonly attribute 
	public native SVGElement targetElement{}

	public native float getStartTime() throws DOMException;
	public native float getCurrentTime();
	public native float getSimpleDuration() throws DOMException;
}

public native interface SVGAnimateElement extends SVGAnimationElement,
                              SVGStylable {
}

public native interface SVGSetElement extends SVGAnimationElement {
}

public native interface SVGAnimateMotionElement extends SVGAnimationElement {
}

public native interface SVGMPathElement extends SVGElement,
                            SVGURIReference,
                            SVGExternalResourcesRequired {
}

public native interface SVGAnimateColorElement extends SVGAnimationElement,
                                   SVGStylable {
}

public native interface SVGAnimateTransformElement extends SVGAnimationElement {
}

public native interface SVGFontElement extends SVGElement,
                           SVGExternalResourcesRequired,
                           SVGStylable {
}

public native interface SVGGlyphElement extends SVGElement,
                            SVGStylable {
}

public native interface SVGMissingGlyphElement extends SVGElement,
                                   SVGStylable {
}

public native interface SVGHKernElement extends SVGElement {
}

public native interface SVGVKernElement extends SVGElement {
}

public native interface SVGFontFaceElement extends SVGElement {
}

public native interface SVGFontFaceSrcElement extends SVGElement {
}

public native interface SVGFontFaceUriElement extends SVGElement {
}

public native interface SVGFontFaceFormatElement extends SVGElement {
}

public native interface SVGFontFaceNameElement extends SVGElement {
}

public native interface SVGMetadataElement extends SVGElement {
}

public native interface SVGForeignObjectElement extends SVGElement,
                                    SVGTests,
                                    SVGLangSpace,
                                    SVGExternalResourcesRequired,
                                    SVGStylable,
                                    SVGTransformable {
//  readonly attribute 
	public native SVGAnimatedLength x{}
//  readonly attribute 
	public native SVGAnimatedLength y{}
//  readonly attribute
	public native SVGAnimatedLength width{}
//  readonly attribute 
	public native SVGAnimatedLength height{}
}

interface ElementTimeControl {
	public native void beginElement();
	public native void beginElementAt(final float offset);
	public native void endElement();
	public native void endElementAt(final float offset);
}


public interface TimeEvent extends Event {

//	readonly attribute 
	public native AbstractView view{}
//	readonly attribute 
	public native long detail{}

	public native void initTimeEvent(final String typeArg, final AbstractView viewArg, final long detailArg);

}

