const string _INV_SCENE_NAME = "SCREEN_INVENTORY";

const int _INV_GUI_ID_IS_SCENE_STATE = 100;
const string _INV_IS_SCENE_STATE_CLOSED = "0";
const string _INV_IS_SCENE_STATE_OPEN = "1";

const int _INV_GUI_ID_IS_SORT_STATE = 101;
const string _INV_IS_SORT_STATE_IDLE = "0";
const string _INV_IS_SORT_STATE_RUNNING = "1";

const string _IS_SCENE_FILE = "nwn2is_config.xml";
const string _IS_SCENE_NAME = "SCENE_NWN2IS_CONFIG";

const string _IS_2DA_FILE = "nwn2is_criteria";
const string _IS_2DA_FIELD_NAME = "Name";
const string _IS_2DA_FIELD_COMPARE = "Compare_Script";
const string _IS_2DA_FIELD_ENABLED = "Enabled";

const int _IS_GUI_ID_LB_CRITERIA = 0;
const int _IS_GUI_ID_LB_ORDER = 1;
const int _IS_GUI_ID_TXT_FIRST_X = 2;
const int _IS_GUI_ID_CB_CONTENTS = 3;
const int _IS_GUI_ID_CB_CONTAINERS_ONLY = 4;

const int _IS_GUI_ID_SB_FIRST_X = 5;

const int _IS_GUI_ID_BASIC_START = _IS_GUI_ID_TXT_FIRST_X;
const int _IS_GUI_ID_BASIC_END = _IS_GUI_ID_CB_CONTAINERS_ONLY;

const int _IS_GUI_ID_BN_CLOSE = 10;
const int _IS_GUI_ID_BN_DEFAULTS = 11;

const int _IS_GUI_ID_LB_CRITERIA_SELECTED = 20;
const int _IS_GUI_ID_LB_ORDER_SELECTED = 21;

const string _IS_GUI_PREFIX = "_isg_";
string _IS_GUI_PREFIX_LB_CRITERIA = _IS_GUI_PREFIX +
	IntToString(_IS_GUI_ID_LB_CRITERIA) + "_";
string _IS_GUI_PREFIX_LB_ORDER = _IS_GUI_PREFIX +
	IntToString(_IS_GUI_ID_LB_ORDER) + "_";

const string _IS_GUI_VAR_CHARACTER = "_isg_character";
const string _IS_GUI_VAR_MAIN_GUI = "_isg_main_gui";

const string _IS_GUI_NAME_TXT_CHARACTER = "TXT_CHARACTER";

const string _IS_GUI_NAME_LB_CRITERIA = "LB_CRITERIA";
const string _IS_GUI_NAME_LB_ORDER = "LB_ORDER";

const string _IS_GUI_NAME_TXT_FIRST_X = "TXT_FIRST_X";
const int _IS_GUI_TXT_FIRST_X_MAX = 128;
const string _IS_GUI_NAME_SB_FIRST_X = "SB_FIRST_X";

const string _IS_GUI_NAME_LB_PROTO_ROW_ID = "ROW_ID";
const string _IS_GUI_NAME_LB_PROTO_ROW_TEXT = "ROW_TEXT";
const string _IS_GUI_PREFIX_LB_PROTO_ROW_NAME = "ROW_";

const string _IS_GUI_SUFFIX_LB_NUM_ITEMS = "items";
const string _IS_GUI_SUFFIX_LB_NUM_ROWS = "rows";
const string _IS_GUI_SUFFIX_LB_ITERATOR = "iter";

const string _IS_HELPER_TEMPLATE = "plc_ipoint ";
const int _IS_HELPER_TEMPLATE_TYPE = OBJECT_TYPE_PLACEABLE;

const string _IS_HELPER_NAME = "_is_helper";
const string _IS_HELPER_SCRIPT = "nwn2is_helper";

