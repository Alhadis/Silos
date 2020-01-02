// PythonCasts.i
//
// Polymorphism suport for the Python wrapper ensuring methods that return base class pointers will return an instance of the
// most derived class
//
// NOTE: We're only targeting known cases in the API where polymorphic types are returned

// Case 1: FdoIConnection::CreateCommand(FdoInt32 commandType)
// HACK: Note the hard-cded "arg2" parameter name. If this name ever changes in the SWIG generated code
// we must update it here. If there was a way in SWIG to do this (ala. $1) we would've done that!
%typemap(out) FdoICommand* FdoIConnection::CreateCommand {
    //NOTE: The full FDO command suite is not supported here. Only the most common ones are handled
    FdoCommandType ctype = (FdoCommandType)arg2;
    switch (ctype)
    {
        case FdoCommandType_ApplySchema:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIApplySchema, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_CreateDataStore:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoICreateDataStore, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_CreateSpatialContext:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoICreateSpatialContext, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_Delete:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIDelete, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_DescribeSchema:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIDescribeSchema, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_DescribeSchemaMapping:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIDescribeSchemaMapping, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_DestroyDataStore:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIDestroyDataStore, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_DestroySchema:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIDestroySchema, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_DestroySpatialContext:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIDestroySpatialContext, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_ExtendedSelect:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIExtendedSelect, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_GetClassNames:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIGetClassNames, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_GetSchemaNames:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIGetSchemaNames, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_GetSpatialContexts:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIGetSpatialContexts, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_Insert:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIInsert, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_ListDataStores:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIListDataStores, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_Select:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoISelect, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_SelectAggregates:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoISelectAggregates, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_SQLCommand:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoISQLCommand, SWIG_POINTER_OWN | 0);
            break;
        case FdoCommandType_Update:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIUpdate, SWIG_POINTER_OWN | 0);
            break;
        default:
            PyErr_SetString(PyExc_RuntimeError, "Command type is either invalid or not supported/implemented by this wrapper API");
            goto fail;
            break;
    }
}

//Case 2: Anything that returns FdoClassDefinition*
%typemap(out) FdoClassDefinition* {
    FdoClassType ctype = $1->GetClassType();
    switch(ctype)
    {
        case FdoClassType_Class:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoClass, SWIG_POINTER_OWN | 0);
            break;
        case FdoClassType_FeatureClass:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoFeatureClass, SWIG_POINTER_OWN | 0);
            break;
        default:
            PyErr_SetString(PyExc_RuntimeError, "class type is either invalid or not supported/implemented by this wrapper API");
            goto fail;
            break;
    }
}

//Case 3: Anything that returns FdoIGeometry*
%typemap(out) FdoIGeometry* {
    FdoGeometryType gtype = $1->GetDerivedType();
    switch(gtype)
    {
        case FdoGeometryType_Point:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIPoint, SWIG_POINTER_OWN | 0);
            break;
        case FdoGeometryType_LineString:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoILineString, SWIG_POINTER_OWN | 0);
            break;
        case FdoGeometryType_Polygon:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIPolygon, SWIG_POINTER_OWN | 0);
            break;
        case FdoGeometryType_MultiPoint:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIMultiPoint, SWIG_POINTER_OWN | 0);
            break;
        case FdoGeometryType_MultiLineString:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIMultiLineString, SWIG_POINTER_OWN | 0);
            break;
        case FdoGeometryType_MultiPolygon:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIMultiPolygon, SWIG_POINTER_OWN | 0);
            break;
        case FdoGeometryType_MultiGeometry:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIMultiGeometry, SWIG_POINTER_OWN | 0);
            break;
        case FdoGeometryType_CurveString:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoICurveString, SWIG_POINTER_OWN | 0);
            break;
        case FdoGeometryType_CurvePolygon:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoICurvePolygon, SWIG_POINTER_OWN | 0);
            break;
        case FdoGeometryType_MultiCurveString:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIMultiCurveString, SWIG_POINTER_OWN | 0);
            break;
        case FdoGeometryType_MultiCurvePolygon:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIMultiCurvePolygon, SWIG_POINTER_OWN | 0);
            break;
        default:
            PyErr_SetString(PyExc_RuntimeError, "geometry type is either invalid or not supported/implemented by this wrapper API");
            goto fail;
            break;
    }
}

