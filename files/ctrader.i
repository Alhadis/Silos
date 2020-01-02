%module ctrader
%include "std_vector.i"
%{
#include "CTrader.h"
#include "ThostFtdcUserApiDataType.h"
#include "ThostFtdcUserApiStruct.h"
#include "ThostFtdcTraderApi.h"
#include "TraderSpi.h"
%}
%include "ThostFtdcUserApiDataType.h"
%include "ThostFtdcUserApiStruct.h"
%include "ThostFtdcTraderApi.h"
%include "TraderSpi.h"
%include "CTrader.h"