const string _IS_HELPER_VAR_INVENTORY = "_ish_inv";
const string _IS_HELPER_VAR_PARENT = "_ish_parent";
const string _IS_HELPER_VAR_GUI = "_ish_gui";
const string _IS_HELPER_VAR_STATE = "_ish_state";

const int _IS_HELPER_STATE_INIT = 0;
const int _IS_HELPER_STATE_READ = 1;
const int _IS_HELPER_STATE_SUBREAD = 2;
const int _IS_HELPER_STATE_SORT = 3;
const int _IS_HELPER_STATE_TAKE = 4;
const int _IS_HELPER_STATE_CHECK = 5;
const int _IS_HELPER_STATE_SUBSORT = 6;
const int _IS_HELPER_STATE_GIVE = 7;
const int _IS_HELPER_STATE_END = 8;

const string _IS_HELPER_VAR_SKIP = "_ish_skip";

const string _IS_HELPER_PREFIX_CONTAINER = "_ish_con_";
const string _IS_HELPER_VAR_CONTAINER = "_ish_con";
const string _IS_HELPER_VAR_CONTAINER_COUNT = "_ish_ccount";

const string _IS_HELPER_VAR_TOTAL = "_ish_total";
const string _IS_HELPER_VAR_CHECK_COUNT = "_ish_check";
const string _IS_HELPER_VAR_CHECK_TOTAL = "_ish_check_total";
const int _IS_HELPER_CHECK_MAX_ITEMS_PER_CHECK = 768;
const int _IS_HELPER_CHECK_MAX = 96;

const string _IS_SORT_PREFIX = "_iss_";
const string _IS_SORT_VAR_DATA_OFFSET = "_iss_offset";
const string _IS_SORT_VAR_COUNT = "_iss_count";
const string _IS_SORT_VAR_REAL_COUNT = "_iss_rcount";

const string _IS_SORT_MERGE_SCRIPT = "mergesort_merge_o_buffered";

int _is_IsInitialized(object oGUI)
{
	if (GetIsObjectValid(GetLocalObject(oGUI, _IS_GUI_VAR_MAIN_GUI)))
		return 1;

	return 0;
}

string _is_GetGUIValue(int nID, object oGUI)
{
	string s;

	switch (nID)
	{
	case _IS_GUI_ID_SB_FIRST_X:
		nID = _IS_GUI_ID_TXT_FIRST_X;
	case _IS_GUI_ID_LB_CRITERIA:
	case _IS_GUI_ID_LB_ORDER:
	case _IS_GUI_ID_TXT_FIRST_X:
	case _IS_GUI_ID_CB_CONTENTS:
	case _IS_GUI_ID_CB_CONTAINERS_ONLY:
		s = GetLocalString(oGUI, _IS_GUI_PREFIX + IntToString(nID));
		break;
	}

	return s;
}

int _is_IsListBox(int nID)
{
	int i;

	switch (nID)
	{
	case _IS_GUI_ID_LB_CRITERIA:
	case _IS_GUI_ID_LB_ORDER:
		i = 1;
		break;
	default:
		i = 0;
		break;
	}

	return i;
}

string _is_GetListBoxName(int nID)
{
	string s;

	switch (nID)
	{
	case _IS_GUI_ID_LB_CRITERIA:
		s = _IS_GUI_NAME_LB_CRITERIA;
		break;
	case _IS_GUI_ID_LB_ORDER:
		s = _IS_GUI_NAME_LB_ORDER;
		break;
	default:
		s = "";
		break;
	}

	return s;
}

int _is_GetNumListBoxRows(int nID, object oGUI)
{
	if (!_is_IsListBox(nID)) return -1;

	return GetLocalInt(oGUI, _IS_GUI_PREFIX +
		IntToString(nID) + "_" + _IS_GUI_SUFFIX_LB_NUM_ROWS);
}

