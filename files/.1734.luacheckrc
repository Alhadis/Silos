allow_defined=true
std = {
    globals = {"app", "config", "setup", "package"}, -- Base NodeMCU application globals
    read_globals = {
        -- C NodeMCU Wifi Module: https://nodemcu.readthedocs.io/en/master/modules/wifi/
        "wifi",
        -- NodeMCU Module: https://nodemcu.readthedocs.io/en/master/modules/node/
        "node",
        -- C MQTT Module: https://nodemcu.readthedocs.io/en/master/modules/mqtt/
        "mqtt",
        -- C Timer Module: https://nodemcu.readthedocs.io/en/master/modules/tmr/
        "tmr",
        -- C DHT Module: https://nodemcu.readthedocs.io/en/master/modules/dht/
        "dht",
        "rtctime",
        "getfenv",
        "loadfile",
        "net",
        "file",
        "sjson",
        "pcall",
        "collectgarbage",
        "tonumber",
        "tostring",
        "type",
        "assert",
        "print",
        "table",
        "require",
        -- Overlay for file requiring
        "OVL",
        "error",
        "setmetatable"
    }
}
