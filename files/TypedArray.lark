@Module
package java.lang;
/*
 * typedarray.idl
 *
 * TypedArray IDL definitions scraped from the Khronos specification.
 *
 * Original Khronos Working Draft:
 *
 *   https://www.khronos.org/registry/typedarray/specs/latest/
 */

//[ Constructor(/*unsigned*/ long length) ]
public native class ArrayBuffer {
	public native ArrayBuffer(long length);
//    readonly attribute unsigned 
	public long byteLength{}
    public native ArrayBuffer slice(long begin);
    public native ArrayBuffer slice(long begin, /*optional*/ long end);
    public native static boolean isView(Object value);
}

//ArrayBuffer implements Transferable;

////[NoInterfaceObject]
public native interface ArrayBufferView {
//    readonly attribute 
	public native ArrayBuffer buffer{}
//    readonly attribute unsigned 
	public native long byteOffset{}
//    readonly attribute unsigned 
	public native long byteLength{}
}


// The 'byte' type does not currently exist in Web IDL.
// In this IDL, it should be a signed 8 bit type.
//[
//    Constructor(unsigned long length),
//    Constructor(Int8Array array),
//    Constructor(byte[] array),
//    Constructor(ArrayBuffer buffer, 
//                optional unsigned long byteOffset, optional unsigned long length)
//]
public native class Int8Array implements ArrayBufferView{
	
	public native Int8Array(/*unsigned*/ long length);
	public native Int8Array(Int8Array array);
	public native Int8Array(byte[] array);
	public native Int8Array(ArrayBuffer buffer);
	public native Int8Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset);
	public native Int8Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset, /*optional unsigned*/ long length);
                
//    const
	public static final long BYTES_PER_ELEMENT = 1;

//    readonly attribute unsigned 
	public native long length{}
    
//    getter byte get(unsigned long index);
//    setter void set(unsigned long index, byte value);
    public native byte this[long index];
    public native void set(Int8Array array);
    public native void set(Int8Array array, /*optional unsigned */long offset);
    public native void set(byte[] array);
    public native void set(byte[] array, /*optional unsigned*/ long offset);
    public native Int8Array subarray(long start, long end);
    
//  readonly attribute 
	ArrayBuffer buffer{}
//  readonly attribute unsigned 
	long byteOffset{}
//  readonly attribute unsigned 
	long byteLength{}
}
//Int8Array implements ArrayBufferView;


// The 'unsigned byte' type does not currently exist in Web IDL, though
// 'octet' is equivalent.
//[
//    Constructor(unsigned long length),
//    Constructor(Uint8Array array),
//    Constructor(octet[] array),
//    Constructor(ArrayBuffer buffer, 
//                optional unsigned long byteOffset, optional unsigned long length)
//]
public native class Uint8Array implements ArrayBufferView{
	public native Uint8Array(/*unsigned*/ long length);
	public native Uint8Array(Uint8Array array);
	public native Uint8Array(octet[] array);
	public native Uint8Array(ArrayBuffer buffer);
	public native Uint8Array(ArrayBuffer buffer, /*optional unsigned */long byteOffset);
	public native Uint8Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset, /*optional unsigned*/ long length);
//    const 
	public static final long BYTES_PER_ELEMENT = 1;
    
//    readonly attribute unsigned 
	public native long length{}
    
//    getter octet get(unsigned long index);
//    setter void set(unsigned long index, octet value);
	public native byte this[long index];
	public native void set(Uint8Array array);
	public native void set(Uint8Array array, /*optional unsigned*/ long offset);
	public native void set(octet[] array);
	public native void set(octet[] array, /*optional unsigned*/ long offset);
	public native Uint8Array subarray(long start, long end);
	
//  readonly attribute 
	public native ArrayBuffer buffer{}
//  readonly attribute unsigned 
	public native long byteOffset{}
//  readonly attribute unsigned 
	public native long byteLength{}
}
//Uint8Array implements ArrayBufferView;


