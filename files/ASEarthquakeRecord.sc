// EarthquakeRecord.sc
// A utility method for easy handling of earthquake data.
// 
// remarks:
// a_detected_at expects a string value which will be used to create a ASDate instance
// 
//
//
//
//
// var name = "ahmet", surname = "kizilay";
// var email = name + "." + surname + "@" + "gmail.com"

ASEarthquakeRecord {
	var <detected_at, <latitude, <longitude, <depth, <md, <ml, <ms, <location;

	*new {
		arg a_detected_at, a_latitude, a_longitude, a_depth, a_md = nil, a_ml = nil, a_ms = nil, a_location = "";
		^super.new.pr_init(a_detected_at, a_latitude, a_longitude, a_depth, a_md, a_ml, a_ms, a_location);
	}

	pr_init {
		arg a_detected_at, a_latitude, a_longitude, a_depth, a_md, a_ml, a_ms, a_location;
		detected_at = ASDate.new(a_detected_at);
		latitude = a_latitude;
		longitude = a_longitude;
		depth = a_depth;
		md = a_md;
		ml = a_ml;
		ms = a_ms;
		location = a_location;
	}

	*newFromCSVFile {
		arg filename;
		var rawArray, recordArray;
		rawArray = CSVFileReader.read(filename, true).postcs;
		(rawArray == nil).if({"No Records".postln; ^nil});
		recordArray = Array.new(rawArray.size);
		rawArray.do {
			arg val, num;
			recordArray.add(ASEarthquakeRecord.new(
				val[0], 
				val[1], 
				val[2], 
				val[3], 
				(val[4] == "NULL").if({nil;}, {val[4];}),
				(val[5] == "NULL").if({nil;}, {val[5];}),
				(val[6] == "NULL").if({nil;}, {val[6];}), 
				val[7]
			));
		};
		^recordArray;
	}
}