@Module
package org.w3c.webmessaging;

import org.w3c.event.Event;

public native interface MessageEvent extends Event {
//	  readonly attribute 
	Object data{}
//	  readonly attribute 
	String origin{}
//	  readonly attribute 
	String lastEventId{}
//	  readonly attribute 
	/*WindowProxy*/Window source{}
//	  readonly attribute 
	/*MessagePortArray*/MessagePort[] ports{}
	void initMessageEvent(final String typeArg, final boolean canBubbleArg, final boolean cancelableArg, final Object dataArg, final String originArg, final String lastEventIdArg, 
			final Window sourceArg, final /*MessagePortArray*/MessagePort[] portsArg);
	void initMessageEventNS(final String namespaceURI, final String typeArg, final boolean canBubbleArg, final boolean cancelableArg, final Object dataArg, 
			final String originArg, final String lastEventIdArg, final Window sourceArg, final /*MessagePortArray*/MessagePort[] portsArg);
}

public native class MessageChannel {
	public native MessageChannel();
//	  readonly attribute 
	MessagePort port1{}
//	  readonly attribute 
	MessagePort port2{}
}


public native interface MessagePort {
	void postMessage(final Object message);
	void postMessage(final Object message, /*optional*/ final /*MessagePortArray*/MessagePort[] ports);
	void start();
	void close();

	  // event handler attributes
//	attribute 
	Function onmessage{}
}