//[
//    Constructor(unsigned long length),
//    Constructor(Uint8ClampedArray array),
//    Constructor(octet[] array),
//    Constructor(ArrayBuffer buffer, 
//                optional unsigned long byteOffset, optional unsigned long length)
//]
public native class Uint8ClampedArray implements ArrayBufferView{
	public native Uint8ClampedArray(/*unsigned*/ long length);
	public native Uint8ClampedArray(Uint8ClampedArray array);
	public native Uint8ClampedArray(octet[] array);
	public native Uint8ClampedArray(ArrayBuffer buffer);
  	public native Uint8ClampedArray(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset);
  	public native Uint8ClampedArray(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset, /*optional unsigned*/ long length);
//    const 
	public static final long BYTES_PER_ELEMENT = 1;
    
//    readonly attribute unsigned 
	public native long length{}

//    getter octet get(unsigned long index);
//    setter void set(unsigned long index, [Clamp] octet value);
	
	public native byte this[long index];
	
	public native void set(Uint8ClampedArray array);
	public native void set(Uint8ClampedArray array, /*optional unsigned*/ long offset);
	public native void set(octet[] array);
	public native void set(octet[] array, /*optional unsigned*/ long offset);
	public native Uint8ClampedArray subarray(long start, long end);
	
//  readonly attribute 
	public native ArrayBuffer buffer{}
//  readonly attribute unsigned 
	public native long byteOffset{}
//  readonly attribute unsigned 
	public native long byteLength{}
}
//Uint8ClampedArray implements ArrayBufferView;


//[
//    Constructor(unsigned long length),
//    Constructor(Int16Array array),
//    Constructor(short[] array),
//    Constructor(ArrayBuffer buffer, 
//                optional unsigned long byteOffset, optional unsigned long length)
//]
public native class Int16Array implements ArrayBufferView{
	public native Int16Array(/*unsigned*/ long length);
	public native Int16Array(Int16Array array);
	public native Int16Array(short[] array);
	public native Int16Array(ArrayBuffer buffer);
	public native Int16Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset);
	public native Int16Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset, /*optional unsigned*/ long length);
//    const 
    public static final long BYTES_PER_ELEMENT = 2;
    
//    readonly attribute unsigned 
    public long length{}
    
//    getter short get(unsigned long index);
//    setter void set(unsigned long index, short value);
    public native short this[long index];
    public native void set(Int16Array array);
    public native void set(Int16Array array, /*optional unsigned*/ long offset);
    
    public native void set(short[] array);
    public native void set(short[] array, /*optional unsigned*/ long offset);
    public native Int16Array subarray(long start, long end);
    
//  readonly attribute 
    public native ArrayBuffer buffer{}
//  readonly attribute unsigned 
    public native long byteOffset{}
//  readonly attribute unsigned 
    public native long byteLength{}
}
//Int16Array implements ArrayBufferView;


//[
//    Constructor(unsigned long length),
//    Constructor(Uint16Array array),
//    Constructor(unsigned short[] array),
//    Constructor(ArrayBuffer buffer, 
//                optional unsigned long byteOffset, optional unsigned long length)
//]
public native class Uint16Array implements ArrayBufferView{
	public native Uint16Array(/*unsigned*/ long length);
	public native Uint16Array(Uint16Array array);
	public native Uint16Array(/*unsigned*/ short[] array);
	public native Uint16Array(ArrayBuffer buffer);
	public native Uint16Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset);
	public native Uint16Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset, /*optional unsigned*/ long length);
//    const 
	public static final long BYTES_PER_ELEMENT = 2;
    
//    readonly attribute unsigned 
	public native long length{}
    
//    getter unsigned short get(unsigned long index);
//    setter void set(unsigned long index, unsigned short value);
	public native short this[long index];
	public native void set(Uint16Array array);
	public native void set(Uint16Array array, /*optional unsigned*/ long offset);
	public native void set(/*unsigned*/ short[] array);
	public native void set(/*unsigned*/ short[] array, /*optional unsigned*/ long offset);
	public native Uint16Array subarray(long start, long end);
	
//  readonly attribute 
	public native ArrayBuffer buffer{}
//  readonly attribute unsigned 
	public native long byteOffset{}
//  readonly attribute unsigned 
	public native long byteLength{}
}
//Uint16Array implements ArrayBufferView;


//[
//    Constructor(unsigned long length),
//    Constructor(Int32Array array),
//    Constructor(long[] array),
//    Constructor(ArrayBuffer buffer, 
//                optional unsigned long byteOffset, optional unsigned long length)
//]
public native class  Int32Array implements ArrayBufferView{
	public native Int32Array(/*unsigned*/ long length);
	public native Int32Array(Int32Array array);
//	public native Int32Array(long[] array);
	public native Int32Array(ArrayBuffer buffer);
	public native Int32Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset);
	public native Int32Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset, /*optional unsigned*/ long length);
//    const 
	public static final long BYTES_PER_ELEMENT = 4;
    
//    readonly attribute unsigned 
	public native long length;
    