//Case 4: Anything that returns FdoExpression*
%typemap(out) FdoExpression* {
    FdoExpressionItemType etype = $1->GetExpressionType();
    switch (etype)
    {
        case FdoExpressionItemType_Identifier:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoIdentifier, SWIG_POINTER_OWN | 0);
            break;
        case FdoExpressionItemType_ComputedIdentifier:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoComputedIdentifier, SWIG_POINTER_OWN | 0);
            break;
        case FdoExpressionItemType_SubSelectExpression:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoSubSelectExpression, SWIG_POINTER_OWN | 0);
            break;
        case FdoExpressionItemType_Parameter:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoParameter, SWIG_POINTER_OWN | 0);
            break;
        case FdoExpressionItemType_Function:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoFunction, SWIG_POINTER_OWN | 0);
            break;
        case FdoExpressionItemType_BinaryExpression:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoBinaryExpression, SWIG_POINTER_OWN | 0);
            break;
        case FdoExpressionItemType_UnaryExpression:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoUnaryExpression, SWIG_POINTER_OWN | 0);
            break;
        case FdoExpressionItemType_DataValue:
            {
                FdoDataValue* tmpData = static_cast<FdoDataValue*>($1);
                FdoDataType dt = tmpData->GetDataType();
                FdoBoolean bMatch = false;
                switch (dt)
                {
                    case FdoDataType_BLOB:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoBLOBValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Boolean:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoBooleanValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Byte:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoByteValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_CLOB:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoCLOBValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_DateTime:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDateTimeValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Decimal:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDecimalValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Double:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDoubleValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Int16:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt16Value, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Int32:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt32Value, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Int64:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt64Value, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Single:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoSingleValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_String:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoStringValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    default:
                        PyErr_SetString(PyExc_RuntimeError, "data value type is either invalid or not supported/implemented by this wrapper API");
                        goto fail;
                        break;
                }
                if (bMatch)
                {
                    break;
                }
            }
        case FdoExpressionItemType_GeometryValue:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoGeometryValue, SWIG_POINTER_OWN | 0);
            break;
        default:
            PyErr_SetString(PyExc_RuntimeError, "expression type is either invalid or not supported/implemented by this wrapper API");
            goto fail;
            break;
    }
}

//Case 5: Anything that eturns FdoValueExpression*
%typemap(out) FdoValueExpression* {
    FdoExpressionItemType etype = $1->GetExpressionType();
    switch (etype)
    {
        case FdoExpressionItemType_SubSelectExpression:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoSubSelectExpression, SWIG_POINTER_OWN | 0);
            break;
        case FdoExpressionItemType_Parameter:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoParameter, SWIG_POINTER_OWN | 0);
            break;
        case FdoExpressionItemType_DataValue:
            {
                FdoDataValue* tmpData = static_cast<FdoDataValue*>($1);
                FdoDataType dt = tmpData->GetDataType();
                FdoBoolean bMatch = false;
                switch (dt)
                {
                    case FdoDataType_BLOB:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoBLOBValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Boolean:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoBooleanValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Byte:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoByteValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_CLOB:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoCLOBValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_DateTime:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDateTimeValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Decimal:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDecimalValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Double:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDoubleValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Int16:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt16Value, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Int32:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt32Value, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Int64:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt64Value, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Single:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoSingleValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_String:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoStringValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    default:
                        PyErr_SetString(PyExc_RuntimeError, "data value type is either invalid or not supported/implemented by this wrapper API");
                        goto fail;
                        break;
                }
                if (bMatch)
                {
                    break;
                }
            }
        case FdoExpressionItemType_GeometryValue:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoGeometryValue, SWIG_POINTER_OWN | 0);
            break;
        default:
            PyErr_SetString(PyExc_RuntimeError, "expression type is either invalid or not supported/implemented by this wrapper API");
            goto fail;
            break;
    }
}

//Case 6: Anything that returns FdoLiteralValue*
%typemap(out) FdoLiteralValue* {
    FdoLiteralValueType lt = $1->GetLiteralValueType();
    switch (lt)
    {
        case FdoLiteralValueType_Data:
            {
                FdoDataValue* tmpData = static_cast<FdoDataValue*>($1);
                FdoDataType dt = tmpData->GetDataType();
                FdoBoolean bMatch = false;
                switch (dt)
                {
                    case FdoDataType_BLOB:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoBLOBValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Boolean:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoBooleanValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Byte:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoByteValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_CLOB:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoCLOBValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_DateTime:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDateTimeValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Decimal:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDecimalValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Double:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDoubleValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Int16:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt16Value, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Int32:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt32Value, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Int64:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt64Value, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_Single:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoSingleValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    case FdoDataType_String:
                        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoStringValue, SWIG_POINTER_OWN | 0);
                        bMatch = true;
                        break;
                    default:
                        PyErr_SetString(PyExc_RuntimeError, "data value type is either invalid or not supported/implemented by this wrapper API");
                        goto fail;
                        break;
                }
                if (bMatch)
                {
                    break;
                }
            }
        case FdoLiteralValueType_Geometry:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoGeometryValue, SWIG_POINTER_OWN | 0);
            break;
        default:
            PyErr_SetString(PyExc_RuntimeError, "literal value type is either invalid or not supported/implemented by this wrapper API");
            goto fail;
            break;
    }
}

