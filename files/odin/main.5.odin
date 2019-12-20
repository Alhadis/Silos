import_load "fmt.odin";
import . "logging.odin";

main :: proc () {

	initLogging(
		file = "myTextFile.txt",
		logTime = true,
		append  = true
	);
	defer finishLogging();

	// if you want you can log only messages with a higher
	// or equal level than the one you are setting
	logLevel = logLevels.debug;

	debugLog("This is a debug message");
	infoLog("I am a helpful info!");
	warningLog("Watch out we got a bada.. erm warning .. over here");
	errorLog("ERROR ERROR REOPRTING ERROR");
	criticalLog("All systems shut down.");

}