int _is_GetNextListBoxValue(int nID, object oGUI)
{
	int i, j, cnt;
	string scene_lb_prefix;

	if (!_is_IsListBox(nID)) return -1;

	scene_lb_prefix = _IS_GUI_PREFIX + IntToString(nID) + "_";

	i = GetLocalInt(oGUI, scene_lb_prefix + _IS_GUI_SUFFIX_LB_ITERATOR);
	cnt = GetLocalInt(oGUI, scene_lb_prefix + _IS_GUI_SUFFIX_LB_NUM_ITEMS);
	j = -1;

	while (j < 0 && i < cnt)
	{
		j = GetLocalInt(oGUI, scene_lb_prefix + IntToString(i));
		i++;
	}

	if (j > -1)
	{
		SetLocalInt(oGUI, scene_lb_prefix + _IS_GUI_SUFFIX_LB_ITERATOR, i);

		return j;
	}

	return -1;
}

void _is_ResetListBoxIteration(int nID, object oGUI)
{
	if (!_is_IsListBox(nID)) return;

	SetLocalInt(oGUI, _IS_GUI_PREFIX + IntToString(nID) + "_" +
		_IS_GUI_SUFFIX_LB_ITERATOR, 0);
}

void _is_CompactListBoxVars(int nID, object oGUI)
{
	int i, j, n;
	int end;
	string scene_lb_prefix;

	if (!_is_IsListBox(nID)) return;

	scene_lb_prefix = _IS_GUI_PREFIX + IntToString(nID) + "_";

	end = GetLocalInt(oGUI, scene_lb_prefix + _IS_GUI_SUFFIX_LB_NUM_ITEMS);

	for (i = 0; i < end; i++)
	{
		n = GetLocalInt(oGUI, scene_lb_prefix + IntToString(i));
		if (n < 0) break;
	}

	for (j = i+1; j < end; j++)
	{
		n = GetLocalInt(oGUI, scene_lb_prefix + IntToString(j));
		if (n > -1)
		{
			SetLocalInt(oGUI, scene_lb_prefix + IntToString(i), n);
			i++;
		}
	}

	for (j = i; j < end; j++)
	{
		DeleteLocalInt(oGUI, scene_lb_prefix + IntToString(j));
	}

	SetLocalInt(oGUI, scene_lb_prefix + _IS_GUI_SUFFIX_LB_NUM_ITEMS, i);
}

void _is_PopulateListBox(int nID, int bClear, int bCompact, object oGUI)
{
	int i, j, k, n;
	string lb_name;
	string scene_lb_prefix;
	string s;
	object oMain;

	if (!_is_IsListBox(nID)) return;

	oMain = GetLocalObject(oGUI, _IS_GUI_VAR_MAIN_GUI);

	lb_name = _is_GetListBoxName(nID);
	scene_lb_prefix = _IS_GUI_PREFIX + IntToString(nID) + "_";

	if (bClear)
	{
		ClearListBox(oMain, _IS_SCENE_NAME, lb_name);
		SetLocalInt(oGUI, scene_lb_prefix + _IS_GUI_SUFFIX_LB_NUM_ROWS, 0);
	}

	if (bCompact) _is_CompactListBoxVars(nID, oGUI);

	j = GetLocalInt(oGUI, scene_lb_prefix + _IS_GUI_SUFFIX_LB_NUM_ITEMS);
	k = GetLocalInt(oGUI, scene_lb_prefix + _IS_GUI_SUFFIX_LB_NUM_ROWS);
	n = 0;

	for (i = 0; i < j; i++)
	{
		int row_value;
		string row_id, actual_id;
		string textfields;

		actual_id = IntToString(i);
		row_value = GetLocalInt(oGUI, scene_lb_prefix + actual_id);

		if (row_value < 0) continue;

		s = Get2DAString(_IS_2DA_FILE, _IS_2DA_FIELD_ENABLED, row_value);
		if (s != "1")
		{
			SetLocalInt(oGUI, scene_lb_prefix + actual_id, -1);
			continue;
		}

		row_id = IntToString(n);

		textfields =
			_IS_GUI_NAME_LB_PROTO_ROW_ID + "=" + actual_id + ";" +
			_IS_GUI_NAME_LB_PROTO_ROW_TEXT + "=" +
			Get2DAString(_IS_2DA_FILE, _IS_2DA_FIELD_NAME, row_value);

		if (n < k)
		{
		 	ModifyListBoxRow(oMain, _IS_SCENE_NAME, lb_name,
				_IS_GUI_PREFIX_LB_PROTO_ROW_NAME + row_id,
				textfields, "", "", "");
		}
		else
		{
			AddListBoxRow(oMain, _IS_SCENE_NAME, lb_name,
				_IS_GUI_PREFIX_LB_PROTO_ROW_NAME + row_id,
				textfields, "", "", "");
			k++;
		}

		n++;
	}

	for (i = n; i < k; i++)
	{
		RemoveListBoxRow(oMain, _IS_SCENE_NAME, lb_name,
			_IS_GUI_PREFIX_LB_PROTO_ROW_NAME + IntToString(i));
	}

	SetLocalInt(oGUI, scene_lb_prefix + _IS_GUI_SUFFIX_LB_NUM_ROWS, n);
}

