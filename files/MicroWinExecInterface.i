/*Everything in the %{ ... %} block is simply copied verbatim to the resulting wrapper file created by SWIG.*/

%module MicroWinExecInterface

%{
#include "MicroWinExecInterface.h"
#include "DataLogWizard.h"
#include "DataLogTools.h"
#include "BlkIds.h"
#include "errdefs.h"
#include "afxcoll.h"
#include "afx.h"
#include "BlockCompassDefs.h"
#include "opglobaldefs.h"
#include "CommCompassDefs.h"
#include "gridglobaldefs.h"
#include "SysDataBlockData.h"
#include "CompMemFile.h"
#include "globaldefs.h"
#include "BlkIds.h"
#include "symglobaldefs.h"
#include "statglobaldefs.h"
#include "minwinbase.h"
#include "SDBPNDevice.h"
#include "PNBlockData.h"
#include "PNWizard.h"
#include "SDBPNController.h"
#include "PhysicalSDB.h"
#include "SDBPNPLCRole.h"
#include "DCPDefs.h"
#include "PLCInformationData.h"
#include "SDBPNIDevice.h"
#include "IODevice.h"
#include "IOModule.h"
#include "mwnetworkinfo.h"
#include "SigCompassDefs.h"
#include "dialogdata.h"
#include "StringEx.h"
#include "SDBIOBase.h"
#include "SDBDigitalInputs.h"
#include "SDBDigitalOutputs.h"
#include "SDBAnalogInputs.h"
#include "SDBAnalogOutputs.h"
#include "SDBBackgroundTime.h"
#include "SDBStartup.h"
#include "SDBSecurity.h"
#include "SDBRetentiveRanges.h"
#include "SDBEthernet.h"
#include "SDBCommunicationPorts.h"
#include "SDBBatteryBoard.h"
#include "SDBDataWrite.h"
#include "SDBBase.h"
#include "SDBCommon.h"
#include "SDBCPU.h"
#include "SDBSignalBoard.h"
#include "SDBSignalModule.h"
#include "sdbdata.h"
#include "DeviceCompassDefs.h"
#include "SDBDefs.h"
#include "mwversion.h"
#include "Smart200PLCPDEV.h"
#include "PNDefs.h"

#define LPCTSTR char*
#define RPC_IF_HANDLE void*
#define constexpr 
%}
#define AFX_EXT_CLASS
#define INT_CLS_IMPEXPMODE
#define AFX_EXT_CLASS 
#define STDMETHODIMP HRESULT
%ignore PRJ_Download(BLOCK_TYPES);/*ignore 1 default parameter hMainWnd*/
%ignore PRJ_SetRemoteAddress(MWNetworkInfo);/*ignore 2 default parameters bValidAddress and bSetSystemBlock*/
%ignore PRJ_SetRemoteAddress(MWNetworkInfo,BOOL);/*ignore 1 default parameter bSetSystemBlock*/
%ignore LIBID_DeviceCompassDefsLib;
%include "SDBPNDevice.h"
%ignore DataLog::m_aDefinitions;
%ignore EX_DataLogWizardData::m_aDataLogs;
%include "PLCInformationData.h"
%include "DCPDefs.h"
%include "DataLogWizard.h"
%include "DataLogTools.h"
%ignore SDBData::m_aSignalModules;
%ignore SDBData::m_aMotionControls;
%ignore SDBData::Store;
%ignore SDBData::Retrieve;
%ignore CCompMemFile;
%ignore g_mwSDBDataID;
%ignore __MIDL_itf_CommCompassDefs_0000_0000_v0_0_c_ifspec;
%ignore __MIDL_itf_CommCompassDefs_0000_0000_v0_0_s_ifspec;
%ignore LIBID_CommCompassDefsLib;
%ignore POU_SYM_TABLE;
%ignore POU_SYM_TABLE_NAME;
%include "BlkIds.h"
%include "symglobaldefs.h"
%include "globaldefs.h"
%include "MicroWinExecInterface.h"
%include "typemaps.i"
%include "BlkIds.h"
%include "errdefs.h"
%include "gridglobaldefs.h"
%include "opglobaldefs.h"
%include <windows.i>
%include "afx.h"
%include "statglobaldefs.h"
%include "minwinbase.h"
%include "SysDataBlockData.h"
%include "CommCompassDefs.h"
%include "CompMemFile.h"
%include "PNBlockData.h"
%include "PNWizard.h"
%include "SDBPNController.h"
%include "PhysicalSDB.h"
%include "SDBPNPLCRole.h"
%include "SDBPNIDevice.h"
%include "IODevice.h"
%include "IOModule.h"
%include "mwnetworkinfo.h"
%ignore LIBID_SigCompassDefsLib;
%include "SigCompassDefs.h"
%include "StringEx.h"
%include "SDBIOBase.h"
%include "SDBDigitalInputs.h"
%include "SDBDigitalOutputs.h"
%include "SDBAnalogInputs.h"
%include "SDBAnalogOutputs.h"
%include "SDBBackgroundTime.h"
%include "SDBStartup.h"
%include "SDBSecurity.h"
%include "SDBRetentiveRanges.h"
%include "SDBEthernet.h"
%include "SDBCommunicationPorts.h"
%include "SDBBatteryBoard.h"
%include "SDBDataWrite.h"
%include "SDBBase.h"
%include "SDBCommon.h"
%include "SDBCPU.h"
%include "SDBSignalBoard.h"
%include "SDBSignalModule.h"
%include "sdbdata.h"
%include "DeviceCompassDefs.h"
%include "SDBDefs.h"
%include "mwversion.h"
%include "Smart200PLCPDEV.h"
%include "PNDefs.h"

/*extend directive is used to extend an existing class/struct, meaning add member function to the class.
Here I MUST add "operator=" to CDWordArray because CDWordArray only have Copy function which SWIG doesn't 
know---SWIG thought every POD data types&class&structs can be assigned by "=" operation. 
*/
%extend CDWordArray
{
	CDWordArray& operator=(const CDWordArray& rSrc)
	{
		$this->Copy(rSrc);
	}
};

%extend CStringArray
{
	CStringArray& operator=(const CStringArray& rSrc)
	{
		$this->Copy(rSrc);
	}
};
/*ignore directive is used to ignore a class, a function. For the class/function that won't be used in my test script,I just ignore it.*/
%ignore CMapPtrToPtr;
%ignore CMapWordToOb;
%ignore CMapStringToOb;
%ignore CMapPtrToWord;
%ignore CMapStringToPtr;
%ignore CMapWordToPtr;
%ignore CMapStringToString;
%ignore CMapStringToPtr::LookupKey;
%ignore CMapStringToOb::LookupKey;
%ignore LIBID_BlockCompassDefsLib;
%include "BlockCompassDefs.h"
%include "afxcoll.h"
%include "dialogdata.h"

/*some infrastructural methods.*/
void *malloc(int nbytes);
void free(void *);
WORD* create_pWORD(WORD value );   /*create a pointer of WORD type with init value.*/
void print_pWORDValue(WORD* pValue);/*print the WORD value*/
WORD get_pWORDValue(WORD* pValue);/*get the WORD value*/
void destroy_pWORD(WORD* pValue);  /*destroy the pointer created by create_pWORD interface.*/
int* create_pint(int value);       /*create a pointer of int type with init value.*/
void print_pintValue(int* pValue);/*print the int value*/
int get_pintValue(int* pValue);/*get the int value.*/
void destroy_pint(int* pValue);    /*destroy the pointer created by create_pint interface.*/
BOOL* create_pBOOL(BOOL value);    /*create a pointer of BOOL type with init value.*/
void print_pBOOL(BOOL* pValue);/*print the BOOL value.*/
BOOL get_pBOOLValue(BOOL* pValue);/*get the BOOL value.*/
void destroy_pBOOL(BOOL* pValue);  /*destroy the pointer created by create_pBOOL interface.*/
int compare_CString1(CString& value1,CString& value2);
int compare_CString2(LPTSTR value1,LPTSTR value2);
int compare_CString3(CString& value1,LPTSTR value2);
int compare_CString4(CString& src,CString dst,int nLen);
void print_CString(CString& value);/*print a CString object*/
HWND get_defaultHWND();/*get global default HWND.*/
BYTE get_pByteBYTE(byte* pValue);
WORD get_pByteWord(byte* pValue);
DWORD get_pByteDWORD(byte* pValue);
byte* create_pByte(int value, int nType);/*create a byte pointer to an int value*/
void destroy_pByte(byte* pValue);/*delete a byte pointer to an int value*/
int UpdateFW(CString strFilePath);/*update FW.*/
unsigned int* create_puint(unsigned int value);/*create an unsigned int.*/
void print_puintValue(unsigned int* pValue);/*print unsigned int*/
int get_puintValueS(unsigned int* pValue);/*get unsigned int as int.*/
unsigned int get_puintValueU(unsigned int* pValue);/*get unsigned int as unsigned int.*/
void destroy_puint(unsigned int* pValue);/*destroy the memory*/

/*Session and Connection methods*/
STATUSCODE test_InitEnv(CString& strErrMsg);
STATUSCODE test_GetMicroWinVersion(WORD& rRevisionType,WORD& rMajVer,WORD& MinVer,WORD& rSP,WORD& rHF,WORD& rIncNo,WORD& rBldNo);
STATUSCODE test_CreateSession(CString& ipAddress, CString& subNetMask, CString& errorMsg);
STATUSCODE test_OpenConnection(MWNetworkInfo destNetworkInfo, CString accessPoint, eCOMMCOMPASS_BAUDRATES eBaudRate, BOOL bEthernet);
/*End of Session and Connection methods*/

