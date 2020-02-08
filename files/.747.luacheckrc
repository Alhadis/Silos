stds.obs_script = {
  read_globals = {
    "obslua",
    "script_path",
  },
  globals = {
    "script_log",
  }
}
stds.common = {
  globals = {
    "alarm_active",
    "trigger_active",
    "trigger_time",
    "trigger_timeout",
    "audio_sources",
    "video_sources",
    "default_rule",
    "source_rules",
    "audio_status",
    "video_status",
    "run_rule",
    "dump_rule",
    "serialize_rule",
    "deserialize_rule",
    "audio_default_settings",
    "update_rule_settings",
    "bootstrap_rule_settings",
    "source_activate",
    "source_deactivate",
    "update_source_rule",
  }
}
std = "+obs_script+common"
ignore = {
  "script_description",
  "script_properties",
  "script_defaults",
  "script_update",
  "script_load",
  "script_unload",
}