void _is_ReselectListBoxRow(int nID, object oGUI)
{
	int i;
	string s;
	object oMain;

	if (!_is_IsListBox(nID)) return;

	oMain = GetLocalObject(oGUI, _IS_GUI_VAR_MAIN_GUI);

	s = _is_GetGUIValue(nID, oGUI);
	if (s != "")
	{
		i = _is_GetNumListBoxRows(nID, oGUI);
		if (StringToInt(s) >= i) s = IntToString(i-1);

		SetListBoxRowSelected(oMain, _IS_SCENE_NAME,
			_is_GetListBoxName(nID), _IS_GUI_PREFIX_LB_PROTO_ROW_NAME + s);
	}
}

void _is_MoveListBoxItem(int nID, string sRowID, object oGUI)
{
	int i, j, dest_id;
	string scene_lb_src_prefix, scene_lb_dest_prefix;

	if (!_is_IsListBox(nID)) return;

	switch (nID)
	{
	case _IS_GUI_ID_LB_CRITERIA:
		dest_id = _IS_GUI_ID_LB_ORDER;
		scene_lb_src_prefix = _IS_GUI_PREFIX_LB_CRITERIA;
		scene_lb_dest_prefix = _IS_GUI_PREFIX_LB_ORDER;
		break;
	case _IS_GUI_ID_LB_ORDER:
		dest_id = _IS_GUI_ID_LB_CRITERIA;
		scene_lb_src_prefix = _IS_GUI_PREFIX_LB_ORDER;
		scene_lb_dest_prefix = _IS_GUI_PREFIX_LB_CRITERIA;
		break;
	}

	i = GetLocalInt(oGUI, scene_lb_src_prefix + sRowID);
	SetLocalInt(oGUI, scene_lb_src_prefix + sRowID, -1);
	_is_PopulateListBox(nID, FALSE, TRUE, oGUI);
	_is_ReselectListBoxRow(nID, oGUI);

	j = GetLocalInt(oGUI, scene_lb_dest_prefix + _IS_GUI_SUFFIX_LB_NUM_ITEMS);
	SetLocalInt(oGUI, scene_lb_dest_prefix + IntToString(j), i);
	j++;
	SetLocalInt(oGUI, scene_lb_dest_prefix + _IS_GUI_SUFFIX_LB_NUM_ITEMS, j);
	_is_PopulateListBox(dest_id, FALSE, FALSE, oGUI);
	_is_ReselectListBoxRow(dest_id, oGUI);
}