/*Grid Editor Interface to the USER Layer. These methods are called for both LAD & FBD*/
STATUSCODE GRID_OpenPOU(MW_ID pouId, WORD netNumber);
STATUSCODE GRID_GetHelpId(MW_ID pouId, WORD netNumber, BYTE row, BYTE col, DWORD &rHelpId);
STATUSCODE GRID_CloseCurrentNetwork();
STATUSCODE GRID_GetNetworkDimensions(MW_ID pouId, WORD netNumber, LPBYTE pNumRows, LPBYTE pNumCols, LPBYTE pPrintCols);
STATUSCODE GRID_GetPOUDimensions(MW_ID pouId, LPBYTE pNumCols);
STATUSCODE GRID_InsertRow(MW_ID pouId, WORD netNumber, BYTE row, BYTE col);
STATUSCODE GRID_DeleteRow(MW_ID pouId, WORD netNumber, BYTE row, BYTE col);
STATUSCODE GRID_InsertColumn(MW_ID pouId, WORD netNumber, BYTE row, BYTE col);
STATUSCODE GRID_DeleteColumn(MW_ID pouId, WORD netNumber, BYTE row, BYTE col);
STATUSCODE GRID_SizeCursor(MW_ID, WORD, GRID_CELL_LOCATION, GRID_RECTANGLE*);
STATUSCODE GRID_SizeVisibleRectangle(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cellLoc, GRID_RECTANGLE *pVisibleRect);
STATUSCODE GRID_GetElement(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cLoc, GRID_MATRIX_ELEMENT *pElement, BOOL bLoadHotSpots = FALSE);
STATUSCODE GRID_CanDropInstruction(MW_ID, WORD, GRID_CELL_LOCATION, WORD, WORD, MW_EDIT_MODE, LPBOOL);
STATUSCODE GRID_SetElementInst(MW_ID pouId, WORD netNumber, GRID_OPERAND_LOCATION opLoc, WORD instID, WORD instNumber, MW_EDIT_MODE editMode, GRID_CELL_LOCATION*, GRID_RECTANGLE*);
STATUSCODE GRID_CutSelection(GRID_SELECTION selection, GRID_CELL_LOCATION &newCursorLocation);
STATUSCODE GRID_CopySelection(GRID_SELECTION selection);
STATUSCODE GRID_SetSubbranch(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cLoc, GRID_CELL_LOCATION* pCursorLoc, GRID_RECTANGLE* pVisibleRect);
STATUSCODE GRID_SetVertical(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cLoc, GRID_VERTICAL setVert, GRID_CELL_LOCATION*, GRID_RECTANGLE*);
STATUSCODE GRID_DeleteVertical(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cLoc, GRID_VERTICAL delVert);
STATUSCODE GRID_CanChangeVertical(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cLoc, LPBOOL pCanInsertVertical, LPBOOL pCanDeleteVertical);
STATUSCODE GRID_GetClosestElement(MW_ID pouId, GRID_RECTANGLE rect, LPWORD pNet, GRID_CELL_LOCATION *pCellLoc);
STATUSCODE GRID_GetNextElementLoc(MW_ID pouId, GRID_RECTANGLE rect, WORD curNet, GRID_CELL_LOCATION curCellLoc, LPWORD pNextNet, GRID_CELL_LOCATION *pNextCellLoc);
STATUSCODE GRID_DeleteSelection(GRID_SELECTION selection, GRID_CELL_LOCATION &newCursorLocation);
STATUSCODE GRID_CanSetSubbranch(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cLoc, LPBOOL pCanSetSubbranch);
STATUSCODE GRID_PasteSelection(GRID_SELECTION selection, MW_EDIT_MODE editMode, GRID_CELL_LOCATION* pCursorLoc, GRID_RECTANGLE* pVisibleRect);
STATUSCODE GRID_DragDrop(GRID_SELECTION *pPreviousSelection, BOOL bDeletePrevious, GRID_SELECTION selection, MW_EDIT_MODE editMode, GRID_CELL_LOCATION* pCursorLoc, GRID_RECTANGLE* pVisibleRect);
STATUSCODE GRID_IsOperand(MW_ID pouId, WORD netNumber, GRID_OPERAND_LOCATION opLoc, LPBOOL pIsParam);
STATUSCODE GRID_GetOperand(MW_ID pouId, WORD netNumber, GRID_OPERAND_LOCATION opLoc, OPERAND_ELEMENT &rElem);
STATUSCODE GRID_SetOperand(MW_ID pouId, WORD netNumber, GRID_OPERAND_LOCATION opLoc, LPTSTR pOperand);
STATUSCODE GRID_GetClosestOperand(MW_ID pouId, GRID_RECTANGLE rect, LPWORD pNet, GRID_OPERAND_LOCATION *pOpLoc);
STATUSCODE GRID_GetClosestInstOperand(MW_ID pouId, WORD curNet, GRID_CELL_LOCATION curCellLoc, GRID_OPERAND_LOCATION *pOpLoc);
STATUSCODE GRID_GetNextOperandLoc(MW_ID pouId, GRID_RECTANGLE rect, WORD curNet, GRID_OPERAND_LOCATION curOpLoc, LPWORD pNextNet, GRID_OPERAND_LOCATION *pNextOpLoc);
STATUSCODE GRID_GetNextInstOperandLoc(MW_ID pouId, WORD netNumber, GRID_OPERAND_LOCATION curOpLoc, GRID_OPERAND_LOCATION *pNextOpLoc);
STATUSCODE GRID_GetOperandFlags(MW_ID pouId, WORD netNumber, GRID_OPERAND_LOCATION opLoc, OPERAND_FLAGS *pOpFlags);
STATUSCODE GRID_GetOperandDataType(MW_ID pouId, WORD netNumber, GRID_OPERAND_LOCATION opLoc, DATA_TYPE_MASK &rDataType, MEMORY_AREA_MASK &memArea);
STATUSCODE GRID_WriteOperand(MW_ID pouId, WORD netNumber, GRID_OPERAND_LOCATION opLoc, CString strValue);
STATUSCODE GRID_ForceOperand(MW_ID pouId, WORD netNumber, GRID_OPERAND_LOCATION opLoc, CString strValue);
STATUSCODE GRID_UnforceOperand(MW_ID pouId, WORD netNumber, GRID_OPERAND_LOCATION opLoc);
STATUSCODE GRID_IsTriggerPaused(LPBOOL pbTriggered);
STATUSCODE GRID_PauseTrigger(BOOL bPause);
STATUSCODE GRID_IsHotSpot(MW_ID pouId, WORD netNumber, GRID_HOTSPOT &rHotSpot, BOOL &rValid);
STATUSCODE GRID_CanConnectHotSpots(MW_ID pouId, WORD netNumber, GRID_HOTSPOT &rStart, GRID_HOTSPOT &rEnd, BOOL &rValid);
STATUSCODE GRID_ConnectHotSpots(MW_ID pouId, WORD netNumber, GRID_HOTSPOT &rStart, GRID_HOTSPOT &rEnd);
/*End of Grid Editor Interface to the USER Layer. These methods are called for both LAD & FBD*/

/*POU Interface to the USER Layer*/
STATUSCODE POU_GetVersion(const MW_ID &rPouId, CString &strVersion);
STATUSCODE POU_SetVersion(const MW_ID &rPouId, const CString &strVersion);
STATUSCODE POU_GenerateDependencyList(const MW_ID &rPouId);
STATUSCODE POU_GetNumDependencies(const MW_ID &rPouId, int &rnNumDepend);
STATUSCODE POU_GetDependencyAt(const MW_ID &rPouId, const int nIndex, MW_ID &rRefPouId, CString &strName);
STATUSCODE POU_CompileNetwork(const MW_ID &rPouId, WORD wNetIdx, WORD &rErrorCount, WORD &rNetSize, BOOL &rReLoad, LANGUAGE &rNetLang);
STATUSCODE POU_CompilePou(const MW_ID &rPouId, WORD &wErrorCount, WORD &rBlockSize, BOOL bReLoad);
STATUSCODE POU_CompilePous(WORD &rErrorCount, WORD &rSize, BOOL bReLoad);
STATUSCODE POU_PostCompile(WORD &wErrorCount);
STATUSCODE POU_ReverseCompileNetwork(const MW_ID &rPouId, WORD wNetIdx);
STATUSCODE POU_ReverseCompilePou(const MW_ID &rPouId);
STATUSCODE POU_ReverseCompilePous(void);
STATUSCODE POU_IsExecutionStatusOn(BOOL &rState);
STATUSCODE POU_IsPLCInRunMode(BOOL &rPLCMode);
STATUSCODE POU_PrepPouForEditor(const MW_ID &rPouId, const PROGRAMMING_EDITOR &rEditorType);
STATUSCODE POU_PrepPousForEditor(const PROGRAMMING_EDITOR &rEditorType);
STATUSCODE POU_GetComment(const MW_ID &rPouId, CString &rComment);
STATUSCODE POU_SetComment(const MW_ID &rPouId, const CString &rComment);
STATUSCODE POU_IsPasteAvailable(BOOL &rIsAvailable, EDT_CLIP_TYPE &eType);
STATUSCODE POU_GetNetCnt(const MW_ID &rPouId, WORD &wCnt);
STATUSCODE POU_IsValidNet(const MW_ID &rPouId, WORD wNetIdx, BOOL &bValid);
STATUSCODE POU_GetLastNet(const MW_ID &rPouId, WORD &rNetIdx);
STATUSCODE POU_GetNetTitle(const MW_ID &rPouId, WORD wNetIdx, CString &rTitle);
STATUSCODE POU_SetNetTitle(const MW_ID &rPouId, WORD wNetIdx, const CString &rTitle);
STATUSCODE POU_GetNetComment(const MW_ID &rPouId, WORD wNetIdx, CString &rComment);
STATUSCODE POU_SetNetComment(const MW_ID &rPouId, WORD wNetIdx, const CString &rComment);
STATUSCODE POU_InsNet(const MW_ID &rPouId, WORD wNetIdx, WORD wCnt);
STATUSCODE POU_DelNet(const MW_ID &rPouId, WORD wNetIdx, WORD wCnt);
STATUSCODE POU_CutNet(const MW_ID &rPouId, WORD wNetIdx, WORD wCnt);
STATUSCODE POU_CopyNet(const MW_ID &rPouId, WORD wNetIdx, WORD wCnt);
STATUSCODE POU_PasteNet(const MW_ID &rPouId, WORD wNetIdx, WORD wCnt);
STATUSCODE POU_CreateChart(const MW_ID &rPouId, WORD wStartNet, WORD wEndNet, MW_ID &rChtId);
STATUSCODE POU_GetSITRowCnt(const MW_ID &rPouId, WORD wNetIdx, WORD &rCnt);
STATUSCODE POU_GetSITRow(const MW_ID &rPouId, WORD wNetIdx, WORD wRow, SYM_ELEMENT &rElement);
STATUSCODE POU_GetSITRowDataTypeMask(const MW_ID &rPouId, WORD wNetIdx, WORD wRow, DATA_TYPE_MASK &rMask);
STATUSCODE POU_GetVarTblHeight(const MW_ID &rPouId, int &rHeight);
STATUSCODE POU_SetVarTblHeight(const MW_ID &rPouId, int nHeight);
STATUSCODE POU_IsStatusOn(BOOL &bStatusOn);
STATUSCODE POU_ColorStatus(void);
STATUSCODE POU_SetStatusRegion(HANDLE wndHandle, const MW_ID &pouId, STAT_RECTANGLE &rRect);
STATUSCODE POU_StatusOn(HANDLE wndHandle, const MW_ID &pouId, STAT_RECTANGLE &rRect, SYSTEMTIME &rSysProject, SYSTEMTIME &rSysPLC, BOOL bIgnoreModeSwitch = FALSE, BOOL bOverride = FALSE);
STATUSCODE POU_StatusOff(void);
STATUSCODE POU_SetViewReady(BOOL bReady);
STATUSCODE POU_SetProgramEditing(BOOL bEditing);
STATUSCODE POU_IsProgramEditing(BOOL &bEditing);
/*End of POU Interface to the USER Layer*/