//Case 7: Anything that returns FdoDataValue*
%typemap(out) FdoDataValue* {
    FdoDataType dt = $1->GetDataType();
    switch (dt)
    {
        case FdoDataType_BLOB:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoBLOBValue, SWIG_POINTER_OWN | 0);
            break;
        case FdoDataType_Boolean:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoBooleanValue, SWIG_POINTER_OWN | 0);
            break;
        case FdoDataType_Byte:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoByteValue, SWIG_POINTER_OWN | 0);
            break;
        case FdoDataType_CLOB:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoCLOBValue, SWIG_POINTER_OWN | 0);
            break;
        case FdoDataType_DateTime:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDateTimeValue, SWIG_POINTER_OWN | 0);
            break;
        case FdoDataType_Decimal:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDecimalValue, SWIG_POINTER_OWN | 0);
            break;
        case FdoDataType_Double:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDoubleValue, SWIG_POINTER_OWN | 0);
            break;
        case FdoDataType_Int16:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt16Value, SWIG_POINTER_OWN | 0);
            break;
        case FdoDataType_Int32:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt32Value, SWIG_POINTER_OWN | 0);
            break;
        case FdoDataType_Int64:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInt64Value, SWIG_POINTER_OWN | 0);
            break;
        case FdoDataType_Single:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoSingleValue, SWIG_POINTER_OWN | 0);
            break;
        case FdoDataType_String:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoStringValue, SWIG_POINTER_OWN | 0);
            break;
        default:
            PyErr_SetString(PyExc_RuntimeError, "data value type is either invalid or not supported/implemented by this wrapper API");
            goto fail;
            break;
    }
}

//Case 8: Anything that returns FdoPropertyDefinition*
%typemap(out) FdoPropertyDefinition* {
    FdoPropertyType pt = $1->GetPropertyType();
    switch (pt)
    {
        case FdoPropertyType_DataProperty:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDataPropertyDefinition, SWIG_POINTER_OWN | 0);
            break;
        case FdoPropertyType_GeometricProperty:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoGeometricPropertyDefinition, SWIG_POINTER_OWN | 0);
            break;
        case FdoPropertyType_RasterProperty:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoRasterPropertyDefinition, SWIG_POINTER_OWN | 0);
            break;
        case FdoPropertyType_ObjectProperty:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoObjectPropertyDefinition, SWIG_POINTER_OWN | 0);
            break;
        case FdoPropertyType_AssociationProperty:
            $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoAssociationPropertyDefinition, SWIG_POINTER_OWN | 0);
            break;
        default:
            PyErr_SetString(PyExc_RuntimeError, "property type is either invalid or not supported/implemented by this wrapper API");
            goto fail;
            break;
    }
}

//Case 9: Anything that returns FdoFilter*
%typemap(out) FdoFilter* {
    if (dynamic_cast<FdoBinaryLogicalOperator*>($1) != NULL) {
        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoBinaryLogicalOperator, SWIG_POINTER_OWN | 0);
    } else if (dynamic_cast<FdoUnaryLogicalOperator*>($1) != NULL) {
        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoUnaryLogicalOperator, SWIG_POINTER_OWN | 0);
    } else if (dynamic_cast<FdoComparisonCondition*>($1) != NULL) {
        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoComparisonCondition, SWIG_POINTER_OWN | 0);
    } else if (dynamic_cast<FdoDistanceCondition*>($1) != NULL) {
        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoDistanceCondition, SWIG_POINTER_OWN | 0);
    } else if (dynamic_cast<FdoSpatialCondition*>($1) != NULL) {
        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoSpatialCondition, SWIG_POINTER_OWN | 0);
    } else if (dynamic_cast<FdoInCondition*>($1) != NULL) {
        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoInCondition, SWIG_POINTER_OWN | 0);
    } else if (dynamic_cast<FdoNullCondition*>($1) != NULL) {
        $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), SWIGTYPE_p_FdoNullCondition, SWIG_POINTER_OWN | 0);
    } else {
        PyErr_SetString(PyExc_RuntimeError, "filter type is either invalid or not supported/implemented by this wrapper API");
        goto fail;
    }
}