void _is_InitializeState(object oGUI, object oMain)
{
	int i, j, n;
	string s;

	n = GetNum2DARows(_IS_2DA_FILE);
	if (n < 1) return;

	for (i = 0; i < n; i++)
	{
		s = Get2DAString(_IS_2DA_FILE, _IS_2DA_FIELD_ENABLED, i);
		if (s == "1")
		{
			SetLocalInt(oGUI, _IS_GUI_PREFIX_LB_ORDER + "0", i);
			SetLocalInt(oGUI,
				_IS_GUI_PREFIX_LB_ORDER + _IS_GUI_SUFFIX_LB_NUM_ITEMS, 1);
			SetLocalInt(oGUI,
				_IS_GUI_PREFIX_LB_ORDER + _IS_GUI_SUFFIX_LB_NUM_ROWS, 1);
			i++;
			break;
		}
	}

	SetLocalInt(oGUI,
		_IS_GUI_PREFIX_LB_ORDER + _IS_GUI_SUFFIX_LB_ITERATOR, 0);
	SetLocalString(oGUI,
		_IS_GUI_PREFIX + IntToString(_IS_GUI_ID_LB_ORDER), "");

	j = 0;
	while(i < n)
	{
		s = Get2DAString(_IS_2DA_FILE, _IS_2DA_FIELD_ENABLED, i);
		if (s == "1")
		{
			SetLocalInt(oGUI,
				_IS_GUI_PREFIX_LB_CRITERIA + IntToString(j), i);

			j++;
		}

		i++;
	}

	SetLocalInt(oGUI,
		_IS_GUI_PREFIX_LB_CRITERIA + _IS_GUI_SUFFIX_LB_NUM_ITEMS, j);
	SetLocalInt(oGUI,
		_IS_GUI_PREFIX_LB_CRITERIA + _IS_GUI_SUFFIX_LB_NUM_ROWS, j);
	SetLocalInt(oGUI,
		_IS_GUI_PREFIX_LB_CRITERIA + _IS_GUI_SUFFIX_LB_ITERATOR, 0);
	SetLocalString(oGUI,
		_IS_GUI_PREFIX + IntToString(_IS_GUI_ID_LB_CRITERIA), "");

	s = IntToString(0);
	for (i = _IS_GUI_ID_BASIC_START; i <= _IS_GUI_ID_BASIC_END; i++)
	{
		SetLocalString(oGUI, _IS_GUI_PREFIX + IntToString(i), s);
	}

	SetLocalObject(oGUI, _IS_GUI_VAR_MAIN_GUI, oMain);
}

void _is_CopyState(object oSrc, object oDest)
{
	int i, n;
	string s;

	n = GetLocalInt(oSrc,
		_IS_GUI_PREFIX_LB_ORDER + _IS_GUI_SUFFIX_LB_NUM_ITEMS);
	SetLocalInt(oDest,
		_IS_GUI_PREFIX_LB_ORDER + _IS_GUI_SUFFIX_LB_NUM_ITEMS, n);

	SetLocalInt(oDest,
		_IS_GUI_PREFIX_LB_ORDER + _IS_GUI_SUFFIX_LB_NUM_ROWS,
		GetLocalInt(oSrc,
			_IS_GUI_PREFIX_LB_ORDER + _IS_GUI_SUFFIX_LB_NUM_ROWS));
	SetLocalInt(oDest,
		_IS_GUI_PREFIX_LB_ORDER + _IS_GUI_SUFFIX_LB_ITERATOR,
		GetLocalInt(oSrc,
			_IS_GUI_PREFIX_LB_ORDER + _IS_GUI_SUFFIX_LB_ITERATOR));
	SetLocalString(oDest,
		_IS_GUI_PREFIX + IntToString(_IS_GUI_ID_LB_ORDER),
		GetLocalString(oSrc,
			_IS_GUI_PREFIX + IntToString(_IS_GUI_ID_LB_ORDER)));

	for (i = 0; i < n; i++)
	{
		s = _IS_GUI_PREFIX_LB_ORDER + IntToString(i);
		SetLocalInt(oDest, s, GetLocalInt(oSrc, s));
	}

	n = GetLocalInt(oSrc,
		_IS_GUI_PREFIX_LB_CRITERIA + _IS_GUI_SUFFIX_LB_NUM_ITEMS);
	SetLocalInt(oDest,
		_IS_GUI_PREFIX_LB_CRITERIA + _IS_GUI_SUFFIX_LB_NUM_ITEMS, n);

	SetLocalInt(oDest,
		_IS_GUI_PREFIX_LB_CRITERIA + _IS_GUI_SUFFIX_LB_NUM_ROWS,
		GetLocalInt(oSrc,
			_IS_GUI_PREFIX_LB_CRITERIA + _IS_GUI_SUFFIX_LB_NUM_ROWS));
	SetLocalInt(oDest,
		_IS_GUI_PREFIX_LB_CRITERIA + _IS_GUI_SUFFIX_LB_ITERATOR,
		GetLocalInt(oSrc,
			_IS_GUI_PREFIX_LB_CRITERIA + _IS_GUI_SUFFIX_LB_ITERATOR));
	SetLocalString(oDest,
		_IS_GUI_PREFIX + IntToString(_IS_GUI_ID_LB_CRITERIA),
		GetLocalString(oSrc,
			_IS_GUI_PREFIX + IntToString(_IS_GUI_ID_LB_CRITERIA)));

	for (i = 0; i < n; i++)
	{
		s = _IS_GUI_PREFIX_LB_CRITERIA + IntToString(i);
		SetLocalInt(oDest, s, GetLocalInt(oSrc, s));
	}

	for (i = _IS_GUI_ID_BASIC_START; i <= _IS_GUI_ID_BASIC_END; i++)
	{
		s = _IS_GUI_PREFIX + IntToString(i);
		SetLocalString(oDest, s, GetLocalString(oSrc, s));
	}

	SetLocalObject(oDest, _IS_GUI_VAR_MAIN_GUI,
		GetLocalObject(oSrc, _IS_GUI_VAR_MAIN_GUI));
}