//    getter long get(unsigned long index);
//    setter void set(unsigned long index, long value);
    public native int this[long index];
    public native void set(Int32Array array);
    public native void set(Int32Array array, /*optional unsigned*/ long offset);
    public native void set(long[] array);
    public native void set(long[] array, /*optional unsigned*/ long offset);
    public native Int32Array subarray(long start, long end);
    
//  readonly attribute 
    public native ArrayBuffer buffer{}
//  readonly attribute unsigned 
    public native long byteOffset{}
//  readonly attribute unsigned 
    public native long byteLength{}
}
//Int32Array implements ArrayBufferView;


//[
//    Constructor(unsigned long length),
//    Constructor(Uint32Array array),
//    Constructor(unsigned long[] array),
//    Constructor(ArrayBuffer buffer, 
//                optional unsigned long byteOffset, optional unsigned long length)
//]
public native class Uint32Array implements ArrayBufferView{
	public native Uint32Array(/*unsigned*/ long length);
	public native Uint32Array(Uint32Array array);
//	public native Uint32Array(/*unsigned*/ long[] array);
	public native Uint32Array(ArrayBuffer buffer);
	public native Uint32Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset);
	public native Uint32Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset, /*optional unsigned*/ long length);
//    const 
	public static final long BYTES_PER_ELEMENT = 4;
    
//    readonly attribute unsigned 
	public native long length{}
    
//    getter unsigned long get(unsigned long index);
//    setter void set(unsigned long index, unsigned long value);
	public native int this[long index]; 
	public native void set(Uint32Array array);
	public native void set(Uint32Array array, /*optional unsigned*/ long offset);
	public native void set(/*unsigned*/ long[] array);
	public native void set(/*unsigned*/ long[] array, /*optional unsigned*/ long offset);
	public native Uint32Array subarray(long start, long end);
	
//  readonly attribute 
	public native ArrayBuffer buffer{}
//  readonly attribute unsigned 
	public native long byteOffset{}
//  readonly attribute unsigned 
	public native long byteLength{}
}
//Uint32Array implements ArrayBufferView;


//[
//    Constructor(unsigned long length),
//    Constructor(Float32Array array),
//    Constructor(unrestricted float[] array),
//    Constructor(ArrayBuffer buffer, 
//                optional unsigned long byteOffset, optional unsigned long length)
//]
public native class Float32Array implements ArrayBufferView{
	public native Float32Array(/*unsigned*/ long length);
	public native Float32Array(Float32Array array);
	public native Float32Array(/*unrestricted*/ float[] array);
	public native Float32Array(ArrayBuffer buffer);
	public native Float32Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset);
	public native Float32Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset, /*optional unsigned*/ long length);
//    const 
    public static final long BYTES_PER_ELEMENT = 4;
    
//    readonly attribute unsigned 
	public native long length{}
    
//    getter unrestricted float get(unsigned long index);
//    setter void set(unsigned long index, unrestricted float value);
    public native float this[long index];
    public native void set(Float32Array array);
    public native void set(Float32Array array, /*optional unsigned*/ long offset);
    public native void set(/*unrestricted*/ float[] array);
    public native void set(/*unrestricted*/ float[] array, /*optional unsigned*/ long offset);
    public native Float32Array subarray(long start, long end);
    
//  readonly attribute 
    public native ArrayBuffer buffer{}
//  readonly attribute unsigned 
    public native long byteOffset{}
//  readonly attribute unsigned 
    public native long byteLength{}
}
//Float32Array implements ArrayBufferView;


//[
//    Constructor(unsigned long length),
//    Constructor(Float64Array array),
//    Constructor(unrestricted double[] array),
//    Constructor(ArrayBuffer buffer, 
//                optional unsigned long byteOffset, optional unsigned long length)
//]
public native class Float64Array implements ArrayBufferView{
	public native Float64Array(/*unsigned*/ long length);
	public native Float64Array(Float64Array array);
	public native Float64Array(/*unrestricted*/ double[] array);
	public native Float64Array(ArrayBuffer buffer);
	public native Float64Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset);
	public native Float64Array(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset, /*optional unsigned*/ long length);
//    const 
    public static final long BYTES_PER_ELEMENT = 8;
    
//    readonly attribute unsigned 
	public native long length{}
    