/*Data block interfaces*/
STATUSCODE DB_Compile(MW_ID sDbId, LPWORD pBlockSize, LPWORD pErrorCount); 
STATUSCODE DB_IsPasteAvailable(BOOL &rIsAvailable, EDT_CLIP_TYPE &eType);
/*End of Data block interfaces*/

/* FBD Specific */
STATUSCODE FBD_GetClosestInstTick(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION curCell, GRID_CELL_LOCATION *pNextTickLoc, GRID_ALIGN *pNextTickAlign);
STATUSCODE FBD_GetNextInstTick(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION tickCell, GRID_ALIGN tickAlign, GRID_CELL_LOCATION *pNextTickCell, GRID_ALIGN *pNextTickAlign);
STATUSCODE FBD_IsModifiableTick(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION spineCell, GRID_ALIGN eTickAlign, LPBOOL pIsModifiableTick);
STATUSCODE FBD_ToggleTick(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cellLoc, GRID_TICK_TYPE eTickType, GRID_ALIGN tickAlign);
STATUSCODE FBD_AddInputParameter(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cellLoc, GRID_CELL_LOCATION *pCursorLoc, GRID_RECTANGLE *pVisibleRect);
STATUSCODE FBD_RemoveInputParameter(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cellLoc, GRID_CELL_LOCATION *pCursorLoc, GRID_RECTANGLE *pVisibleRect);
STATUSCODE FBD_CanAddRemoveInputParameter(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cellLoc, BOOL& bCanAdd, BOOL& bCanRemove);
STATUSCODE FBD_CanToggleTick(MW_ID pouId, WORD netNumber, GRID_CELL_LOCATION cellLoc, GRID_ALIGN eTickAlign, LPBOOL pCanNegate, LPBOOL pCanImmediate);
/*End of FBD Specific */

/* Project Operations */
STATUSCODE PRJ_StampCompile(eBLOCKCOMPASS_BLOCKTYPES eBlockType, int nBlockNumber);
STATUSCODE PRJ_NeedsCompile(eBLOCKCOMPASS_BLOCKTYPES eBlockType, int nBlockNumber, BOOL &bNeedsCompile);
STATUSCODE PRJ_SetAccessPoint(const CString &strAccess);
STATUSCODE PRJ_GetAccessPoint(CString &strAccess);
STATUSCODE PRJ_GetCommCompassHostGUID(GUID &rgCommCompassHost);
STATUSCODE PRJ_InitNewMwProject();
STATUSCODE PRJ_New(LPCTSTR pProjectPath, LPCTSTR pEntryPoint, HMWPROJ *hMWinProject, const CString &rstrType, const CString &rstrVersion);
STATUSCODE PRJ_Close(HMWPROJ hMWinProject);
STATUSCODE PRJ_ValidateProjectFile(const CString &strFileName, const CString &strPassword);
STATUSCODE PRJ_Open(const CString &strFileName, const CString &strPassword, const CString &strEntryPoint, HMWPROJ *hMWinProject);
STATUSCODE PRJ_Save(void);
STATUSCODE PRJ_SaveAs(LPCTSTR pProjectPath);
STATUSCODE PRJ_GetCurrentProject(HMWPROJ *hMWinProject);
STATUSCODE PRJ_SetCurrentProject(HMWPROJ hMWinProject);
STATUSCODE PRJ_IsPLCPasswordProtected(BOOL &rUploadRestricted);
STATUSCODE PRJ_IsPLCUploadRestricted(BOOL &rUploadRestricted);
STATUSCODE PRJ_GetName(CString &strPrjName);
STATUSCODE PRJ_SetName(const CString &strPrjName);
STATUSCODE PRJ_SetPassword(const CString &strPassword, BOOL bIsSha512);
STATUSCODE PRJ_ConvertPassword(const CString &strPassword, BOOL bIsSha512);
STATUSCODE PRJ_IsProtected(BOOL &rProtected);
STATUSCODE PRJ_IsOpen(LPBOOL pOpen);
STATUSCODE PRJ_GetProgrammingMode(PROGRAMMING_MODE *pMode);
STATUSCODE PRJ_GetLanguage(LANGUAGE &rLang);
STATUSCODE PRJ_SetLanguage(LANGUAGE eLang);
STATUSCODE PRJ_GetEditor(PROGRAMMING_EDITOR *pEditorType);
STATUSCODE PRJ_SetEditor(PROGRAMMING_EDITOR EditorType);
STATUSCODE PRJ_GetAddressMode(OPRND_ADDRESS_MODE *eAddressMode);
STATUSCODE PRJ_SetAddressMode(OPRND_ADDRESS_MODE eAddressMode);
STATUSCODE PRJ_UnforceAll();
STATUSCODE PRJ_GetPrintProperties(PRINT_PROPERTIES *pPrintProperties);
STATUSCODE PRJ_SetPrintProperties(PRINT_PROPERTIES printProperties);
STATUSCODE PRJ_GetLadPrintOptions(EDITOR_PRINT_PROPERTIES *pOptions);
STATUSCODE PRJ_SetLadPrintOptions(EDITOR_PRINT_PROPERTIES Options);
STATUSCODE PRJ_GetFBDPrintOptions(EDITOR_PRINT_PROPERTIES *pOptions);
STATUSCODE PRJ_SetFBDPrintOptions(EDITOR_PRINT_PROPERTIES Options);
STATUSCODE PRJ_GetSTLPrintOptions(EDITOR_PRINT_PROPERTIES *pOptions);
STATUSCODE PRJ_SetSTLPrintOptions(EDITOR_PRINT_PROPERTIES Options);
STATUSCODE PRJ_GetSymPrintOptions(EDITOR_PRINT_PROPERTIES *pOptions);
STATUSCODE PRJ_SetSymPrintOptions(EDITOR_PRINT_PROPERTIES Options);
STATUSCODE PRJ_GetChtPrintOptions(EDITOR_PRINT_PROPERTIES *pOptions);
STATUSCODE PRJ_SetChtPrintOptions(EDITOR_PRINT_PROPERTIES Options);
STATUSCODE PRJ_GetDBPrintOptions(EDITOR_PRINT_PROPERTIES *pOptions);
STATUSCODE PRJ_SetDBPrintOptions(EDITOR_PRINT_PROPERTIES Options);
STATUSCODE PRJ_GetRemoteAddress(MWNetworkInfo &rcInfo);
STATUSCODE PRJ_SetRemoteAddress(const MWNetworkInfo &rcInfo, BOOL bValidAddress = TRUE, BOOL bSetSystemBlock = TRUE);
STATUSCODE PRJ_GetBaudRate(BAUD_RATE *pBaudRate);
STATUSCODE PRJ_SetBaudRate(BAUD_RATE rate);
STATUSCODE PRJ_GetSystemBlockData(SDBData &rData);
STATUSCODE PRJ_SetSystemBlockData(SDBData &rData);
STATUSCODE PRJ_GetPNBlockData(PNBlockData &rData);
STATUSCODE PRJ_SetPNBlockData(PNBlockData &rData);
STATUSCODE PRJ_IsCompactCPU(BOOL &rSupported);
STATUSCODE PRJ_GetCommEntryPoint(LPTSTR pEntryPoint, int pEntryLen);
STATUSCODE PRJ_SetCommEntryPoint(LPCTSTR pEntryPoint);
STATUSCODE PRJ_IsDefaultName(LPBOOL pIsDefault);
STATUSCODE PRJ_SetDefaultName(BOOL bDefault);
STATUSCODE PRJ_IsDirty(LPBOOL pIsDirty);
STATUSCODE PRJ_SetDirty(BOOL isDirty);
STATUSCODE PRJ_SetTimeStampLock(BOOL bLocked);
STATUSCODE PRJ_DrawPanel(int nID, CDC* pDC);
STATUSCODE PRJ_Import(LPCTSTR pImportFilePath, LPWORD pwErrorCount);
STATUSCODE PRJ_Export(MW_ID sPouId, LPCTSTR pExportFilePath);
STATUSCODE PRJ_SwitchToSymbols(void);
STATUSCODE PRJ_SwitchToValues(void);
STATUSCODE PRJ_GetStatusOperandMode(STATUS_OPERAND_MODE *pStatusMode);
STATUSCODE PRJ_SetStatusOperandMode(STATUS_OPERAND_MODE statusMode);
STATUSCODE PRJ_ValidateSystemBlock(LPWORD pErrorCount, LPWORD pWarningCount);
STATUSCODE PRJ_IsAuthorized(LPBOOL pAuthorized);
STATUSCODE PRJ_InRunModeEdit(LPBOOL pRME);
STATUSCODE PRJ_HasPLCModeChanged(LPBOOL pChanged);
STATUSCODE PRJ_SetRunModeEdit(BOOL bRME);
STATUSCODE PRJ_IsRunModeEditSupported(LPBOOL pRME);
STATUSCODE PRJ_ComparePrjToPlcTimeStamps(LPBOOL pMatch);
STATUSCODE PRJ_CompareDBPrjToPlcTimeStamps(LPBOOL pMatch);
STATUSCODE PRJ_GetPrjTimeStamps(SYSTEMTIME *pCreateTime, SYSTEMTIME *pModTime);
STATUSCODE PRJ_GetPrjComparedTimeStamps(SYSTEMTIME *pCreateTime, SYSTEMTIME *pModTime);
STATUSCODE PRJ_ExecuteCompare(const COMPARE_DLG_OPTIONS &rOptions, COMPARE_RESULTS *pResults, BOOL bCheckPouOrder, BOOL bIgnoreTimestamps);
STATUSCODE PRJ_GetCPUOnlyDeviceIDs(CString &rstrType, CString &rstrVer);
STATUSCODE PRJ_GetDeviceIDs(CString &rstrType, CString &rstrVer);
STATUSCODE PRJ_SetDeviceIDs(const CString &rstrType, const CString &rstrVer);
STATUSCODE PRJ_Download(BLOCK_TYPES eBlockType, HWND hMainWnd = NULL);
STATUSCODE PRJ_Upload(BLOCK_TYPES eBlockType);
STATUSCODE PRJ_UploadPNSDB(PNBlockData& nPNsdbData);
STATUSCODE PRJ_ClearPLC(BLOCK_TYPES eBlockType);
STATUSCODE PRJ_PreCheckDownload(BOOL bSkipCPUType = FALSE);
STATUSCODE PRJ_StartStatusBar();
STATUSCODE PRJ_StopStatusBar();
STATUSCODE PRJ_StartNICDiscovery();
STATUSCODE PRJ_IsMemoryCardSupported(BOOL &rIsSupported);
STATUSCODE PRJ_IsProfinetSupported(BOOL &rIsSupported);
STATUSCODE PRJ_IsProfinetIDeviceSupported(BOOL &rIsSupported);
STATUSCODE PRJ_IsProfinetControllerSupported(BOOL &rIsSupported);
STATUSCODE PRJ_IsMotionABSSupported(BOOL &rIsSupported);
STATUSCODE PRJ_IsPTOPWMSupported(BOOL &rIsSupported);
STATUSCODE PRJ_IsNetworkSupported(BOOL &rIsSupported);
STATUSCODE PRJ_IsDataLogSupported(BOOL &rIsSupported);
STATUSCODE PRJ_IsDataLogConfigured(BOOL &rIsConfigured);
STATUSCODE PRJ_SaveBlocksToDisk(BLOCK_TYPES eBlockTypes, CString &strPath);
STATUSCODE PRJ_CreateValidationFile(BLOCK_TYPES eBlock, CString &strPath, unsigned char* hashKey);
STATUSCODE  PRJ_CreateUserLibrary();
STATUSCODE  PRJ_ReloadInstructionLibs();
STATUSCODE  PRJ_LoadInstructionLibs();
STATUSCODE  PRJ_ValidateUserLibrary(CString &strPath, GUID &rLibGuid, BOOL bOpenProj = TRUE);
STATUSCODE  PRJ_VersionCheckLibraryUsage(const GUID &rGuid, CString &strResult, BOOL bReportAndFix);
STATUSCODE  PRJ_GetNumLibsInUse(int &rCount);
STATUSCODE  PRJ_GetLibInUseAt(const int nIdx, GUID &rGuid);
/*end of Project Operations*/