void _is_LoadState(object oGUI)
{
	int i;
	string s;
	object oMain;

	oMain = GetLocalObject(oGUI, _IS_GUI_VAR_MAIN_GUI);

	SetLocalString(oGUI,
		_IS_GUI_PREFIX + IntToString(_IS_GUI_ID_LB_ORDER), "");
	SetLocalString(oGUI,
		_IS_GUI_PREFIX + IntToString(_IS_GUI_ID_LB_CRITERIA), "");

	_is_PopulateListBox(_IS_GUI_ID_LB_CRITERIA, TRUE, FALSE, oGUI);
	_is_PopulateListBox(_IS_GUI_ID_LB_ORDER, TRUE, FALSE, oGUI);


	for (i = _IS_GUI_ID_BASIC_START; i <= _IS_GUI_ID_BASIC_END; i++)
	{
		s = GetLocalString(oGUI, _IS_GUI_PREFIX + IntToString(i));
		SetLocalGUIVariable(oMain, _IS_SCENE_NAME, i, s);
	}

	SetScrollBarRanges(oMain, _IS_SCENE_NAME, _IS_GUI_NAME_SB_FIRST_X,
		0, _IS_GUI_TXT_FIRST_X_MAX,
		0, _IS_GUI_TXT_FIRST_X_MAX);

	s = GetLocalString(oGUI,
		_IS_GUI_PREFIX + IntToString(_IS_GUI_ID_TXT_FIRST_X));
	SetGUIObjectText(oMain, _IS_SCENE_NAME, _IS_GUI_NAME_TXT_FIRST_X, -1, s);

	SetScrollBarValue(oMain,
		_IS_SCENE_NAME, _IS_GUI_NAME_SB_FIRST_X, StringToInt(s));

	SetGUIObjectText(oMain, _IS_SCENE_NAME,
		_IS_GUI_NAME_TXT_CHARACTER, -1, GetName(oGUI));
	SetLocalObject(oMain, _IS_GUI_VAR_CHARACTER, oGUI);
}

