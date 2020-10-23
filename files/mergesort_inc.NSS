const string _MS_CALLBACK_VAR_OBJECT = "_ms_cb_object";
const string _MS_CALLBACK_VAR_SCRIPT = "_ms_cb_script";

const string _MS_PARAMS_VAR_DATA = "_ms_data";
const string _MS_PARAMS_VAR_DATA_START = "_ms_start";
const string _MS_PARAMS_VAR_DATA_END = "_ms_end";
const string _MS_PARAMS_VAR_MERGE = "_ms_merge";
const string _MS_PARAMS_VAR_COMPARE = "_ms_compare";

const string _MS_HELPER_TEMPLATE = "plc_ipoint ";
const int _MS_HELPER_TEMPLATE_TYPE = OBJECT_TYPE_PLACEABLE;

const string _MS_HELPER_NAME = "_ms_helper";
const string _MS_HELPER_SCRIPT = "mergesort_helper";
const string _MS_HELPER_VAR_STATE = "_ms_state";

const int _MS_HELPER_STATE_INIT = 0;
const int _MS_HELPER_STATE_SORT = 1;

const string _MS_HELPER_VAR_INDEX = "_ms_cur_index";
const string _MS_HELPER_VAR_INCREMENT = "_ms_cur_inc";
const string _MS_HELPER_VAR_DATA_OFFSET = "_ms_offset";

struct ms_param
{
	object oData;
	int nStart;
	int nEnd;
	string sMerge;
	string sCompare;
};

// Sets sorting parameters on 'oParam'. 'oData' is the object that contains
// the values to be sorted. 'nStart' and 'nEnd' specify the index range of
// the data array. 'sMerge' is the script that will run when merging.
// 'sCompare' is the script that will run when comparing values.
void ms_param_SetParams(object oParam, object oData, int nStart, int nEnd, string sMerge, string sCompare)
{
	SetLocalObject(oParam, _MS_PARAMS_VAR_DATA, oData);
	SetLocalInt(oParam, _MS_PARAMS_VAR_DATA_START, nStart);
	SetLocalInt(oParam, _MS_PARAMS_VAR_DATA_END, nEnd);
	SetLocalString(oParam, _MS_PARAMS_VAR_MERGE, sMerge);
	SetLocalString(oParam, _MS_PARAMS_VAR_COMPARE, sCompare);
}

// Sets the data parameter of 'oParam' to 'oData'.
void ms_param_SetData(object oParam, object oData)
{
	SetLocalObject(oParam, _MS_PARAMS_VAR_DATA, oData);
}

// Sets the data start parameter of 'oParam' to 'nStart'.
void ms_param_SetDataStart(object oParam, int nStart)
{
	SetLocalInt(oParam, _MS_PARAMS_VAR_DATA_START, nStart);
}

// Sets the data end parameter of 'oParam' to 'nEnd'.
void ms_param_SetDataEnd(object oParam, int nEnd)
{
	SetLocalInt(oParam, _MS_PARAMS_VAR_DATA_END, nEnd);
}

// Sets the merge script parameter of 'oParam' to 'sMerge'.
void ms_param_SetMerge(object oParam, string sMerge)
{
	SetLocalString(oParam, _MS_PARAMS_VAR_MERGE, sMerge);
}

// Sets the compare script parameter of 'oParam' to 'sCompare'.
void ms_param_SetCompare(object oParam, string sCompare)
{
	SetLocalString(oParam, _MS_PARAMS_VAR_COMPARE, sCompare);
}

// Reads the sorting parameters from 'oParam' into a structure.
//
// Returns:
//   a struct ms_param containing the sort parameters
struct ms_param ms_param_GetParams(object oParam)
{
	struct ms_param config;

	config.oData = GetLocalObject(oParam, _MS_PARAMS_VAR_DATA);
	config.nStart = GetLocalInt(oParam, _MS_PARAMS_VAR_DATA_START);
	config.nEnd = GetLocalInt(oParam, _MS_PARAMS_VAR_DATA_END);
	config.sMerge = GetLocalString(oParam, _MS_PARAMS_VAR_MERGE);
	config.sCompare = GetLocalString(oParam, _MS_PARAMS_VAR_COMPARE);

	return config;
}

// Gets the data parameter of 'oParam'.
object ms_param_GetData(object oParam)
{
	return GetLocalObject(oParam, _MS_PARAMS_VAR_DATA);
}

