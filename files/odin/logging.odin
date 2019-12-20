import . "os.odin";

logLevels :: enum {
	debug,
	info,
	warning,
	error,
	critical
}

_logFile : Handle;
_logTime : bool;
logLevel : logLevels;


initLogging :: proc (file : string, logTime : bool = true, append : bool = true) {
	_logTime = logTime;

	error : Errno;
	if append do _logFile, error = open(file, O_CREAT | O_APPEND);
	else      do _logFile, error = open(file, O_CREAT | O_TRUNC);

	if error != 0 do panic("Logfile could not be opened.");
}

finishLogging :: proc () {
	close(_logFile);
}

debugLog :: proc (msg : string) {
	log(logLevels.debug, msg);
}

infoLog :: proc (msg : string) {
	log(logLevels.info, msg);
}

warningLog :: proc(msg : string) {
	log(logLevels.warning, msg);
}

errorLog :: proc(msg : string) {
	log(logLevels.error, msg);
}

criticalLog :: proc(msg : string) {
	log(logLevels.critical, msg);
}

log :: proc (level : logLevels, msg : string) {
	using logLevels;

	if level >= logLevel {
		bytesWritten : int;
		errno : Errno;

		// TODO(Felix): actually print the time
		if _logTime do write(_logFile, []u8("[Date:Time]"));

		levelString : []u8;
		match level {
			case debug:    levelString = []u8("[ DEBUG ]");
			case info:     levelString = []u8("[ INFO  ]");
			case warning:  levelString = []u8("[WARNING]");
			case error:    levelString = []u8("[ ERROR ]");
			case critical: levelString = []u8("[CRITIC ]");
		}

		write(_logFile, []u8(levelString));
		write(_logFile, []u8(" "));
		write(_logFile, []u8(msg));
		write(_logFile, []u8("\r\n"));

		if errno != 0 do panic("Could not write into logfile.");
	}
}