//    getter unrestricted double get(unsigned long index);
//    setter void set(unsigned long index, unrestricted double value);
	public native float this[long index];
	public native void set(Float64Array array);
	public native void set(Float64Array array, /*optional unsigned*/ long offset);
	public native void set(/*unrestricted*/ double[] array);
	public native void set(/*unrestricted*/ double[] array, /*optional unsigned*/ long offset);
	public native Float64Array subarray(long start, long end);
	
//  readonly attribute 
	public native ArrayBuffer buffer{}
//  readonly attribute unsigned 
	public native long byteOffset{}
//  readonly attribute unsigned 
	public native long byteLength{}
}
//Float64Array implements ArrayBufferView;


//[
//  Constructor(ArrayBuffer buffer,
//              optional unsigned long byteOffset,
//              optional unsigned long byteLength)
//]
public native class DataView {
	public native DataView(ArrayBuffer buffer);
	public native DataView(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset);
	public native DataView(ArrayBuffer buffer, /*optional unsigned*/ long byteOffset, /*optional unsigned*/ long byteLength);
    // Gets the value of the given type at the specified byte offset
    // from the start of the view. There is no alignment constraint;
    // multi-byte values may be fetched from any offset.
    //
    // For multi-byte values, the optional littleEndian argument
    // indicates whether a big-endian or little-endian value should be
    // read. If false or undefined, a big-endian value is read.
    //
    // These methods raise an INDEX_SIZE_ERR exception if they would read
    // beyond the end of the view.
	public native byte getInt8(/*unsigned*/ long byteOffset);
	public native byte getUint8(/*unsigned*/ long byteOffset);
	public native short getInt16(/*unsigned*/ long byteOffset);
	public native short getInt16(/*unsigned*/ long byteOffset, /*optional*/ boolean littleEndian);
	public native /*unsigned*/ short getUint16(/*unsigned*/ long byteOffset, /*optional*/ boolean littleEndian);
	public native long getInt32(/*unsigned*/ long byteOffset, /*optional*/ boolean littleEndian);
	public native /*unsigned*/ long getUint32(/*unsigned*/ long byteOffset);
	public native /*unsigned*/ long getUint32(/*unsigned*/ long byteOffset, /*optional*/ boolean littleEndian);
	public native /*unrestricted*/ float getFloat32(/*unsigned*/ long byteOffset);
	public native /*unrestricted*/ float getFloat32(/*unsigned*/ long byteOffset, /*optional*/ boolean littleEndian);
	public native /*unrestricted*/ double getFloat64(/*unsigned*/ long byteOffset);
	public native /*unrestricted*/ double getFloat64(/*unsigned*/ long byteOffset, /*optional*/ boolean littleEndian);

    // Stores a value of the given type at the specified byte offset
    // from the start of the view. There is no alignment constraint;
    // multi-byte values may be stored at any offset.
    //
    // For multi-byte values, the optional littleEndian argument 
    // indicates whether the value should be stored in big-endian or
    // little-endian byte order. If false or undefined, the value is
    // stored in big-endian byte order.
    //
    // These methods throw exceptions if they would write beyond the end
    // of the view.
	public native void setInt8(/*unsigned*/ long byteOffset, byte value);
	public native void setUint8(/*unsigned*/ long byteOffset, byte value);
	public native void setInt16(/*unsigned*/ long byteOffset, short value);
	public native void setInt16(/*unsigned*/ long byteOffset, short value, /*optional*/ boolean littleEndian);
	
	public native void setUint16(/*unsigned*/ long byteOffset, /*unsigned*/ short value);
	public native void setUint16(/*unsigned*/ long byteOffset, /*unsigned*/ short value, /*optional*/ boolean littleEndian);
	
	public native void setInt32(/*unsigned*/ long byteOffset, long value);
	public native void setInt32(/*unsigned*/ long byteOffset, long value, /*optional*/ boolean littleEndian);
	
	public native void setUint32(/*unsigned*/ long byteOffset, /*unsigned*/ long value);
	public native void setUint32(/*unsigned*/ long byteOffset, /*unsigned*/ long value, /*optional*/ boolean littleEndian);
	
	public native void setFloat32(/*unsigned*/ long byteOffset, /*unrestricted*/ float value);
	public native void setFloat32(/*unsigned*/ long byteOffset, /*unrestricted*/ float value, /*optional*/ boolean littleEndian);
	
	public native void setFloat64(/*unsigned*/ long byteOffset, /*unrestricted*/ double value);
	public native void setFloat64(/*unsigned*/ long byteOffset, /*unrestricted*/ double value, /*optional*/ boolean littleEndian);
}
//DataView implements ArrayBufferView;