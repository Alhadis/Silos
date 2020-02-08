-- Files
include_files = { "src", "tests/wesenGemaMod", "test/*.lua" };
exclude_files = { "src/config", "src/external" }

-- Don't warn when function arguments are not used (because of arguments in event handlers)
unused_args = false;

-- Don't warn when class methods don't use self
self = false;

-- The list of global variables that are provided by the lua server and are used in this project
globals = {

  -- Plugin information
  "PLUGIN_NAME",
  "PLUGIN_AUTHOR",
  "PLUGIN_VERSION",


  -- Constants

  -- Weapon ids
  "GUN_ASSAULT",
  "GUN_SUBGUN",
  "GUN_SNIPER",
  "GUN_CARBINE",
  "GUN_SHOTGUN",
  "GUN_PISTOL",
  "GUN_AKIMBO",
  "GUN_KNIFE",
  "GUN_GRENADE",

  -- Team ids
  "TEAM_CLA",
  "TEAM_RVSF",

  -- Client Roles
  "CR_DEFAULT",
  "CR_ADMIN",

  -- Game Modes
  "GM_CTF",

  -- Vote types
  "SA_MAP",

  -- Disconnect reasons
  "DISC_BANREFUSE",
  "DISC_NONE",

  -- Vote Errors
  "VOTEE_NOERROR",
  "VOTEE_INVALID",

  -- Upload Errors
  "UE_NOERROR",

  -- Flag actions
  "FA_SCORE",
  "FA_DROP",
  "FA_LOST",
  "FA_RESET",

  -- Log level
  "ACLOG_INFO",
  "ACLOG_DEBUG",

  -- Other
  "PLUGIN_BLOCK",


  -- Events
  "onFlagAction",
  "onMapChange",
  "onPlayerCallVote",
  "onPlayerConnect",
  "onPlayerDisconnect",
  "onPlayerDisconnectAfter",
  "onPlayerNameChange",
  "onPlayerRoleChange",
  "onPlayerSayText",
  "onPlayerSendMap",
  "onPlayerShoot",
  "onPlayerSpawn",
  "onVoteEnd",


  -- Functions

  -- Log
  "logline",

  -- Time
  "settimeleftmillis",
  "gettimeleftmillis",
  "getgamemillis",
  "getsvtick",

  -- Player Information
  "getname",
  "getip",
  "getteam",

  -- Output
  "clientprint",
  "sayas",

  -- Map Rot
  "setwholemaprot",
  "getwholemaprot",
  "getmaprotnextentry",
  "setmaprot",

  -- Maps
  "mapexists",
  "removemap",

  -- Other
  "disconnect",
  "flagaction",
  "setautoteam",


  -- Modules
  "cfg"
};