/*The part of interface are exported to support system auto test to configure PN network*/
STATUSCODE PRJ_AddPNDevice(const CString& strGSDFullPathName, const CString& nDapModuleIDstr, int dapModuleIdentNumber, int deviceNumber);
STATUSCODE PRJ_AddPNModule(int deviceNumber, int slotNum, const CString& moduleIDstr, DWORD moduleIdentNumber);
STATUSCODE PRJ_AddPNSubModule(int deviceId, int slotNum, int subslotNubmer, const CString& submoduleIDstr, DWORD submoduleIdentNumber);
STATUSCODE PRJ_AddPNTransferAreaSubModule(int deviceId, int slotNum, int subslotNubmer, const CString& submoduleIDstr, int submoduleIdentNumber, int ioType, int address, int length);
STATUSCODE PRJ_SetPLCPDEVProperties(int plcRole, bool isFixedIP, const CString& plcIP, const CString& subNetMask, int startupTime, const CString& plcName, const CString& strType, const CString& strVer, bool paraDisallowed = true);
STATUSCODE PRJ_SetPNDeviceProperties(int deviceNumber, BOOL isIPFixed, const CString& deviceIP, int deviceUpdateTime, int watchdog, const CString& deviceName, bool paraDisallowed = false);
STATUSCODE PRJ_SetPNLogicAddress(int deviceId, int slotNum, int subSlotNum, const CString& submoduleIDstr, int submoduleIdentNumber, int startIaddr, int startQaddr);
STATUSCODE PRJ_SetPortProperty(int deviceId, int slotNum, int subSlotNum, const CString& submoduleIDstr, int submoduleIdentNumber, BOOL m_bPortActive, WORD m_MAUType, BOOL m_bIsMonitored, BOOL m_bAutoNegotiated, BOOL m_bEndOfDCPEnabled, BOOL m_bEndOfPTPEnabled);
STATUSCODE PRJ_SetModuleParameter(int deviceId, int slotNum, int subSlotNum, const CString& submoduleIDstr, int submoduleIdentNumber, int parameterRecordDataItemIndex, const CString& textId, const CString& value);
STATUSCODE PRJ_AddTransferAreaToIDevice(int subslotNubmer,int ioType, int address, int length );
STATUSCODE PRJ_SetSubmoduleIMData(int deviceId, int slotNum, int subSlotNum, const CString& submoduleIDstr, int submoduleIdentNumber, CString im1RecordFunction, CString im1RecordLocation, CString im2Record, CString im3Record);


