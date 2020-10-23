#include "mergesort_inc"

void main()
{
	int state;

	int start, end;
	int index, inc;
	int cur_start, cur_mid, cur_end;

	start = ms_param_GetDataStart(OBJECT_SELF);
	end = ms_param_GetDataEnd(OBJECT_SELF);

	state = GetLocalInt(OBJECT_SELF, _MS_HELPER_VAR_STATE);

	switch (state)
	{
	case _MS_HELPER_STATE_INIT:
		SetLocalInt(OBJECT_SELF, _MS_HELPER_VAR_INDEX, start);
		SetLocalInt(OBJECT_SELF, _MS_HELPER_VAR_INCREMENT, 1);
		SetLocalInt(OBJECT_SELF, _MS_HELPER_VAR_STATE, _MS_HELPER_STATE_SORT);
		SetLocalInt(OBJECT_SELF,
			_MS_HELPER_VAR_DATA_OFFSET, GetVariableCount(OBJECT_SELF)+1);
	case _MS_HELPER_STATE_SORT:
		index = GetLocalInt(OBJECT_SELF, _MS_HELPER_VAR_INDEX);
		inc = GetLocalInt(OBJECT_SELF, _MS_HELPER_VAR_INCREMENT);

		cur_start = index;
		index += inc;
		cur_mid = index;
		index += inc;
		cur_end = index - 1;

		if (cur_mid > end)
		{
			cur_mid = end;
			cur_end = end;
		}
		else if (cur_end > end)
		{
			cur_end = end;
		}

		ms_ExecuteMerge(OBJECT_SELF, cur_start, cur_mid, cur_end);

		if (cur_end == end && cur_start == start)
		{
			DelayCommand(0.0f,
				ExecuteScript(
					GetLocalString(OBJECT_SELF,	_MS_CALLBACK_VAR_SCRIPT),
					GetLocalObject(OBJECT_SELF, _MS_CALLBACK_VAR_OBJECT)));

			DestroyObject(OBJECT_SELF, 0.01f);
		}
		else
		{
			if (index > end)
			{
				index = start;
				inc *= 2;
				SetLocalInt(OBJECT_SELF, _MS_HELPER_VAR_INCREMENT, inc);
			}

			SetLocalInt(OBJECT_SELF, _MS_HELPER_VAR_INDEX, index);

			DelayCommand(0.0f, ExecuteScript(_MS_HELPER_SCRIPT, OBJECT_SELF));
		}
		break;
	}
}