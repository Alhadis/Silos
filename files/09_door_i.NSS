/* force all doors to proper ACR settings */
void InitializeDoors()
{
	object area,o;
	string str;
	int lock, open;

	for (area = GetFirstArea(); GetIsObjectValid(area); area = GetNextArea()) {
		for (o = GetFirstObjectInArea(area); GetIsObjectValid(o); o = GetNextObjectInArea(area)) {

			
			/* ignore non-doors */
			if (GetObjectType(o) != OBJECT_TYPE_DOOR)
				continue;

			str = GetEventHandler(o, SCRIPT_DOOR_ON_CLOSE);

			/* ignore already fixed doors */
			if ((str == "acf_door_onclosed") && (GetLocalFloat(o, "ACR_DOOR_CLOSE_DELAY") > 0.0))
				continue;

			//lock = (str == "doorlock");
			lock = GetLocked(o);
			open = GetIsOpen(o);

			SetEventHandler(o, SCRIPT_DOOR_ON_CLICKED, "acf_door_onclick");
			SetEventHandler(o, SCRIPT_DOOR_ON_CLOSE, "acf_door_onclosed");
			SetEventHandler(o, SCRIPT_DOOR_ON_DIALOGUE, "acf_door_onconversation");
			SetEventHandler(o, SCRIPT_DOOR_ON_DAMAGE, "acf_door_ondamaged");
			SetEventHandler(o, SCRIPT_DOOR_ON_DEATH, "acf_door_ondeath");
			SetEventHandler(o, SCRIPT_DOOR_ON_DISARM, "acf_door_onopen");
			SetEventHandler(o, SCRIPT_DOOR_ON_FAIL_TO_OPEN, "acf_door_onfailtoopen");
			SetEventHandler(o, SCRIPT_DOOR_ON_HEARTBEAT, "acf_door_heartbeat");
			SetEventHandler(o, SCRIPT_DOOR_ON_LOCK, "acf_door_onlock");
			SetEventHandler(o, SCRIPT_DOOR_ON_MELEE_ATTACKED, "acf_door_onmeleeattacked");
			SetEventHandler(o, SCRIPT_DOOR_ON_OPEN, "acf_door_onopen");
			SetEventHandler(o, SCRIPT_DOOR_ON_SPELLCASTAT, "acf_door_onspellcastat");
			SetEventHandler(o, SCRIPT_DOOR_ON_TRAPTRIGGERED, "acf_door_ontraptriggered");
			SetEventHandler(o, SCRIPT_DOOR_ON_UNLOCK, "acf_door_onunlock");
			SetEventHandler(o, SCRIPT_DOOR_ON_USERDEFINED, "acf_door_onuserdefined");
			
			SetLocalInt(o, "ACR_DOOR_LISTEN_DC_MOD", 4);
			SetLocalInt(o, "ACR_DOOR_BREAK_DC", 15);

			if (!open)
				SetLocalFloat(o, "ACR_DOOR_CLOSE_DELAY", 300.0);

			if (lock)
				SetLocalInt(o, "ACR_DOOR_AUTO_LOCK", 1);
		}

	}
}