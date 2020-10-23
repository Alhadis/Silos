#include "nwn2is_inc"
#include "mergesort_inc"

void main()
{
	int state, bRoot, bContents, bCOnly;
	object oInv, oGUI;

	int i, j, k, m, n, x, y;
	object o1, o2;
	string s;

	oGUI = GetLocalObject(OBJECT_SELF, _IS_HELPER_VAR_GUI);
	oInv = GetLocalObject(OBJECT_SELF, _IS_HELPER_VAR_INVENTORY);

	o1 = GetLocalObject(OBJECT_SELF, _IS_HELPER_VAR_PARENT);
	bRoot = (o1 == OBJECT_SELF);

	bContents = StringToInt(_is_GetGUIValue(_IS_GUI_ID_CB_CONTENTS, oGUI));

	s = _is_GetGUIValue(_IS_GUI_ID_CB_CONTAINERS_ONLY, oGUI);
	bCOnly = StringToInt(s) & bContents;

	state = GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_STATE);

	switch (state)
	{
	case _IS_HELPER_STATE_INIT:
		if (_is_GetNumListBoxRows(_IS_GUI_ID_LB_ORDER, oGUI) < 1)
		{
			SetLocalInt(OBJECT_SELF,
				_IS_HELPER_VAR_STATE, _IS_HELPER_STATE_END);
			ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF);
			break;
		}

		i = 0;
		if (bRoot)
			i = StringToInt(_is_GetGUIValue(_IS_GUI_ID_TXT_FIRST_X, oGUI));

		SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_SKIP, i);
		SetLocalInt(OBJECT_SELF, _IS_SORT_VAR_REAL_COUNT, 0);
		SetLocalInt(OBJECT_SELF, _IS_SORT_VAR_COUNT, 0);
		SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_TOTAL, 0);
		SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CONTAINER_COUNT, 0);

		SetLocalObject(OBJECT_SELF, _IS_HELPER_VAR_CONTAINER, OBJECT_INVALID);

		SetLocalInt(OBJECT_SELF,
			_IS_SORT_VAR_DATA_OFFSET, GetVariableCount(OBJECT_SELF)+1);
	case _IS_HELPER_STATE_READ:
		i = GetLocalInt(OBJECT_SELF, _IS_SORT_VAR_REAL_COUNT);
		j = GetLocalInt(OBJECT_SELF, _IS_SORT_VAR_COUNT);
		k = GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_TOTAL);
		x = GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_SKIP);

		if (i == 0) o1 = GetFirstItemInInventory(oInv);
		else o1 = GetNextItemInInventory(oInv);

		while (GetIsObjectValid(o1))
		{
			i++;

			y = GetBaseItemType(o1);

			if (!bCOnly || !bRoot || y == BASE_ITEM_LARGEBOX)
			{
				SetLocalObject(OBJECT_SELF,
					_IS_SORT_PREFIX + IntToString(j), o1);
				j++;

				k += GetItemStackSize(o1);

				if (y == BASE_ITEM_LARGEBOX)
				{
					SetLocalInt(OBJECT_SELF, _IS_SORT_VAR_REAL_COUNT, i);
					SetLocalInt(OBJECT_SELF, _IS_SORT_VAR_COUNT, j);
					SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_TOTAL, k);
					SetLocalObject(OBJECT_SELF, _IS_HELPER_VAR_CONTAINER, o1);

					SetLocalInt(OBJECT_SELF,
						_IS_HELPER_VAR_STATE, _IS_HELPER_STATE_SUBREAD);
					DelayCommand(0.0f,
						ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF));
					return;
				}
			}

			if (i == x)
			{
				SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_SKIP, 0);
				SetLocalInt(OBJECT_SELF, _IS_SORT_VAR_COUNT, 0);
				SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_TOTAL, 0);

				j = 0;
				k = 0;
				x = 0;
			}

			o1 = GetNextItemInInventory(oInv);
		}

		SetLocalInt(OBJECT_SELF, _IS_SORT_VAR_REAL_COUNT, i);
		SetLocalInt(OBJECT_SELF, _IS_SORT_VAR_COUNT, j);
		SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_TOTAL, k);

		if (i <= x || j < 1)
		{
			SetLocalInt(OBJECT_SELF,
				_IS_HELPER_VAR_STATE, _IS_HELPER_STATE_END);
			ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF);
			break;
		}

		n = GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CONTAINER_COUNT);
		for (m = 0; m < n; m++)
		{
			s = _IS_HELPER_PREFIX_CONTAINER + IntToString(m);

			o1 = GetLocalObject(OBJECT_SELF, s);
			DeleteLocalObject(OBJECT_SELF, s);
			SetLocalObject(OBJECT_SELF, s, o1);
		}

		i = GetLocalInt(OBJECT_SELF, _IS_SORT_VAR_DATA_OFFSET);
		ms_param_SetParams(OBJECT_SELF,
			OBJECT_SELF, i, i+j-1, _IS_SORT_MERGE_SCRIPT, "");

		if (bCOnly && bRoot)
		{
			SetLocalInt(OBJECT_SELF,
				_IS_HELPER_VAR_STATE, _IS_HELPER_STATE_TAKE);
		}
		else
		{
			_is_ResetListBoxIteration(_IS_GUI_ID_LB_ORDER, oGUI);
			SetLocalInt(OBJECT_SELF,
				_IS_HELPER_VAR_STATE, _IS_HELPER_STATE_SORT);
		}

		DelayCommand(0.0f, ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF));
		break;
	case _IS_HELPER_STATE_SUBREAD:
		i = GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_TOTAL);
		j = GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CONTAINER_COUNT);
		x = GetLocalInt(OBJECT_SELF, _IS_SORT_VAR_REAL_COUNT);
		y = GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_SKIP);
		o1 = GetLocalObject(OBJECT_SELF, _IS_HELPER_VAR_CONTAINER);

		o2 = GetFirstItemInInventory(o1);

		if (GetIsObjectValid(o2) && x > y)
		{
			SetLocalObject(OBJECT_SELF,
				_IS_HELPER_PREFIX_CONTAINER + IntToString(j), o1);
			j++;
		}

		while (GetIsObjectValid(o2))
		{
			i += GetItemStackSize(o2);
			GetNextItemInInventory(oInv);

			o2 = GetNextItemInInventory(o1);
		}

		if (x == y)
		{
			SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_SKIP, 0);
			SetLocalInt(OBJECT_SELF, _IS_SORT_VAR_COUNT, 0);

			i = 0;
		}

		SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_TOTAL, i);
		SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CONTAINER_COUNT, j);

		SetLocalInt(OBJECT_SELF,
			_IS_HELPER_VAR_STATE, _IS_HELPER_STATE_READ);
		DelayCommand(0.0f, ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF));
		break;
	case _IS_HELPER_STATE_SORT:
		i = _is_GetNextListBoxValue(_IS_GUI_ID_LB_ORDER, oGUI);
		if (i >= 0)
		{
			ms_param_SetCompare(OBJECT_SELF,
				Get2DAString(_IS_2DA_FILE, _IS_2DA_FIELD_COMPARE, i));

			if (!ms_param_IsValid(OBJECT_SELF))
			{
				DelayCommand(0.0f,
					ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF));
				break;
			}

			ms_MergeSortAsync(OBJECT_SELF, OBJECT_SELF, _IS_HELPER_SCRIPT);

			break;
		}

		SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_STATE, _IS_HELPER_STATE_TAKE);
	case _IS_HELPER_STATE_TAKE:
		i = GetLocalInt(OBJECT_SELF, _IS_SORT_VAR_DATA_OFFSET);
		j = i + GetLocalInt(OBJECT_SELF, _IS_SORT_VAR_COUNT);

		while (i < j)
		{
			o1 = GetVariableValueObject(OBJECT_SELF, i);
			ActionTakeItem(o1, oInv, FALSE);
			i++;
		}

		SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CHECK_TOTAL, 0);

		SetLocalInt(OBJECT_SELF,
			_IS_HELPER_VAR_STATE, _IS_HELPER_STATE_CHECK);
		DelayCommand(0.001f, ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF));
		break;
	case _IS_HELPER_STATE_CHECK:
		i = GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CHECK_COUNT);
		j = GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CHECK_TOTAL);

		k = 0;

		if (i < _IS_HELPER_CHECK_MAX)
		{
			if (j == 0) o1 = GetFirstItemInInventory(OBJECT_SELF);
			else o1 = GetNextItemInInventory(OBJECT_SELF);

			while (GetIsObjectValid(o1))
			{
				j += GetItemStackSize(o1);
				k++;

				if (k < _IS_HELPER_CHECK_MAX_ITEMS_PER_CHECK)
				{
					o1 = GetNextItemInInventory(OBJECT_SELF);
				}
				else
				{
					SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CHECK_TOTAL, j);

					DelayCommand(0.0f,
						ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF));
					return;
				}
			}

			i++;
			SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CHECK_COUNT, i);

			if (j < GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_TOTAL))
			{
				SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CHECK_TOTAL, 0);

				DelayCommand(0.001f,
					ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF));
				break;
			}
		}

		if (bContents && bRoot &&
			j == GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_TOTAL))
		{
			SetLocalInt(OBJECT_SELF,
				_IS_HELPER_VAR_STATE, _IS_HELPER_STATE_SUBSORT);
		}
		else
		{
			SetLocalInt(OBJECT_SELF,
				_IS_HELPER_VAR_STATE, _IS_HELPER_STATE_GIVE);
		}

		DelayCommand(0.0f, ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF));
		break;
	case _IS_HELPER_STATE_SUBSORT:
		i = GetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CONTAINER_COUNT);
		if (i > 0)
		{
			i--;
			SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_CONTAINER_COUNT, i);

			o1 = GetLocalObject(OBJECT_SELF,
				_IS_HELPER_PREFIX_CONTAINER + IntToString(i));

			_is_StartSort(o1, oGUI, OBJECT_SELF);

			break;
		}

		SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_STATE, _IS_HELPER_STATE_GIVE);
	case _IS_HELPER_STATE_GIVE:
		i = GetLocalInt(OBJECT_SELF, _IS_SORT_VAR_DATA_OFFSET);
		j = i + GetLocalInt(OBJECT_SELF, _IS_SORT_VAR_COUNT);

		while (i < j)
		{
			o1 = GetVariableValueObject(OBJECT_SELF, i);
			ActionGiveItem(o1, oInv, FALSE);
			i++;
		}

		SetLocalInt(OBJECT_SELF, _IS_HELPER_VAR_STATE, _IS_HELPER_STATE_END);
		DelayCommand(0.001f, ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF));
		break;
	case _IS_HELPER_STATE_END:
		o1 = GetFirstItemInInventory(OBJECT_SELF);
		if (GetIsObjectValid(o1))
		{
			DelayCommand(0.001f,
				ExecuteScript(_IS_HELPER_SCRIPT, OBJECT_SELF));
			break;
		}

		if (bRoot)
		{
			o1 = GetLocalObject(oGUI, _IS_GUI_VAR_MAIN_GUI);
			SetLocalGUIVariable(o1, _INV_SCENE_NAME,
				_INV_GUI_ID_IS_SORT_STATE, _INV_IS_SORT_STATE_IDLE);
		}
		else
		{
			o1 = GetLocalObject(OBJECT_SELF, _IS_HELPER_VAR_PARENT);
			DelayCommand(0.0f, ExecuteScript(_IS_HELPER_SCRIPT, o1));
		}

		DestroyObject(OBJECT_SELF, 0.01f);
		break;
	}
}