/*ICommCompass Interface to the EXECUTIVE Layer*/
STATUSCODE COM_GetAccessPointData(sCOMMCOMPASS_AP_DATA *pAPData);
STATUSCODE COM_SetAccessPoint(sCOMMCOMPASS_AP_DATA *pAPData);
STATUSCODE COM_SetAccessPointByName(LPCTSTR pAccessPointName);
STATUSCODE COM_ConnectDCP(CString &rstrAP, CString &rstrNIC, COMPASS_DCP_LIFE_LIST &rDCPItem);
STATUSCODE COM_ConnectUSB(CString &rstrAP, CString &rstrNIC, COMPASS_DCP_LIFE_LIST &rDCPItem);
STATUSCODE COM_ExecuteScans(MWNetworkInfo &rcInfo, int nCount);
STATUSCODE COM_GetDeviceInformation(EX_PLCInformationData &rcInfo);
STATUSCODE COM_GetDeviceIdentities(BOOL bAutoBaud, BOOL bNewDeviceList, sCOMMCOMPASS_DEVICE_LIFE_LIST **paData, int *pnNumberOfDevices);
STATUSCODE COM_GetActualCPUOnlyDevice(MWNetworkInfo &rcInfo, CString &rstrType, CString &rstrVersion);
STATUSCODE COM_GetAllTypesAndVersions(BOOL bCpuOnly, CArray<sDEVICECOMPASS_TYPE_AND_VERSION, sDEVICECOMPASS_TYPE_AND_VERSION&> &raTypesAndVersions, ePLC_TYPE_FILTER ePlcTypeFilter= ePLC_Filter_None);
STATUSCODE COM_CloseAllDevices(BOOL bModemOnly = FALSE);
STATUSCODE COM_Advise(long lCBHandle);
STATUSCODE COM_UnAdvise(long lUpdHandle);
STATUSCODE COM_GetAbortHandle(DWORD dwProcessID, long* plAbortHandle);
STATUSCODE COM_SendPoll(MWNetworkInfo &rcInfo);
STATUSCODE COM_SetDSTStatus(MWNetworkInfo &rcInfo, sCOMMCOMPASS_DST_STATUS* psDSTStatus);
STATUSCODE COM_GetDSTStatus(MWNetworkInfo &rcInfo, sCOMMCOMPASS_DST_STATUS* psDSTStatus);
STATUSCODE COM_GetMCSize(MWNetworkInfo &rcInfo, sCOMMCOMPASS_MC_DATA* psData);
STATUSCODE COM_GetEventLog(int nFwMajorVersion, int nFwMinorVersion, MWNetworkInfo &rcInfo, sCOMMCOMPASS_EVENT_LOG **ppEventLog, int &rnNumLogs);
STATUSCODE COM_Directory1(MWNetworkInfo &rcInfo, int &rnNumofOBs, int &rnNumofDBs, int &rnNumofSDBs);
STATUSCODE COM_Directory2(MWNetworkInfo &rcInfo, eCOMMCOMPASS_BLOCK_TYPES eBlockType, sCOMMCOMPASS_DIR2_DATA **paData, int &rnNumberOfBlocks);
STATUSCODE COM_Directory3(MWNetworkInfo &rcInfo, eCOMMCOMPASS_BLOCK_TYPES eBlockType, int nBlockNumber, eCOMMCOMPASS_BLOCK_STATUS eBlockStatus, sCOMMCOMPASS_DIR3_DATA &rsData);
STATUSCODE COM_UpdateFW(LPBYTE pBinary, int nBytes);
STATUSCODE COM_SetDefaultLocale(long lLocaleID);
STATUSCODE COM_RunPGPCInterface();
STATUSCODE COM_IsEventLogSupported(MWNetworkInfo &rcInfo, BOOL &rbIsSupported);
STATUSCODE COM_IsAutoTuneSupported(MWNetworkInfo &rcInfo, BOOL &rbIsSupported);
STATUSCODE COM_IsConnected(BOOL &rbIsConnected);
STATUSCODE COM_GetTotalMotionAxis(int &rCount);
STATUSCODE COM_CloseCurrConnection();
STATUSCODE COM_GetVMemoryLimits(int &rSize);
STATUSCODE COM_DisconnectAddress(MWNetworkInfo &rcInfo);
STATUSCODE COM_IsAutoBaudPossible(BOOL &rbIsAutoBaudPossible);
STATUSCODE COM_GetPNSupport(CString &strType, CString &strVer, BOOL & isPNContrlSupport, BOOL & isPNIDevSupport);
STATUSCODE COM_GetRemoteAddress(MWNetworkInfo &rcInfo);
STATUSCODE COM_SetRemoteAddress(const MWNetworkInfo &rcInfo);
STATUSCODE COM_CacheActualDevObj();
STATUSCODE COM_ReleaseActualDevObj();
STATUSCODE COM_PowerUpReset();
STATUSCODE COM_ProgramMC(MWNetworkInfo &rcInfo, sCOMMCOMPASS_PROGRAM_MC_DATA &rsMCData);
STATUSCODE COM_CreateDataBlockFromRAM();
STATUSCODE COM_GetNonFatalError(WORD wErrVal, WORD wOffset, LPTSTR pErrPath, BOOL bCompileError = FALSE);
STATUSCODE COM_GetModuleInformation(eCOMMCOMPASS_MODULE_TYPES eModuleType, DWORD dwStartIn, DWORD dwStartOut, LPTSTR pIn, LPTSTR pOut);
STATUSCODE COM_GetConnectedPLCPort(LPWORD pPLCPort);
STATUSCODE COM_GetStatusInfo(LPWORD pFatalError, LPWORD pNonFatalError, LPWORD pMode);
STATUSCODE COM_GetOpMode(LPWORD pMode);
STATUSCODE COM_SetOpMode(WORD Mode);
STATUSCODE COM_GetScanTimes(SCAN_TIMES_STRUCT *pScanTimes);
STATUSCODE COM_ExecuteScans(WORD numScans);
void       COM_LogDownloadCompileError(STATUSCODE &errCode);
STATUSCODE COM_DataRead(MWNetworkInfo &rcInfo, sCOMMCOMPASS_MEM_STRUCT asMemory[], int nElements);
STATUSCODE COM_Write(MWNetworkInfo &rcInfo, sCOMMCOMPASS_MEM_STRUCT asMemory[], int nElements);
STATUSCODE COM_DebugWrite(MWNetworkInfo &rcInfo, sCOMMCOMPASS_MEM_STRUCT asMemory[], int nElements);
STATUSCODE COM_Force(MWNetworkInfo &rcInfo, sCOMMCOMPASS_MEM_STRUCT asMemory[], int nElements);
STATUSCODE COM_ResetScanTimes();
STATUSCODE COM_Authorize(LPTSTR password);
STATUSCODE COM_DeAuthorize();
STATUSCODE COM_GetTimeDate(TIME_DATE_STRUCT *pTimeDate);
STATUSCODE COM_SetTimeDate(TIME_DATE_STRUCT *pTimeDate);
STATUSCODE COM_ValidPLC_InRunMode();
STATUSCODE COM_GetDownloadProgress(LPWORD pCurrent, LPWORD pComplete);
STATUSCODE COM_GetRMEInformation(MWNetworkInfo &rcInfo, sCOMMCOMPASS_RME_INFORMATION &rcRMEInfo);
STATUSCODE COM_GetPlcTimeStamps(SYSTEMTIME *pCreateTime, SYSTEMTIME *pModTime);
STATUSCODE COM_StartComData(DWORD& rdwThreadID);
STATUSCODE COM_StopComData();
STATUSCODE COM_SaveFaultInformation(CString strPath);
/*end of ICommCompass Interface to the EXECUTIVE Layer*/

/* Symbol Table Interface to the USER Layer */
STATUSCODE SYM_GetNumberRows(const MW_ID &rSymId, WORD &rNumRows);
STATUSCODE SYM_InsertRow(const MW_ID &rSymId, WORD Idx, WORD count);
STATUSCODE SYM_DeleteRow(const MW_ID &rSymId, WORD Idx, WORD count);
STATUSCODE SYM_IncrementRow(const MW_ID &rSymId, WORD Idx, WORD count);
STATUSCODE SYM_GetRow(const MW_ID &rSymId, WORD Idx, SYM_ELEMENT &rElement);
STATUSCODE SYM_SetRow(const MW_ID &rSymId, WORD Idx, const SYM_ELEMENT &rElement);
STATUSCODE SYM_ValSym(const DATA_TYPE_MASK &rType, SYM_ELEMENT &rElement);
STATUSCODE SYM_SetName(const MW_ID &rSymId, WORD Idx, const CString &rName);
STATUSCODE SYM_SetValue(const MW_ID &rSymId, WORD Idx, const CString &rValue);
STATUSCODE SYM_SetDataType(const MW_ID &rSymId, WORD Idx, const CString &rDataType);
STATUSCODE SYM_SetComment(const MW_ID &rSymId, WORD Idx, const CString &rComment);
STATUSCODE SYM_Sort(const MW_ID &rSymId, SORT_ORDER sOrder);
STATUSCODE SYM_GetTypesForRow(const MW_ID &rSymId, WORD wRow, CString &strTypes);
STATUSCODE SYM_IsPasteAvailable(LPBOOL pPasteAvailable);
STATUSCODE SYM_CutRect(const MW_ID &rSymId, SYM_RECTANGLE &rRect);
STATUSCODE SYM_DeleteRect(const MW_ID &rSymId, SYM_RECTANGLE &rRect);
STATUSCODE SYM_CopyRect(const MW_ID &rSymId, SYM_RECTANGLE &rRect);
STATUSCODE SYM_PasteRect(const MW_ID &rSymId, SYM_RECTANGLE &rRect, WORD &rNumPasted);
STATUSCODE SYM_IsDuplicate(const MW_ID &rSymId, WORD wIdx, BOOL &rName, BOOL &rAddress);
STATUSCODE SYM_GetNamesFromType(const DATA_TYPE_MASK sMask, const MEMORY_AREA_MASK memArea, EXSymbolsVector &rSymbolList);
STATUSCODE SYM_GetSymbol(const CString &rSymbolName, SYM_ELEMENT &rElement);
STATUSCODE SYM_IsUndoAvailable(const MW_ID &rSymId, BOOL &rIsAvailable);
STATUSCODE SYM_Undo(const MW_ID &rSymId, SYM_RECTANGLE &rRect, SYM_UNDO_OPTION &rUndoOption);
STATUSCODE SYM_FlushUndo(const MW_ID &rSymId);
STATUSCODE SYM_ValidAddress(const CString rAddress);
STATUSCODE SYM_InsertSymbol(const MW_ID &rSymId, const SYM_ELEMENT &rElement);
STATUSCODE SYM_FindSymbol(const CString &rName, MW_ID &rSymId, WORD &rRow);
STATUSCODE SYM_SetFindOptions(FIND_REPLACE_OPTIONS findOptions, SYM_FIND_LOCATION &rCurLoc); 
STATUSCODE SYM_Find(SYM_FIND_LOCATION &rFoundLoc);
STATUSCODE SYM_Replace(SYM_FIND_LOCATION &rFoundLoc);
STATUSCODE SYM_ReplaceAll(WORD &rItemsReplaced); 
STATUSCODE SYM_ImportBinarySymTable(const CString &rFilePath, const MW_ID &rSymId);
STATUSCODE SYM_AllocateLibraryAddresses(const GUID &rGuid, const ADDRESS_STRUCT &rAdr);
STATUSCODE SYM_EmptyLibraryAddresses(const GUID &rGuid);
STATUSCODE SYM_IsInsertAvailable(MW_IDType eType, BOOL &rInsertAvailable);
STATUSCODE SYM_SaveSymbolTable(const MW_ID &rSymId);
STATUSCODE SYM_LoadSymbolTable(const MW_ID &rSymId);
STATUSCODE SYM_LoadSystemTable(MW_ID &rSymId);
STATUSCODE SYM_CreateUndefinedSymbolTable(MW_ID &rSymId);
STATUSCODE SYM_CreateS7200SymbolTable(MW_ID &rSymId);
STATUSCODE SYM_CreateIOSymbolTable(MW_ID &rSymId);
/*End of Symbol Table Interface to the USER Layer */

