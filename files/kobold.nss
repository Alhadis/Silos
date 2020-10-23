/** Yield execution to kobold. */
void koboldEvent(String ev, object caller = OBJECT_SELF);

/** Attach a context to a object.
  * Returns true on success, false on all other conditions.
  */
int attachContext(String context, object obj);

/** Detach a context from one object.
  * Returns true on success, false on all other conditions.
  */
int detachContext(String context, object obj);

/** Detach a context from all objects.
  * Returns true on success, false on all other conditions.
  */
int detachContext(String context);

/*private*/ int _callKobold(string fun, string ctx, object obj) {
	string funH = "_" + fun;
	SetLocalString(GetModule(), funH, ctx);
	koboldEvent(fun, obj);
	string ret = GetLocalString(GetModule(), funH);
	DeleteLocalString(GetModule(), funH);
	return StringToInt(ret) == 1;
}

void koboldEvent(string ev, object caller) {
	SetLocalString(GetModule(), "NWNX!JVM!EVENT",
		ObjectToString(caller) + " " + ev);
}

int attachContext(String context, object obj) {
	return _callKobold("kobold.attachContext", context, obj);
}
int detachContext(String context, object obj) {
	return _callKobold("kobold.detachContext", context, obj);
}
int detachContext(String context) {
	return _callKobold("kobold.detachContextAll", context, obj);
}