// Gets the data start parameter of 'oParam'.
int ms_param_GetDataStart(object oParam)
{
	return GetLocalInt(oParam, _MS_PARAMS_VAR_DATA_START);
}

// Gets the data end parameter of 'oParam'.
int ms_param_GetDataEnd(object oParam)
{
	return GetLocalInt(oParam, _MS_PARAMS_VAR_DATA_END);
}

// Gets the merge script parameter of 'oParam'.
string ms_param_GetMerge(object oParam)
{
	return GetLocalString(oParam, _MS_PARAMS_VAR_MERGE);
}

// Gets the compare script parameter of 'oParam'.
string ms_param_GetCompare(object oParam)
{
	return GetLocalString(oParam, _MS_PARAMS_VAR_COMPARE);
}

// Validates the parameters that are set on 'oParam'.
//
// Returns:
//   1, if valid, or
//   0, if not
int ms_param_IsValid(object oParam)
{
	struct ms_param config;

	config = ms_param_GetParams(oParam);

	if (!GetIsObjectValid(config.oData)) return 0;

	if (config.nStart < 0 || config.nEnd < 0) return 0;
	if (config.nEnd < config.nStart) return 0;

	if (config.sMerge == "") return 0;
	if (config.sCompare == "") return 0;

	return 1;
}

// Copies sorting parameters from 'oSrc' to 'oDest'.
void ms_param_CopyParams(object oSrc, object oDest)
{
	struct ms_param config;

	config = ms_param_GetParams(oSrc);
	ms_param_SetParams(oDest,
		config.oData, config.nStart, config.nEnd,
		config.sMerge, config.sCompare);
}

// Converts the parameters specified on 'oParam' into a string.
//
// Returns:
//   a string containing the sort parameters
string ms_param_ToString(object oParam)
{
	struct ms_param config;

	config = ms_param_GetParams(oParam);

	return "Data Object: (" + ObjectToString(config.oData) +
		")\nData Range: " +
		IntToString(config.nStart) + ", " + IntToString(config.nEnd) +
		"\nMerge: '" +	config.sMerge +
		"'\nCompare: '" + config.sCompare + "'";
}

// Merges the data specified in 'oParam' using the merging script specified
// therein. The partition from 'nLeft' to 'nMid-1' will be merged with the
// partition starting from 'nMid' to 'nRight'.
void ms_ExecuteMerge(object oParam, int nLeft, int nMid, int nRight)
{
	ClearScriptParams();
	AddScriptParameterObject(oParam);
	AddScriptParameterInt(nLeft);
	AddScriptParameterInt(nMid);
	AddScriptParameterInt(nRight);
	ExecuteScriptEnhanced(ms_param_GetMerge(oParam), OBJECT_SELF);
}

// Compares the data specified in 'oParam' using the compare script specified
// therein. The data at 'nIndex1' will be compared with the data at 'nIndex2'.
//
// Returns:
//   < 0, if the data at 'nIndex1' comes before
//     0, if the data are equal
//   > 0, if the data at 'nIndex1' comes after 
int ms_ExecuteCompare(object oParam, int nIndex1, int nIndex2)
{
	ClearScriptParams();
	AddScriptParameterObject(ms_param_GetData(oParam));
	AddScriptParameterInt(nIndex1);
	AddScriptParameterInt(nIndex2);
	return ExecuteScriptEnhanced(ms_param_GetCompare(oParam), OBJECT_SELF);
}

// Runs merge sort on the data specified in 'oParam'. This function is
// asynchronous and will call 'sCallbackScript' on 'oCallbackTarget' when
// the sorting is complete.
void ms_MergeSortAsync(object oParam, object oCallbackTarget, string sCallbackScript)
{
	object o;

	if (!ms_param_IsValid(oParam)) return;

	o = CreateObject(_MS_HELPER_TEMPLATE_TYPE, _MS_HELPER_TEMPLATE,
		GetLocation(GetFirstPC(FALSE)), FALSE, _MS_HELPER_NAME);

	ms_param_CopyParams(oParam, o);

	SetLocalObject(o, _MS_CALLBACK_VAR_OBJECT, oCallbackTarget);
	SetLocalString(o, _MS_CALLBACK_VAR_SCRIPT, sCallbackScript);

	SetLocalInt(o, _MS_HELPER_VAR_STATE, _MS_HELPER_STATE_INIT);
	DelayCommand(0.0f, ExecuteScript(_MS_HELPER_SCRIPT, o));
}