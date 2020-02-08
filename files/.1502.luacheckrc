-- luacheck: globals std
-- luacheck: globals max_line_length
-- luacheck: globals stds

stds.ellips =
{
  globals = {
    "recalculate",
    "LuaUnitTest"
  },
  read_globals =
  {
    "Vision",
    "doresource",
    "gl",
    "lw",
    "TrueSort",
    "ELuaBindings",
    "Language",
    "LOG",
    "sLTrace",
    "sLInfo",
    "sLWarning",
    "SoftPLC",
    "ETimer",
    "CDataProvider",
    "ImageBlocksInfo",
    "ETcpSocket",
    "AlgTest",
    "CDraw",
    "CCameraOffsetCalculator",
    "TrueSortAlgorithms",
    "CScanAreaIntensityCorrectionProcessor",
    "CLuaEfgChainTracer",
    "SystemConfiguration",
    "Unit",
    "System",
    "CResourceLocator",
    "efc3",
    "sLError",
    "LuaUdpDeeplearning",
    "CETime",
    "cjson",
    "Json"
  }
}

stds.i10 =
{
  read_globals =
  {
    i10 = { fields = {
      pi = { read_only = true } 
    }}
  }
}

std = "max+ellips+i10"

max_line_length = 220