void _is_UpdateGUI(int nID, string sValue, object oGUI)
{
	int i, id;
	object oMain;

	oMain = GetLocalObject(oGUI, _IS_GUI_VAR_MAIN_GUI);
	id = nID;

	switch (nID)
	{
	case _IS_GUI_ID_LB_CRITERIA:
	case _IS_GUI_ID_LB_ORDER:
		if (sValue == "") return;

		_is_MoveListBoxItem(nID, sValue, oGUI);
		break;
	case _IS_GUI_ID_SB_FIRST_X:
		nID = _IS_GUI_ID_TXT_FIRST_X;
	case _IS_GUI_ID_TXT_FIRST_X:
		if (sValue == "")
			sValue = GetLocalString(oGUI, _IS_GUI_PREFIX + IntToString(nID));

		i = StringToInt(sValue);
		if (i < 0) i = 0;
		else if (i > _IS_GUI_TXT_FIRST_X_MAX) i = _IS_GUI_TXT_FIRST_X_MAX;
		sValue = IntToString(i);

		SetLocalString(oGUI, _IS_GUI_PREFIX + IntToString(nID), sValue);
		SetLocalGUIVariable(oMain, _IS_SCENE_NAME, nID, sValue);

		SetGUIObjectText(oMain,
			_IS_SCENE_NAME, _IS_GUI_NAME_TXT_FIRST_X, -1, sValue);

		if (id == _IS_GUI_ID_TXT_FIRST_X)
		{
			SetScrollBarValue(oMain,
				_IS_SCENE_NAME, _IS_GUI_NAME_SB_FIRST_X, StringToInt(sValue));
		}
		break;
	case _IS_GUI_ID_CB_CONTENTS:
	case _IS_GUI_ID_CB_CONTAINERS_ONLY:
		if (sValue == "") return;

		SetLocalString(oGUI, _IS_GUI_PREFIX + IntToString(nID), sValue);
		SetLocalGUIVariable(oMain, _IS_SCENE_NAME, nID, sValue);
		break;
	case _IS_GUI_ID_BN_CLOSE:
		SetLocalGUIVariable(oMain, _INV_SCENE_NAME,
			_INV_GUI_ID_IS_SCENE_STATE, _INV_IS_SCENE_STATE_CLOSED);
		break;
	case _IS_GUI_ID_BN_DEFAULTS:
		_is_InitializeState(oGUI, oMain);
		_is_LoadState(oGUI);
		break;
	case _IS_GUI_ID_LB_CRITERIA_SELECTED:
		if (sValue == "") return;

		SetLocalString(oGUI,
			_IS_GUI_PREFIX + IntToString(_IS_GUI_ID_LB_CRITERIA), sValue);
		break;
	case _IS_GUI_ID_LB_ORDER_SELECTED:
		if (sValue == "") return;

		SetLocalString(oGUI,
			_IS_GUI_PREFIX + IntToString(_IS_GUI_ID_LB_ORDER), sValue);
		break;
	}
}

void _is_StartSort(object oInv, object oGUI, object oParent=OBJECT_INVALID)
{
	object o;

	o = CreateObject(_IS_HELPER_TEMPLATE_TYPE, _IS_HELPER_TEMPLATE,
		GetLocation(GetFirstPC(FALSE)), FALSE, _IS_HELPER_SCRIPT);

	if (!GetIsObjectValid(o))
	{
		if (GetIsObjectValid(oParent))
			DelayCommand(0.0f, ExecuteScript(_IS_HELPER_SCRIPT, oParent));

		return;
	}

	_is_CopyState(oGUI, o);

	if (GetIsObjectValid(oParent))
	{
		SetLocalObject(o, _IS_HELPER_VAR_PARENT, oParent);
	}
	else
	{
		SetLocalObject(o, _IS_HELPER_VAR_PARENT, o);
	}

	SetLocalObject(o, _IS_HELPER_VAR_GUI, o);
	SetLocalObject(o, _IS_HELPER_VAR_INVENTORY, oInv);

	SetLocalInt(o, _IS_HELPER_VAR_STATE, _IS_HELPER_STATE_INIT);
	DelayCommand(0.01f, ExecuteScript(_IS_HELPER_SCRIPT, o));
}