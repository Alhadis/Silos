globals = {
  "read",
  "term",
  "fs",
  "coroutine",
  "shell",
  "peripheral",
  "dos",
}

files["src/kernel/"] = {
  globals = {
    "executeProgram",
    "apiCalls",
    "version",
    "drives",
    "devices",
    "configDirectives",
    "events",
    "currentDrive",
    "currentDirs",
    "environment",
    "parsePath",
    "convertPath",
    "reverseConvertPath",
    "fopen",
    "fclose",
    "fread",
    "fwrite",
    "fdelete",
    "fmove",
    "fcopy",
    "fsize",
    "mkdir",
    "dirContents",
    "drvSpace",
    "driverApiCalls",
    "driverCall",
    "loadDriver",
    "parseConfig",
  }
}

files["src/shell/"] = {
  globals = {
    "displayPrompt",
    "internalCommands",
    "getCommand",
    "processCommand",
  }
}