/*Dialog Interface to the EXECUTIVE Layer*/
STATUSCODE DLG_GetDialogOptions(DIALOG_ID dialogId, LPWORD pBufSize, LPBYTE pOptionsBuf);
STATUSCODE DLG_SetDialogOptions(LPCTSTR pAccessPoint, DIALOG_ID dialogId, LPBYTE pOptionsBuf);
/*End of Dialog Interface to the EXECUTIVE Layer*/

/*Local Symbol Table Interface to the USER Layer*/
STATUSCODE VAR_GetNumberRows(const MW_ID &rPouId, WORD &rNumRows);
STATUSCODE VAR_GetRow(const MW_ID &rPouId, WORD wRow, VAR_ELEMENT &rElement);
STATUSCODE VAR_InsertRow(const MW_ID &rPouId, WORD wRow);
STATUSCODE VAR_InsertRowBelow(const MW_ID &rPouId, WORD wRow);
STATUSCODE VAR_DeleteRow(const MW_ID &rPouId, WORD wRow);
STATUSCODE VAR_SetName(const MW_ID &rPouId, WORD wRow, const CString &Name);
STATUSCODE VAR_SetDataType(const MW_ID &rPouId, WORD wRow, const CString &DataType);
STATUSCODE VAR_SetComment(const MW_ID &rPouId, WORD wRow, const CString &Comment);
STATUSCODE VAR_GetDataTypes(const MW_ID &rPouId, WORD wRow, CString &rDataType);
STATUSCODE VAR_CutRect(const MW_ID &rPouId, const VAR_RECTANGLE &rRect);
STATUSCODE VAR_CopyRect(const MW_ID &rPouId, const VAR_RECTANGLE &rRect);
STATUSCODE VAR_PasteRect(const MW_ID &rPouId, const VAR_RECTANGLE &rRect);
STATUSCODE VAR_DeleteRect(const MW_ID &rPouId, const VAR_RECTANGLE &rRect);
STATUSCODE VAR_IsUndoAvailable(const MW_ID &rPouId, BOOL &rIsAvailable);
STATUSCODE VAR_Undo(const MW_ID &rPouId, VAR_RECTANGLE &rRect, VAR_UNDO_OPTION &rUndoOption);
STATUSCODE VAR_FlushUndo(const MW_ID &rPouId);
STATUSCODE VAR_SetFindOptions(FIND_REPLACE_OPTIONS findOptions, VAR_FIND_LOCATION &rCurLoc); 
STATUSCODE VAR_Find(VAR_FIND_LOCATION &rCurLoc);
STATUSCODE VAR_Replace(VAR_FIND_LOCATION &rCurLoc);
STATUSCODE VAR_ReplaceAll(WORD &rItemsReplaced); 
/*End of Local Symbol Table Interface to the USER Layer*/

/* Status Chart Interface to the USER Layer*/
STATUSCODE CHT_StoreStatus();
STATUSCODE CHT_IsModified(const MW_ID &rChtId, BOOL &rDirty);
STATUSCODE CHT_GetNumberRows(const MW_ID &rChtId, WORD &rNumRows);
STATUSCODE CHT_GetRow(const MW_ID &rChtId, WORD rowIndex, CHT_ELEMENT &rElement, CHT_REFRESH_TYPE eRefreshType);
STATUSCODE CHT_SetTrendRow(const MW_ID &rChtId, WORD rowIndex, CHT_ELEMENT &rElement);
STATUSCODE CHT_SetAddress(const MW_ID &rChtId, WORD wRow, const CString &rAddress);
STATUSCODE CHT_SetFormat(const MW_ID &rChtId, WORD wRow, const CString &rFormat);
STATUSCODE CHT_SetWrite(const MW_ID &rChtId, WORD wRow, const CString &rWrite);
STATUSCODE CHT_SetTimeBase(const MW_ID &rChtId, WORD wRow, const TRD_TIMEBASE &rTbase);
STATUSCODE CHT_GetRowHeight(const MW_ID &rChtId, WORD wRow, int &rRowHeight);
STATUSCODE CHT_SetRowHeight(const MW_ID &rChtId, WORD wRow, const int &rRowHeight);
STATUSCODE CHT_SetActiveRow(const MW_ID &rChtId, WORD wRow, const BOOL &rActive);
STATUSCODE CHT_SetLockRange(const MW_ID &rChtId, WORD wRow, const BOOL &rLockRange);
STATUSCODE CHT_IncrementAddress(const MW_ID &rChtId, WORD rowIndex);
STATUSCODE CHT_IncrementFormat(const MW_ID &rChtId, WORD rowIndex);
STATUSCODE CHT_InsertRow(const MW_ID &rChtId, WORD rowIndex, WORD count);
STATUSCODE CHT_DeleteRect(const MW_ID &rChtId, const CHT_RECTANGLE &rRect);
STATUSCODE CHT_Sort(const MW_ID &rChtId, WORD sRowIndex, const WORD eRowIndex, const SORT_ORDER sOrder);
STATUSCODE CHT_CutRect(const MW_ID &rChtId, const CHT_RECTANGLE &rRect);
STATUSCODE CHT_CopyRect(const MW_ID &rChtId, const CHT_RECTANGLE &rRect);
STATUSCODE CHT_PasteRect(const MW_ID &rChtId, const CHT_RECTANGLE &rRect, WORD &rNumPasted);
STATUSCODE CHT_GetFormatTypes(const MW_ID &rChtId, WORD wRow, CString &rAdrFormats);
STATUSCODE CHT_GetDataTypeMask(const MW_ID &rChtId, WORD wRow, DATA_TYPE_MASK &rMask);
STATUSCODE CHT_IsPasteAvailable(BOOL *pPasteAvailable);
STATUSCODE CHT_PauseChart(BOOL Pause);
STATUSCODE CHT_StatusOn(HANDLE wndHandle, const MW_ID &rChtId, WORD wRow, WORD eRow);
STATUSCODE CHT_StatusOff(HANDLE wndHandle);
STATUSCODE CHT_SetStatusRectangle(HANDLE wndHandle, const MW_ID &rChtId, WORD sRowIndex, WORD eRowIndex);
STATUSCODE CHT_IsStatusOn(BOOL &rStatusOn);
STATUSCODE CHT_SetViewReady(BOOL bReady);
STATUSCODE CHT_SetTrendReady(BOOL bReady);
STATUSCODE CHT_WriteOperand(const MW_ID &rId, WORD wRow, CString strValue);
STATUSCODE CHT_ForceOperand(const MW_ID &rId, WORD wRow, CString strValue);
STATUSCODE CHT_SetViewType(const MW_ID &rChtId, BOOL bIsTrend);
STATUSCODE CHT_GetViewType(const MW_ID &rChtId, BOOL &rIsTrend);
STATUSCODE CHT_SetPauseTrend(BOOL bPause);
STATUSCODE CHT_GetPauseTrend(BOOL &rPause);
STATUSCODE CHT_SetTrendTimeBase(const MW_ID &rChtId, TRD_TIMEBASE eTimeBase);
STATUSCODE CHT_GetTrendTimeBase(const MW_ID &rChtId, TRD_TIMEBASE &rTimeBase);
STATUSCODE CHT_TrendClear(const MW_ID &rId, WORD wRow);
STATUSCODE CHT_TrendClearAll(const MW_ID &rId);
STATUSCODE CHT_GetTrendDataTypes(const MW_ID &rId, WORD wRow, const CString &rName, CStringArray &rTypes);
STATUSCODE CHT_TrendIsAddressValid(const MW_ID &rId, WORD wRow, const CString &rName, BOOL &bValid);
STATUSCODE CHT_TabChange(const MW_ID &rId);
STATUSCODE CHT_SingleRead(const MW_ID &rChtId);
STATUSCODE CHT_Write(const MW_ID &rChtId);
STATUSCODE CHT_ReadAllForced(const MW_ID &rChtId);
STATUSCODE CHT_Force(const MW_ID &rChtId, WORD rowIndex, FORCE_TYPE eForceType);
STATUSCODE CHT_Unforce(const MW_ID &rChtId, WORD rowIndex);
STATUSCODE CHT_CanForceUnforce(const MW_ID &rChtId, WORD rowIndex, BOOL &rCanForceUnforce);
STATUSCODE CHT_IsUndoAvailable(const MW_ID &rChtId, BOOL &rIsAvailable);
STATUSCODE CHT_Undo(const MW_ID &rChtId, CHT_RECTANGLE &rRect, CHT_UNDO_OPTION &rUndoOption);
STATUSCODE CHT_FlushUndo(const MW_ID &rChtId);
STATUSCODE CHT_SetFindOptions(FIND_REPLACE_OPTIONS &rFindOptions, CHT_FIND_LOCATION &rCurLoc); 
STATUSCODE CHT_Find(CHT_FIND_LOCATION &rFoundLoc);
STATUSCODE CHT_Replace(CHT_FIND_LOCATION &rFoundLoc);
STATUSCODE CHT_ReplaceAll(WORD &rItemsReplaced); 
/*End of Status Chart Interface to the USER Layer*/

