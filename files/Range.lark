@Module
package org.w3c.range;

import org.w3c.dom.DOMException;
import org.w3c.dom.DocumentFragment;
import org.w3c.dom.Node;

//Introduced in DOM Level 2:
public class RangeException extends Exception{
//	unsigned 
	short code{}
	
	//RangeExceptionCode
//	const unsigned 
	static final short BAD_BOUNDARYPOINTS_ERR = 1;
//	const unsigned 
	static final short INVALID_NODE_TYPE_ERR = 2;
}


//Introduced final DOM Level 2:
public native interface Range {
//	readonly attribute 
	Node startContainer{}
	 // throws DOMException) on retrieval
	
//	readonly attribute 
	long startOffset{}
	 // throws DOMException) on retrieval
	
//	readonly attribute 
	Node endContainer{}
	 // throws DOMException) on retrieval
	
//	readonly attribute 
	long endOffset{}
	 // throws DOMException) on retrieval
	
//	readonly attribute 
	boolean collapsed{}
	 // throws DOMException) on retrieval
	
//	readonly attribute
	Node commonAncestorContainer{}
	 // throws DOMException) on retrieval
	
	void setStart(final Node refNode, final long offset) throws RangeException,  DOMException;
	void setEnd(final Node refNode, final long offset) throws RangeException, DOMException;
	void setStartBefore(final Node refNode) throws RangeException, DOMException;
	void setStartAfter(final Node refNode) throws RangeException, DOMException;
	void setEndBefore(final Node refNode) throws RangeException, DOMException;
	void setEndAfter(final Node refNode) throws RangeException, DOMException;
	void collapse(final boolean toStart) throws DOMException;
	void selectNode(final Node refNode) throws RangeException, DOMException;
	void selectNodeContents(final Node refNode) throws RangeException, DOMException;
	
	// CompareHow
//	const /*unsigned*/ 
	static final short START_TO_START  = 0;
//	const /*unsigned*/ 
	static final short START_TO_END  = 1;
//	const /*unsigned*/  
	static final short END_TO_END  = 2;
//	const /*unsigned*/ 
	static final short END_TO_START  = 3;
	
	short compareBoundaryPoints(final /*unsigned*/ short how, final Range sourceRange) throws DOMException;
	void deleteContents() throws DOMException;
	DocumentFragment extractContents() throws DOMException;
	DocumentFragment cloneContents() throws DOMException;
	void insertNode(final Node newNode) throws DOMException, RangeException;
	void surroundContents(final Node newParent) throws DOMException, RangeException;
	Range cloneRange() throws DOMException;
	String toString()/* throws DOMException*/;
	void detach() throws DOMException;
}
