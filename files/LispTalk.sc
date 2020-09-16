/*
	LispTalk.sc 
	Transfer data to LIPS-like envoriments using a temporary file.  	
	PathName.tmp (/tmp/) is the default folder
	"supercollider" is the default filename
	 

	Methods:
	.new // input the Array
	.string  // return a string with Lisp format
	.scArray // return array
	.writeString // write a temporary file with string, default filename is supercollider

	Use:
	a = LispTalk.new([1, 1, 1, 1])
	a.scArray  // -> [ 1, 1, 1, 1 ]
	a.string // -> ( 1 1 1 1 )
	a.writeString // write "supercollider" in "/tmp/"
	a.writeString(filename: \otherKey) // write to the file "otherKey" 

	
*/

LispTalk {

	var <scArray, <lispString;
	
	*new { arg scArray;
		^super.new.initLisp(scArray);
	}
	
	initLisp { arg newScArray;
		this.scArray_(newScArray);
		lispString = newScArray.asLisp;
	}

	scArray_ { arg newScArray;
		scArray = newScArray;
	}	

	string {
		^this.scArray.asLisp
	}

	writeString	{ arg filename = "supercollider", folder = PathName.tmp;
		/*
			Write the string to a temporary file
		*/ 
		var file, fWrite, outputFile;		
		outputFile =  folder ++ filename;
		fWrite = File(outputFile , "w");
		fWrite.write(this.lispString);
		fWrite.close;
	}

}