/*STL Text Interface to the USER Layer*/
STATUSCODE TXT_GetLineCount(const MW_ID &rPouId, WORD wNet, int &nCnt);
STATUSCODE TXT_GetLineLength(const MW_ID &rPouId, WORD wNet, int nLine, int &nLen);
STATUSCODE TXT_DebugProperties(int nCommand, const MW_ID &rPouId, WORD wNet, int nLine, int nCol);
STATUSCODE TXT_FormatLine(const MW_ID &rPouId, WORD wNet, int nLine);
STATUSCODE TXT_GetLines(const MW_ID &rPouId, WORD wNet, int nTopLine, MWClrString &rLine); 
STATUSCODE TXT_GetLines(const MW_ID &rPouId, WORD wNet, int nTopLine, int nBotLine, MWClrStringList &rLines); 
STATUSCODE TXT_GetBlock(const MW_ID &rPouId, WORD wNet, int nTopLine, int nTopCol, int nBotLine, int nBotCol, MWClrString &rBlock);
STATUSCODE TXT_InsBlock(const MW_ID &rPouId, WORD wNet, int nTopLine, int nTopCol, int &rBotLine, int &rBotCol, const CString &rBlock);
STATUSCODE TXT_RepBlock(const MW_ID &rPouId, WORD wNet, int nTopLine, int nTopCol, int &rBotLine, int &rBotCol, const CString &rBlock);
STATUSCODE TXT_DelBlock(const MW_ID &rPouId, WORD wNet, int nTopLine, int nTopCol, int nBotLine, int nBotCol);
STATUSCODE TXT_GetHelpId(const MW_ID &rPouId, WORD wNetwork, int nLine, int nCol, DWORD &rHelpId);
STATUSCODE TXT_GetOperandDataType(const MW_ID &rPouId, WORD wNet, int nLine, int nCol, DATA_TYPE_MASK &rFilterMask);
STATUSCODE TXT_IsOperand(const MW_ID &rPouId, WORD wNet, int nLine, int nCol, BOOL &rIsParam);
STATUSCODE TXT_TxtGetInstID(const MW_ID &rPouId, WORD wNet, int nLine, int nCol, int &rInstID);
STATUSCODE TXT_GetOperandFlags(const MW_ID &rPouId, WORD wNet, int nLine, int nCol, OPERAND_FLAGS &rOpFlags);
STATUSCODE TXT_GetOperand(const MW_ID &rPouId, WORD wNet, int nLine, int nCol, OPERAND_ELEMENT &rElem);
STATUSCODE TXT_WriteOperand(const MW_ID &rPouId, WORD wNet, int nLine, int nCol, CString strValue);
STATUSCODE TXT_ForceOperand(const MW_ID &rPouId, WORD wNet, int nLine, int nCol, CString strValue);
STATUSCODE TXT_UnforceOperand(const MW_ID &rPouId, WORD wNet, int nLine, int nCol);
STATUSCODE TXT_IsOperandForced(const MW_ID &rPouId, WORD wNet, int nLine, int nCol, BOOL &rForced, BOOL &rCanBeForced);
STATUSCODE TXT_IsWriteValid(const MW_ID &rPouId, WORD wNet, int nLine, int nCol, BOOL &rIsWriteValid);
STATUSCODE TXT_IncrementAddress(const MW_ID &rPouId, WORD wNet, int nLine, int nCol, BOOL &rSuccess, int &rLine, int &rCol, CString& strIncAddr);
/*End of STL Text Interface to the USER Layer*/

/*Cross Reference Interface*/
STATUSCODE XREF_IsXrefCurrent(BOOL &rCurrent);
STATUSCODE XREF_OffsetsAreCurrent(BOOL &rCurrent);
STATUSCODE XREF_GetNumberReferences(WORD &rNumRefs);
STATUSCODE XREF_GetReference(WORD refNum, VIEW_XR_REFERENCE &rRef);
STATUSCODE XREF_GetJumpPathForReference(WORD refNum, XR_PATH_UNION &rPath);
STATUSCODE XREF_Clear();
STATUSCODE XREF_SetTimeStamp();
STATUSCODE XREF_GetTimeStamp(SYSTEMTIME &rTime);
STATUSCODE XREF_VarifyLibMemoryOverLop(WORD &totalErrors);
/*End of Cross Reference Interface*/

/*Usage Table Interface*/
STATUSCODE XREF_GetNumberByteUsageRows(WORD &rNumRows, WORD rowSize);
STATUSCODE XREF_GetByteUsageRow(WORD rowNum, CString &rElement, CString &rFlags, WORD rowSize);
STATUSCODE XREF_GetNumberBitUsageRows(WORD &rNumRows, WORD rowSize);
STATUSCODE XREF_GetBitUsageRow(WORD rowNum, CString &rElement, CString &rFlags, WORD rowSize);
STATUSCODE XREF_GetNumberEdgeRows(WORD &rNumRows, WORD rowSize);
STATUSCODE XREF_GetEdgeUsageRow(WORD rowNum, CString &rElement, CString &rFlags, WORD rowSize);
STATUSCODE XREF_SetFindOptions(FIND_REPLACE_OPTIONS &rFindOptions, XREF_FIND_LOCATION &rCurLoc);
STATUSCODE XREF_XREF_Find(XREF_FIND_LOCATION &rCurLoc);
STATUSCODE XREF_BYTE_Find(XREF_FIND_LOCATION &rCurLoc);
STATUSCODE XREF_BIT_Find(XREF_FIND_LOCATION &rCurLoc);
STATUSCODE XREF_Edge_Find(XREF_FIND_LOCATION &rCurLoc);
/*End of Usage Table Interface*/

/*Some more system level interfaces*/
STATUSCODE SYS_GetSigProfilePath(BYTE *ppszPathName, int nMaxSize); 
STATUSCODE SYS_GetDevProfilePath(BYTE *ppszPathName, int nMaxSize); 
STATUSCODE SYS_SetMnemonic(MNEMONIC_SET eNewMnemonic); 
STATUSCODE SYS_CreateCOMServers(CString &rstrAccessPoint);
void  SYS_ReleaseCOMServers(void);
STATUSCODE SYS_GetDataTypes(const DATA_TYPE_MASK sDataTypeMask, CStringArray &rDataTypeArray, CUIntArray &rMask);
STATUSCODE SYS_GetNumFormatTypes(LPWORD pNumFormats);
STATUSCODE SYS_GetFormatType(WORD wIdx, LPTSTR pFormatType, WORD wLen);
STATUSCODE SYS_GetPlcCommData(PLC_COMM_DATA *pCommData);
STATUSCODE SYS_IsOperandValidRange(const COperand &sOperand);
STATUSCODE SYS_SetMainWindowHandle(HANDLE wndHandle);
STATUSCODE SYS_CtrlF11DebugEvent();
/*End of some more system level interfaces*/

/* Wizard Validation and Code Generation Interface*/
STATUSCODE WIZ_GetNumWizardConfigsOfType(const WIZARD_CONFIG_TYPE eType, int &rCount);
STATUSCODE WIZ_GenerateUniquePOUName(CString &strName);
STATUSCODE WIZ_GenerateUniqueSymbolicName(CString &strName);
STATUSCODE WIZ_IsValidOperand(CString &strOp, WORD instId, BYTE opNumber, OPERAND_TYPE *pType);
STATUSCODE WIZ_GetAddressDetailsFromOpString(const CString &strOperand, MEMORY_AREA_MASK &rMemArea, OPERAND_SIZE &rOpSize, int &rnOffset);
STATUSCODE WIZ_GetOpStringFromAddressDetails(const MEMORY_AREA_MASK memArea, const OPERAND_SIZE opSize, const int nOffset, CString &strOperand);
STATUSCODE WIZ_GetWizardContainer(MWObject *&pWizList);
STATUSCODE WIZ_ValidateAndConvertSymbol(CString &strName);
STATUSCODE WIZ_ValidateAndConvertSymbol(CString &strName, const CString strTableToIgnore);
STATUSCODE WIZ_ValidateStringAsLiteral(const DATA_TYPE eTargetType, CString &strOp, LITERAL_STRUCT &rsLit, BOOL &rbIsIllegal);
STATUSCODE WIZ_ValidateStringAsDataType(const CString &strOp, DATA_TYPE &reDataType);
STATUSCODE WIZ_BuildLiteralString(const LITERAL_STRUCT &sLit, CString &rstrOp);
STATUSCODE WIZ_BuildDataTypeString(const DATA_TYPE eType, CString &rstrOp);
STATUSCODE WIZ_MotionGetConfiguration(EX_MotionWizardData &rData);
STATUSCODE WIZ_MotionSetConfiguration(EX_MotionWizardData &rData);
STATUSCODE WIZ_MotionComplete(BOOL bSilentMode);
STATUSCODE WIZ_MotionRemoveExistingMotionConfiguration(EX_MotionWizardData &rData);
STATUSCODE WIZ_PNGetConfiguration(EX_PNWizardData &rData);
STATUSCODE WIZ_PNSetConfiguration(EX_PNWizardData &rData);
STATUSCODE WIZ_PNConfigurationComplete();
STATUSCODE WIZ_PNConfigurationValidation(EX_PNWizardData &rData, CString& targetErrorObject);
STATUSCODE WIZ_PNConfigurationValidationAutoTest(CString& targetErrorObject);
STATUSCODE WIZ_PNConfigurationClear();
STATUSCODE WIZ_PIDGetConfiguration(EX_PIDWizardData &rData);
STATUSCODE WIZ_PIDSetConfiguration(EX_PIDWizardData &rData);
STATUSCODE WIZ_PIDComplete();
STATUSCODE WIZ_HSCGetConfiguration(EX_HSCWizardData &rData);
STATUSCODE WIZ_HSCSetConfiguration(EX_HSCWizardData &rData);
STATUSCODE WIZ_HSCComplete();
STATUSCODE WIZ_PWMGetConfiguration(EX_PWMWizardData &rData);
STATUSCODE WIZ_PWMSetConfiguration(EX_PWMWizardData &rData);
STATUSCODE WIZ_PWMComplete();
STATUSCODE WIZ_NetworkGetConfiguration(EX_NetworkWizardData &rData);
STATUSCODE WIZ_NetworkSetConfiguration(EX_NetworkWizardData &rData);
STATUSCODE WIZ_NetworkComplete();
STATUSCODE WIZ_HMIGetConfiguration(EX_HMIWizardData &rData);
STATUSCODE WIZ_HMISetConfiguration(EX_HMIWizardData &rData);
STATUSCODE WIZ_HMIComplete();
STATUSCODE WIZ_DataLogGetConfiguration(EX_DataLogWizardData &rData);
STATUSCODE WIZ_DataLogSetConfiguration(EX_DataLogWizardData &rData);
STATUSCODE WIZ_DataLogComplete();
STATUSCODE WIZ_DataLogUpload(DATALOG_UPLOAD_OPTIONS &rOptions, CString strFolder);
STATUSCODE WIZ_DataLogGetUploadOptions(DATALOG_UPLOAD_OPTIONS &rOptions);
STATUSCODE WIZ_IsVMemoryUseWithinDeviceLimit(int startingOffset, int size, BOOL &isWithinLimit);
STATUSCODE WIZ_FindNextUnusedMemoryRegion(const MEMORY_AREA_MASK memArea, const OPERAND_SIZE opSize, const int nSize, const int nBeginSearchAt, int &rnStartOffest);
/*End of Wizard Validation and Code Generation Interface*/

/* Device Feature Interface Limits Methods */
STATUSCODE DEV_GetLadMemWords(int &rnSize);
STATUSCODE DEV_GetNumPorts(int &rnPorts);
STATUSCODE DEV_GetNumHSCs(int &rnHSCs);
STATUSCODE DEV_GetNumHSCModes(int nHSCNumber, int &rnHSCMode);
STATUSCODE DEV_IsHSCSupported(const int nHSCNum, BOOL &rbIsSupported);
STATUSCODE DEV_IsHSCModeSupported(const int nHSCNum, const int nMode, BOOL &rbIsSupported);
STATUSCODE DEV_GetTotalPIDs(int &rnSize);
STATUSCODE DEV_GetVMemBytes(int &rnSize);
STATUSCODE DEV_GetQMemBytes(int &rnSize);
STATUSCODE DEV_GetIMemBytes(int &rnSize);
STATUSCODE DEV_GetAIMemBytes(int &rnSize);
STATUSCODE DEV_GetAQMemBytes(int &rnSize);
STATUSCODE DEV_GetNumDataLogsAndMaxRecordSize(int &rnCount, int &rnSize);
STATUSCODE DEV_GetNumRecipes(int &rnSize);
STATUSCODE DEV_GetLinearPTOClockSpeed(int &rnSpeed);
STATUSCODE DEV_GetOnBoardAIMemBytes(int &rnSize);
STATUSCODE DEV_GetOnBoardAQMemBytes(int &rnSize);
STATUSCODE DEV_GetNumRetentiveMemBytes(int &rnSize);
STATUSCODE DEV_GetMaxSubroutines(int &rnSize);
STATUSCODE DEV_GetMaxInterruptRoutines(int &rnSize);
STATUSCODE DEV_IsAutoTuneSupported(BOOL &rbIsAutoTune);
STATUSCODE DEV_IsExecutionStatusSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsSTLStatusSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsResetScanSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsWriteAnyModeSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsForceSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsMultipleScanSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsPowerupResetSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsReadTODSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsWriteTODSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsReadVarSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsWriteVarSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsWriteMCSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsStartSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsStopSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsUploadSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsDownloadSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsDataBlockSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsLinearPTOSupported(BOOL &rbIsSupported);
STATUSCODE DEV_IsDSTSupported(BOOL &rbIsSupported);
/*End of Device Feature Interface Limits Methods */

/* Tab common methods */
STATUSCODE TAB_Insert(const MW_IDType &rType, MW_ID &rId);
STATUSCODE TAB_Delete(const MW_ID &rId);
STATUSCODE TAB_Move(const MW_ID &rOld, const MW_ID &rNew);
STATUSCODE TAB_CheckForChanges(const MW_ID &rId, BOOL &rChanges);
STATUSCODE TAB_GetCount(const MW_IDType &rType, WORD &rNumber);
STATUSCODE TAB_GetOffset(const MW_ID &rId, WORD &rOffset, MW_IDType eType);
STATUSCODE TAB_GetId(const MW_IDType &rType, WORD wIdx, MW_ID &rId);
STATUSCODE TAB_GetName(const MW_ID &rId, CString &rName);
STATUSCODE TAB_SetName(const MW_ID &rId, const CString &rName);
STATUSCODE TAB_IsNameUnique(const MW_IDType &rType, CString &rName);
STATUSCODE TAB_SetVisible(const MW_ID &rPouId, const BOOL bVisible);
STATUSCODE TAB_CanInsert(MW_IDType eType, BOOL &rInsert);
STATUSCODE TAB_CanDelete(const MW_ID &rId, BOOL &rDelete);
STATUSCODE TAB_CanCut(const MW_ID &rId, BOOL &rCut);
STATUSCODE TAB_CanCopy(const MW_ID &rId, BOOL &rCopy);
STATUSCODE TAB_CanRename(const MW_ID &rId, BOOL &rRename);
STATUSCODE TAB_CanExport(const MW_ID &rId, BOOL &rExport);
STATUSCODE TAB_CanShowProperties(const MW_ID &rId, BOOL &rProperties);
STATUSCODE TAB_Cut(const MW_ID &rId);
STATUSCODE TAB_Copy(const MW_ID &rId);
STATUSCODE TAB_Paste(MW_ID &rId);
STATUSCODE TAB_Undo(EDT_PATH &rPath, EDT_UNDO_EVENT &eEvent);
STATUSCODE TAB_IsPasteAvailable(const MW_IDType &rType, BOOL &rAvailable);
STATUSCODE TAB_IsUndoAvailable(const MW_ID &rId, BOOL &rAvailable);
STATUSCODE TAB_GetPasteType(MW_IDType &rType);
STATUSCODE TAB_SetFindOptions(const MW_IDType &rType, FIND_REPLACE_OPTIONS sFindOptions, EDT_PATH curLoc); 
STATUSCODE TAB_Find(const MW_IDType &rType, EDT_PATH &rFoundLoc);
STATUSCODE TAB_Replace(const MW_IDType &rType, EDT_PATH &rFoundLoc);
STATUSCODE TAB_ReplaceAll(const MW_IDType &rType, WORD &rItemsReplaced); 
STATUSCODE TAB_GetDisplayProtection(const MW_ID &rPouId, DISPLAY_STYLE &rStyle);
STATUSCODE test_GetDisplayProtection(const MW_ID &rId, int &rStyle);
STATUSCODE TAB_SetDisplayProtection(const MW_ID &rPouId, const CString &rPassword, const DISPLAY_STYLE &rStyle);
STATUSCODE TAB_AuthorizePassword(const MW_ID &rPouId, const CString &rPassword, const BOOL bPermanent, BOOL bIsSha512);
STATUSCODE TAB_ConvertPassword(const MW_ID &rPouId, const CString &rPassword, BOOL bIsSha512);
STATUSCODE TAB_DeauthorizePassword(const MW_ID &rPouId);
STATUSCODE TAB_GetProtectionInfo(const MW_ID &rPouId, CString &rInfo);
STATUSCODE TAB_GetProtectionCategory(const MW_ID &rPouId, MW_PROTECTION &rStyle);
STATUSCODE TAB_GetProperties(const MW_ID &rPouId, OBJECT_PROPERTIES &rOBJProps);
STATUSCODE TAB_SetProperties(const MW_ID &rPouId, OBJECT_PROPERTIES &rOBJProps);
STATUSCODE TAB_SetBookmark(const MW_ID &rPouId, const WORD &rNetNumber, const WORD &rLine, const BOOL &rState);
STATUSCODE TAB_GetBookmark(const MW_ID &rPouId, const WORD &rNetNumber, const WORD &rLine, BOOL &rState);
STATUSCODE TAB_FindNextBookmark(MW_ID &rPouId, WORD &rNetNumber, WORD &rLine, BOOL &rFound);
STATUSCODE TAB_FindPrevBookmark(MW_ID &rPouId, WORD &rNetNumber, WORD &rLine, BOOL &rFound);
STATUSCODE TAB_DeleteAllBookmarks(const MW_ID &rPouId);
/*End of Tab common methods */

/*Project Tree methods*/
STATUSCODE TREE_GetCnt(DWORD dwHandle, int &nCnt);
STATUSCODE TREE_GetAt(DWORD dwHandle, int nIdx, DWORD &dwLeaf);
STATUSCODE TREE_GetRoot(DWORD &dwHandle);
STATUSCODE TREE_GetInstRoot(DWORD &dwHandle);
STATUSCODE TREE_GetProjRoot(DWORD &dwHandle);
STATUSCODE TREE_GetHandle(MW_ID sID, DWORD &rHandle);
STATUSCODE TREE_GetName(DWORD dwHandle, CString &strName, BOOL bShort = TRUE);
STATUSCODE TREE_GetToolTip(DWORD dwHandle, CString &strTitle, CString &strDescription);
STATUSCODE TREE_GetType(DWORD dwHandle, MWNodeType &eType);
STATUSCODE TREE_GetGUID(DWORD dwHandle, GUID &sGUID);
STATUSCODE TREE_GetID(DWORD dwHandle, MW_ID &rId);
STATUSCODE TREE_GetHelpId(DWORD dwHandle, DWORD &rId);
STATUSCODE TREE_GetInstructionTooltip(WORD wInstId, WORD wSubId, CString &strTitle, CString &strDescription);
STATUSCODE TREE_CanAddFav(DWORD dwHandle, BOOL &bCan);
STATUSCODE TREE_AddFav(DWORD dwHandle);
STATUSCODE TREE_DelFav(DWORD dwHandle);
/*End of Project Tree methods*/
