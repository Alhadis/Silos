%module DVC
%include "carrays.i"
%include "cpointer.i"
%{
#define SWIG_FILE_WITH_INIT
#include "DVCCameraPy.h"
%}

%pointer_class(int, intp);
%pointer_class(double, doublep);
%array_class(int, intArray);
%array_class(double, doubleArray);

// extern struct CameraListStruct; NO

typedef struct {
	unsigned long	theGUID ;
	unsigned long	model ;
	unsigned long	boardId ;
	char	szDeviceName[MAX_PATH] ; // Need unique name/identifier
} CameraListStruct, *CameraListStructP;

typedef struct {
	unsigned long	          nCameras ;
	CameraListStruct  theCameras[64] ;
} CameraListArrayStruct, *CameraListArrayStructP ;

typedef struct
{
    long    left;
    long    top;
    long    right;
    long    bottom;
} RECT;

typedef struct 
{
	double dFrameTime ;
	double dExposeTime ;
	double dTransferTime ;
	unsigned long ulFrameCount ; 
	unsigned long ulStreamCount ; 
	int nBinning ;
	int nGain ;
	int nOffset ;
	RECT camRect ;
	int nFilterPos ;
	int nIntensifierGain ;
	int nIntensifierMode ;
	int nIntensifierDuration ;
	int hBin ;
	int vBin ;
	unsigned long ulExposeCount ;
	unsigned long ulTriggerCount ;
	unsigned long ulRingBuffer ;
	unsigned long ulBufferReadCount ;
	unsigned long ulBufferWriteCount ;
	double dExposeTimeStamp ;
	double dTriggerTimeStamp ;
	int _nPad[2];
} ImageMetaData, *ImageMetaDataP ;

/* Buffer structure for returning image data */
typedef struct _dvcBufStruct_ {
	int 			nBuffers ;
	int 			nXOffset, nYOffset ;
	int 			nWidth, nHeight ;
	unsigned short** pBuffers ;
	unsigned char* pBufferStatus ;
	ImageMetaDataP 	pMeta ;
	int				_nAllocatedWidth, _nAllocatedHeight;
} dvcBufStruct, *dvcBufStructP ;

extern void* dvcOpenCamera(unsigned long id);
extern int		dvcCloseCamera(void* hDevice);
extern int		dvcAutoDetectComPort(int bOnOff);
extern int		dvcGetHandleIndex(void* hDevice, int *index);
extern int		dvcGetListOfCameras(CameraListArrayStruct* pCameras);
extern int		dvcGetNBits(void* hDevice) ;
extern int		dvcHasIntensifier( void* hDevice );
extern int		dvcHasFilterWheel( void* hDevice );
extern int		dvcGetCameraType( void* hDevice ) ;
extern int		dvcGetCameraName( void* hDevice, char *szName, int len ) ;
extern int		dvcGetCameraSerialNumber( void* hDevice, int *pSN ) ;
// Depends on the interface and supporting hardware's device driver
extern int		dvcGetDriverVersion( void* hDevice ) ;
// returns the firmware version of the camera
extern int		dvcGetFirmwareVersion( void* hDevice ) ;
// Returns the API version id as 
// (major >> 16) & 0xff
// (minor >> 8 ) & 0xff  
// (build ) & 0xff
extern int		dvcGetAPIVersion() ;
// fills dateStr with the date and time of the build
// returns the number of characters in the string
// dateStr can be NULL to check for the size of the array needed.
extern int		dvcGetAPIDate( char *dateStr, int nStrLen ) ;
extern int		dvcGetCCDWidth(void* hDevice) ;
extern int		dvcGetCCDHeight(void* hDevice) ;

extern int		dvcResetCamera( void* hDevice ) ;

extern int		dvcCommIsConnected( void* hDevice) ;
extern int		dvcCommReConnect( void* hDevice, int nPort) ;
extern int		dvcCommDisConnect( void* hDevice) ;
extern int		dvcSetDisconnectEvent(void* hDevice, void* hEvent);
extern int		dvc1394Device(void* hDevice);
extern int		dvcEdtDevice(void* hDevice);
extern int		dvcEclDevice(void* hDevice);
extern int		dvcMatroxDevice(void* hDevice);
extern int		dvcEpixDevice(void* hDevice);
extern int		dvcNetDevice(void* hDevice);

extern double	dvcGetMaxPixelClock( void* hDevice ) ;

// Parameter I/O

extern int		dvcGetBinning (void* hDevice, int *pBinning ) ;
extern int		dvcSetBinning (void* hDevice, int nBinning ) ;
extern int		dvcGetHVBin(void* hDevice, int *phBin, int *pvBin ) ;
extern int		dvcSetHVBin(void* hDevice, int hBin, int vBin ) ;
extern int		dvcDisconnectBinningExpose (void* hDevice, int bOnOff ) ;
extern int		dvcSetGain( void* hDevice, int nGain ) ;
extern int		dvcGetGain(void* hDevice, int *pGain) ;
extern int		dvcSetOffset( void* hDevice, int nOffset) ;
extern int		dvcGetOffset(void* hDevice, int *pOffset) ;
extern int 	dvcSetGaindB(void* hDevice, double dGain) ;
extern int 	dvcGetGaindB(void* hDevice, double *pGaindB ) ;
extern int 	dvcGetGaindBRange(void* hDevice, double *pMin, double *pMax, double *pInterval ) ;
extern int 	dvcSetOffsetFS(void* hDevice, double dOffset) ;
extern int 	dvcGetOffsetFS(void* hDevice, double *pOffset) ;
extern int 	dvcGetOffsetFSRange(void* hDevice, double *pMin, double *pMax, double *pInterval) ;
extern int		dvcSetGainOffset( void* hDevice, int nGain, int nOffset) ;
extern int		dvcGetGainOffset(void* hDevice, int *pGain, int *pOffset) ;
extern int		dvcGetScanRate (void* hDevice, int *pSlowScan ) ;
extern int		dvcSetScanRate (void* hDevice, int nSlowScan ) ;
extern int		dvcGetExposureMode (void* hDevice, int *pMode ) ;
extern int		dvcSetExposureMode (void* hDevice, int nMode ) ;
extern int		dvcGetExposureDuration( void* hDevice, int *pExpose ) ;
extern int		dvcSetExposureDuration( void* hDevice, int nExpose ) ;
extern double	dvcGetExposeMsec( void* hDevice ) ;
extern double	dvcSetExposeMsec( void* hDevice, double dMilliSeconds ) ;
extern int		dvcGetExposeInterval( void* hDevice, int nMode, int nBin, int nSlowScan, double *pInterval);
extern int		dvcGetExposeMax( void* hDevice, int nMode, int nBin, int nSlowScan, double *pMax);
extern double	dvcGetPixelClock( void* hDevice ) ;

extern int		dvcIsColor( void* hDevice ) ;
extern int		dvcCanRoi( void* hDevice ) ;

extern int		dvcGetXDim(void* hDevice) ;
extern int		dvcGetYDim(void* hDevice) ;
extern int		dvcGetImageWidth(void* hDevice) ;
extern int		dvcGetImageHeight(void* hDevice) ;
extern int		dvcSetRoi( void* hDevice, int nOnOff, RECT *prSet ) ;
extern int		dvcGetRoi( void* hDevice, int *pOnOff, RECT *prGet ) ;

extern int		dvcGetFilterWheelStatus( void* hDevice, int *pStatus ) ;
extern int		dvcGetFilterWheelSpeed( void* hDevice, int *pSpeed ) ;
extern int		dvcGetFilterWheelPosition( void* hDevice, int *pPosition ) ;
extern int		dvcSetFilterWheelSpeed( void* hDevice, int nSpeed ) ;
extern int		dvcSetFilterWheelPosition( void* hDevice, int nPosition, int bWait ) ;

extern int		dvcSetIntensifierMode( void* hDevice, int nMode );
extern int		dvcGetIntensifierMode( void* hDevice, int *pMode );
extern int		dvcSetIntensifierGain( void* hDevice, int nGain );
extern int		dvcGetIntensifierGain( void* hDevice, int *pGain );
extern int		dvcSetIntensifierDelay( void* hDevice, int nDelay );
extern int		dvcGetIntensifierDelay( void* hDevice, int *pDelay );
extern int		dvcSetIntensifierDuration( void* hDevice, int nPulseWidth );
extern int		dvcGetIntensifierDuration( void* hDevice, int *pPulseWidth );


// Image Acquisition 

extern int		dvcResetExpose(void* hDevice);
extern int		dvcStartSequence( void* hDevice, unsigned long frames);
extern int		dvcStartSequenceEx( void* hDevice, unsigned long frames,int dvcTrig);
extern int		dvcGetStreamState( void* hDevice, int *state, unsigned long *frames);
extern int		dvcGetStreamBytes( void* hDevice, int *state, unsigned long *nBytes);
extern int		dvcGetStatus( void* hDevice ) ;
extern int		dvcStopSequence( void* hDevice ) ;
extern int		dvcGetLineFrameTime( void* hDevice, double *pLine, double *pFrame ) ;
extern double	dvcGetTimeToReadImage( void* hDevice ) ;
extern double	dvcGetTimeToNextExpose( void* hDevice ) ;
extern double	dvcGetTimeToExposeComplete( void* hDevice ) ;
extern double	dvcGetTimeToReadComplete( void* hDevice ) ;
extern int		dvcWaitImage( void* hDevice, double dWaitMilliSeconds ) ;
extern int		dvcWaitExpose( void* hDevice, double dWaitMilliSeconds ) ;
extern int		dvcSetCallback( void* hDevice, dvcCallbackProcP fCallback, void* pUserData ) ;
extern int		dvcHasCallback( void* hDevice );
extern int		dvcSetReadCompleteEvent( void* hDevice, void* hEvent ) ;
extern int		dvcGetReadCompleteEvent( void* hDevice, void** hEvent ) ;
extern int		dvcSetFilterMoveEvent( void* hDevice, void* hEvent ) ;
extern int		dvcSetExposeCompleteEvent( void* hDevice, void* hEvent ) ;
extern int		dvcGetExposeCompleteEvent( void* hDevice, void** hEvent) ;
// extern void		dvcSetOpenCallback( dvcCallback2ProcP fCallback ) ;
extern void		updateOpenCallback(char *msg, ...);
extern int		dvcGetFrameCount( void* hDevice ) ;
extern int		dvcGetStreamCount( void* hDevice ) ;
extern int		dvcGetExposeCount( void* hDevice ) ;
extern double	dvcGetStreamTime( void* hDevice ) ;
extern double	dvcGetFrameRate( void* hDevice ) ;

extern unsigned long	dvcGetImageBytes( void* hDevice ) ;
extern int		dvcTakePicture( void* hDevice ) ;

extern int		dvcReadMeta( void* hDevice, ImageMetaDataP pMeta);
extern int		dvcGetDriverBuffers( void* hDevice, int *pNBuffers, int *pLastBuffer);
extern int		dvcReadDriverBuffer( void* hDevice, int nBuffer, unsigned short* buffer, unsigned long left, unsigned long top, unsigned long width, unsigned long height) ;
extern int		dvcReadDriverBufferEx( void* hDevice, int nBuffer, unsigned short* buffer, unsigned long left, unsigned long top, unsigned long width, unsigned long height, ImageMetaDataP pMeta) ;
extern int		dvcReadImageAndMeta( void* hDevice, unsigned short* buffer, unsigned long left, unsigned long top, unsigned long width, unsigned long height, ImageMetaDataP pMeta) ;
extern int		dvcReadImage( void* hDevice, unsigned short* buffer, unsigned long left, unsigned long top, unsigned long width, unsigned long height) ;

extern int		dvcReadImageEx( void* hDevice, unsigned short* buffer, unsigned long left, unsigned long top, unsigned long width, unsigned long height, unsigned long lineWidth ) ;
extern int	dvcOverlappedReadImage( void* hDevice, unsigned short* buffer, unsigned long left, unsigned long top, unsigned long width, unsigned long height) ;
// extern int	dvcOverlappedReadImageEx( void* hDevice, unsigned short* buffer, unsigned long left, unsigned long top, unsigned long width, unsigned long height, ImageMetaDataP pMeta) ;
extern int		dvcReadRGB32( void* hDevice, unsigned long* buffer, unsigned long left, unsigned long top, unsigned long width, unsigned long height, unsigned long lineWidth, int bWhiteBalance ) ;
extern int		dvcReadImageRGB48( void* hDevice, unsigned short* rgbBuffer, unsigned long left, unsigned long top, unsigned long width, unsigned long height) ;
extern int		dvcReadLine( void* hDevice, unsigned long imageX, unsigned long imageY, unsigned long width, unsigned short* pixelData) ;
extern int		dvcReadPixel( void* hDevice, unsigned long imageX, unsigned long imageY, int *pixelData) ;

extern int		dvcSetUserBuffers(void* hDevice, dvcBufStructP pBufStruct);
extern int		dvcAllocateUserBuffersEx(void* hDevice, dvcBufStructP pBufStruct, int nBuffers, int width, int height ) ;
extern int		dvcAllocateUserBuffers(void* hDevice, dvcBufStructP pBufStruct, int nBuffers) ;
extern int		dvcReleaseUserBuffers( dvcBufStructP pBufStruct );
extern int		dvcGetUserBufferId( void* hDevice, int *pID) ;

// Image Utilities

extern HBITMAP	dvcImageToDIB( HDC hDC, unsigned long ulX, unsigned long ulY, unsigned long ulWidth, unsigned long ulHeight, unsigned short* imageBuffer, unsigned char *rlut, unsigned char *glut, unsigned char *blut, unsigned long lutSize, int isColor) ;
extern int		dvcWriteBmpFile( char *fname, unsigned long ulX, unsigned long ulY, unsigned long width, unsigned long height, unsigned short *buffer, unsigned char *rlut, unsigned char *glut, unsigned char *blut, unsigned long lutSize, int isColor) ;
extern int		dvcWriteRGBBmpFile( char *fname, unsigned long width, unsigned long height, unsigned long *buffer, unsigned long ulBitsPerPixel) ; 
extern int		dvcWriteTifImage( char *name, unsigned short *buffer, unsigned long ulX, unsigned long ulY, unsigned long width, unsigned long height, int bitsPerPixel, int format, unsigned char *rlut, unsigned char *glut, unsigned char *blut, unsigned long lutSize) ;
extern int		dvcAppendTifImage( void* pTiff, unsigned short *buffer, unsigned long ulX, unsigned long ulY, unsigned long width, unsigned long height, int bitsPerPixel, int format, unsigned char *rlut, unsigned char *glut, unsigned char *blut, unsigned long lutSize) ;
extern int		dvcWriteTifBuffer( void* pTiff, unsigned short *buffer, unsigned long ulX, unsigned long ulY, unsigned long width, unsigned long height, int bitsPerPixel, int format, int bIsBayer, unsigned char *rlut, unsigned char *glut, unsigned char *blut, unsigned long lutSize) ;
extern int		dvcWriteTifHeader( void* pTiff, char *szTimeStamp, char *szDescription, char *szModel);

extern int		dvcSaveTifColormap( int bOn );

//
// Pass 16 bit RGB color info
//
extern int		dvcRGB16Info( unsigned short redMask, unsigned short redBits, unsigned short redShift, unsigned short greenMask, unsigned short greenBits, unsigned short greenShift, unsigned short blueMask, unsigned short blueBits, unsigned short blutShift) ; 

extern int		dvcCopyBufferToRGB16( 
	unsigned short *rawDataBuffer,				// 16 bits/pixel input buffer
	unsigned long ulX,
	unsigned long ulY,					// left,top of input image
	unsigned long width,
	unsigned long height,				// dimensions of input image
	unsigned short *aRGBOutputBuffer,			// 16 bits/pixel output buffer
	unsigned long ulBytesPerRow,		// number of bytes between vertical pix
	unsigned char *rlut,							// 12 to 8 red LUT
	unsigned char *glut,							// 12 to 8 green LUT
	unsigned char *blut,							// 12 to 8 blue LUT
	unsigned long lutSize,						// size of red,green,blue luts
	int  bInputIsBayerMask
	) ;

extern int		dvcCopyBufferToRGB24( 
	unsigned short *rawDataBuffer,				// 16 bits/pixel input buffer
	unsigned long ulX,
	unsigned long ulY,					// left,top of input image
	unsigned long width,
	unsigned long height,				// dimensions of input image
	unsigned char *aRGBOutputBuffer,				// 24 bits/pixel output buffer
	unsigned long ulBytesPerRow,		// number of bytes between vertical pix
	unsigned char *rlut,							// 12 to 8 red LUT
	unsigned char *glut,							// 12 to 8 green LUT
	unsigned char *blut,							// 12 to 8 blue LUT
	unsigned long lutSize,						// size of red,green,blue luts
	int  bInputIsBayerMask
	) ;

extern int		dvcSetRGBCrossTalkMatrix( 
				double rg, double rb, double gr,
				double gb, double br, double bg ) ;

extern int		dvcCopyBufferToRGB32( 
	unsigned short *rawDataBuffer,				// 16 bits/pixel input buffer
	unsigned long ulX,
	unsigned long ulY,					// left,top of input image
	unsigned long width,
	unsigned long height,				// dimensions of input image
	unsigned long *aRGBOutputBuffer,	//32 bits/pixel output buffer
	unsigned long ulBytesPerRow,		// number of bytes between vertical pix
	unsigned char *rlut,							// 12 to 8 red LUT
	unsigned char *glut,							// 12 to 8 green LUT
	unsigned char *blut,							// 12 to 8 blue LUT
	unsigned long lutSize,						// size of red,green,blue luts
	int  bInputIsBayerMask
	) ;

extern int		dvcCMYToRGB16( 
	unsigned short *rawDataBuffer,				// 16 bits/pixel input buffer
	unsigned long ulX,
	unsigned long ulY,					// left,top of input image
	unsigned long width,
	unsigned long height,				// dimensions of input image
	unsigned short *aRGBOutputBuffer,			// 16 bits/pixel output buffer
	unsigned long ulBytesPerRow,		// number of bytes between vertical pix
	unsigned char *rlut,							// 12 to 8 red LUT
	unsigned char *glut,							// 12 to 8 green LUT
	unsigned char *blut,							// 12 to 8 blue LUT
	unsigned long lutSize,						// size of red,green,blue luts
	int bInterlaced
	) ;

extern int		dvcCMYToRGB24( 
	unsigned short *rawDataBuffer,				// 16 bits/pixel input buffer
	unsigned long ulX,
	unsigned long ulY,					// left,top of input image
	unsigned long width,
	unsigned long height,				// dimensions of input image
	unsigned char *aRGBOutputBuffer,				// 24 bits/pixel output buffer
	unsigned long ulBytesPerRow,		// number of bytes between vertical pix
	unsigned char *rlut,							// 12 to 8 red LUT
	unsigned char *glut,							// 12 to 8 green LUT
	unsigned char *blut,							// 12 to 8 blue LUT
	unsigned long lutSize,						// size of red,green,blue luts
	int bInterlaced
	) ;

extern int		dvcCMYToRGB32( 
	unsigned short *rawDataBuffer,				// 16 bits/pixel input buffer
	unsigned long ulX,
	unsigned long ulY,					// left,top of input image
	unsigned long width,
	unsigned long height,				// dimensions of input image
	unsigned long *aRGBOutputBuffer,	//32 bits/pixel output buffer
	unsigned long ulBytesPerRow,		// number of bytes between vertical pix
	unsigned char *rlut,							// 12 to 8 red LUT
	unsigned char *glut,							// 12 to 8 green LUT
	unsigned char *blut,							// 12 to 8 blue LUT
	unsigned long lutSize,						// size of red,green,blue luts
	int bInterlaced
	) ;

// extern int		dvcSetSharpness( void* hDevice, int nOn ) ;
// extern int		dvcGetSharpness( void* hDevice, int *pOn ) ;
// extern int		dvcSetWhiteBalance( void* hDevice, int nOn ) ;
// extern int		dvcGetWhiteBalance( void* hDevice, int *pOn ) ;

extern int		dvcGetLutSize( void* hDevice, unsigned long *lutSize ) ;
extern int		dvcResetRGBLuts( void* hDevice ) ;
extern unsigned char *	dvcGetRedLut( void* hDevice, unsigned long *lutSize ) ;
extern unsigned char *	dvcGetGreenLut( void* hDevice, unsigned long *lutSize ) ;
extern unsigned char *	dvcGetBlueLut( void* hDevice, unsigned long *lutSize ) ;
extern int 	dvcReleaseLut( PBYTE pLut ) ;
extern int		dvcSetRedLut( void* hDevice, PBYTE pLut, unsigned long lutSize ) ;
extern int		dvcSetGreenLut( void* hDevice, PBYTE pLut, unsigned long lutSize ) ;
extern int		dvcSetBlueLut( void* hDevice, PBYTE pLut, unsigned long lutSize ) ;
extern int		dvcSetRGBLuts( void* hDevice, PBYTE rLut, PBYTE gLut, PBYTE bLut, unsigned long lutSize ) ;
extern int		dvcGetRGBLuts( void* hDevice, PBYTE rLut, PBYTE gLut, PBYTE bLut, unsigned long lutSize ) ;

extern int		dvcSaveAsBitMap( void* hDevice, LPSTR szPath ) ;
extern int		dvcShowImage( void* hDevice, HDC hDC, int x, int y, int width, int height) ;


extern int		dvcCopyShortImageData ( void* hDevice, unsigned short *pBuffer ) ;
extern int		dvcCopyCharImageData( void* hDevice, unsigned char *pBuffer, unsigned char *lut) ;

extern dvcHistP	dvcAllocateHistogram(void) ;
extern int		dvcReleaseHistogram(dvcHist *pHist) ;
extern int		dvcComputeHistogram( dvcHistP pHist, unsigned short *pImageBuffer, unsigned long ulWidth, unsigned long ulHeight, unsigned long ulDX, unsigned long ulDY, int bZeroHistogramData) ;
extern int		dvcComputeRGBHistogram( dvcHistP pHist, unsigned long *pImageBuffer, unsigned long ulWidth, unsigned long ulHeight, unsigned long ulDX, unsigned long ulDY, int bZeroHistogramData) ;
extern int		dvcComputeHistogramMask( dvcHistP pHist, unsigned short *pImageBuffer, unsigned short *pImageMask, unsigned long ulWidth, unsigned long ulHeight, unsigned long ulDX, unsigned long ulDY, int bZeroHistogramData) ;
extern int		dvcComputeRGBHistogramMask( dvcHistP pHist, unsigned long *pImageBuffer, unsigned short *pImageMask, unsigned long ulWidth, unsigned long ulHeight, unsigned long ulDX, unsigned long ulDY, int bZeroHistogramData) ;
extern int		dvcGetMeanVariance(dvcHistP pHist, double *pMean, double *pVariance);
extern int		dvcGetHistogramMode( dvcHistP pHist, unsigned long *pMode, unsigned long *pFreq) ;


extern int		dvcGetImageFormat(void* hDevice, int nX, int nY, int *pFormat);
extern int		dvcSnapShot(void* hDevice, double dExpose, int dvcTrigger);
extern int		dvcAutoScaleImage ( unsigned short* pImageBuffer, unsigned long ulLeft, unsigned long ulTop, unsigned long ulWidth, unsigned long ulHeight, PBYTE pRedLut, PBYTE pGreenLut, PBYTE pBlueLut, unsigned long lutSize);
extern int		dvcWhiteBalanceImage ( unsigned short* pImageBuffer, unsigned long ulLeft, unsigned long ulTop, unsigned long ulWidth, unsigned long ulHeight, PBYTE pRedLut, PBYTE pGreenLut, PBYTE pBlueLut, unsigned long lutSize);
extern	int	dvcWhiteBalanceRGB48 ( unsigned short* rBuffer, unsigned short* gBuffer, unsigned short* bBuffer, unsigned long	ulLeft, unsigned long	ulTop, unsigned long	ulWidth, unsigned long	ulHeight, PBYTE	pRedLut, PBYTE	pGreenLut, PBYTE	pBlueLut, unsigned long	lutSize);
extern int	dvcPeakBalanceRGB48 ( unsigned short* rBuffer, unsigned short* gBuffer, unsigned short* bBuffer, unsigned long	ulLeft, unsigned long	ulTop, unsigned long	ulWidth, unsigned long	ulHeight, PBYTE	pRedLut, PBYTE	pGreenLut, PBYTE	pBlueLut, unsigned long	lutSize);
extern int		dvcFindPeakBalanceScales( unsigned short* rBuffer, unsigned short* gBuffer, unsigned short* bBuffer, unsigned long ulWidth, unsigned long ulHeight,  double *pRedScale, double *pGreenScale, double *pBlueScale) ;
extern int		dvcBayerPeakBalanceScales( unsigned short* pBuffer, unsigned long ulWidth, unsigned long ulHeight,  double *pRedScale, double *pGreenScale, double *pBlueScale) ;
extern int		dvcFindWhiteBalanceScales( unsigned short* rBuffer, unsigned short* gBuffer, unsigned short* bBuffer, unsigned long ulWidth, unsigned long ulHeight,  double *pRedScale, double *pGreenScale, double *pBlueScale) ;
extern int		dvcBayerWhiteBalanceScales( unsigned short* pBuffer, unsigned long ulWidth, unsigned long ulHeight,  double *pRedScale, double *pGreenScale, double *pBlueScale) ;
extern int		dvcCMYWhiteBalanceScales( unsigned short* pBuffer, unsigned long ulWidth, unsigned long ulHeight,  double *pRedScale, double *pGreenScale, double *pBlueScale) ;
extern	int	dvcAutoScaleBayerImage ( unsigned short* pImageBuffer, unsigned long	ulLeft, unsigned long	ulTop, unsigned long	ulWidth, unsigned long	ulHeight, PBYTE	pRedLut, PBYTE	pGreenLut, PBYTE	pBlueLut, unsigned long	lutSize, int	bWhiteBalance);


extern int		dvcGetRGBGamma( void* hDevice, unsigned long* pulGamma ) ;
extern int		dvcSetRGBGamma( void* hDevice, unsigned long* pulGamma ) ;
extern int		dvcGetRGBBrightness( void* hDevice, unsigned long* pulBrightness ) ;
extern int		dvcSetRGBBrightness( void* hDevice, unsigned long* pulBrightness ) ;
extern int		dvcGetRGBContrast( void* hDevice, unsigned long* pulContrast ) ;
extern int		dvcSetRGBContrast( void* hDevice, unsigned long* pulContrast ) ;
extern int		dvcGetRGBColorBalance( void* hDevice, unsigned long* pulColorBalance ) ;
extern int		dvcSetRGBColorBalance( void* hDevice, unsigned long* pulColorBalance ) ;


// Diagnostics
extern double	dvcElapseTime( double stime ) ;
extern int		dvcSetDebugLevel( int level ) ;
extern int		dvcGetDebugLevel( void ) ;

extern void*	dvcOpenLog(char *fmt);
extern int		dvcCloseLog(void);
extern void		dvcPrintf(int level, char *fmt, ...);
extern void		dvcLog(char *fmt, ...);

extern int		dvcResetErr( void  ) ;
extern int		dvcSetErrMsg( int level, int dvcErr, char *msg,  char *file, int line  ) ;
extern int		dvcGetLastErr( void ) ;
extern char *	dvcGetLastErrMsg( void ) ;
extern char *	dvcGetLastErrFile( void ) ;
extern int		dvcGetLastErrLine( void ) ;
extern double	dvcGetLastErrTime( void ) ;
extern unsigned long	dvcExceptionErr(unsigned long ulCode);

extern int 	dvcSetParm (void* hDevice, unsigned long ulAttribute, int nValue);
extern int 	dvcGetParm (void* hDevice, unsigned long ulAttribute, int *pValue);
extern int 	dvcGetParmRange ( void* hDevice, unsigned long ulAttribute,
						int *pMin, int *pMax, int *pIntveral, int *pDefault );
extern int 	dvcGetCapability ( void* hDevice, char *szCapability,
						int *pMin, int *pMax, int *pIntveral, int *pDefault );

extern int 	dvcAutoShutterIntensifier (void* hDevice, int bOnOff );
extern int 	dvcSetIntensifierExposeTime(void* hDevice, double dMsec);
extern int 	dvcGetIntensifierExposeTime(void* hDevice, double *pdMsec);
extern int 	dvcSendComm(void* hDevice, char *szWrite, char *szRead, int nReadBufferSize);

// 0700 Video support
extern int dvcHasExtVideo( void* hDevice ) ;
extern int dvcSetExtVideo( void* hDevice, int bOnOff ) ;
extern int dvcGetExtVideo( void* hDevice ) ;

// Switch for using HDL,HNL and NRR,NOR
// On by default,  enables HRT to async reset start of exposure
extern int dvcSetExtReset( void* hDevice, int bOnOff ) ;
extern int dvcGetExtReset( void* hDevice ) ;

// Switch for setting Intensifier into PEX, external trigger mode
// Off by default,  enables AUX pin 4 to gate intensifier MCP on/off
extern int dvcSetIntensifierExtTrigger( void* hDevice, int bOnOff ) ;
extern int dvcGetIntensifierExtTrigger( void* hDevice ) ;

//
// 1394 Devices only..
// Sets the priority of service threads, 
// default Capture and Expose run at THREAD_PRIORITY_NORMAL
// and Callback runs at THREAD_PRIORITY_ABOVE_NORMAL
//

extern int dvcGetThreadPriorities( void* hDevice, int *pCapture, int *pExpose, int *pCallback );
extern int dvcSetThreadPriorities( void* hDevice, int nCapture, int nExpose, int nCallback );

extern int dvcSetSerialMode( void* hSerial, int nBaud, int mData, int nStop, int nParity ) ;
extern int dvcSetSerialTimeout( void* hSerial, int nTimeOut )  ;
extern void* dvcOpenSerial( char *szPortName, int nBaud, int nData, int nStop, int nParity ) ;
extern int dvcCloseSerial( void* hSerial ) ;
extern int dvcReadSerial(void* hSerial, char *buffer, int bytesToRead, int nTimeout);
extern int dvcWriteSerial( void* hSerial, char *szWriteBuffer, int bytesToWrite ) ;

extern int dvcHasAuxTTL( void* hDevice );
extern int dvcSetAuxTTL( void* hDevice, int bManual, int bHi );
extern int dvcGetAuxTTL( void* hDevice, int *pManual, int *pHi );

// Requires PortIOEnabled in dvcapi.ini
extern int dvcSetPort( void* hDevice, int nPortID, int nValue );
extern int dvcGetPort( void* hDevice, int nPortID, int *pValue );

extern int dvcSetPreAmp( void* hDevice, int bOnOff, int nWhen );
extern int dvcGetPreAmp( void* hDevice, int *pOnOff, int *pWhen );
extern int dvcSetDefault( char *szAttr, char *szValue);
extern int dvcSetDefaultInt( char *szAttr, int nDefault);
extern int dvcSetDefaultDouble( char *szAttr, double dDefault);
extern int dvcSetDefaultBool( char *szAttr, int bDefault);

extern int dvcGetDefault(char *szAttr, char *szValue, int nValueLen, char *szDefault);
extern int  dvcGetDefaultInt( char *szAttr, int nDefault);
extern double dvcGetDefaultDouble( char *szAttr, double dDefault);
extern int dvcGetDefaultBool( char *szAttr, int bDefault);

extern int dvcGetCameraDefault(void* hDevice,char *szAttr,char *szValue,int nValueLen,char *szDefault);
extern int dvcGetCameraDefaultInt(void* hDevice,char *szAttr,int nDefault);
extern double dvcGetCameraDefaultDouble(void* hDevice,char *szAttr,double dDefault) ;
extern int dvcGetCameraDefaultBool(void* hDevice,char *szAttr,int bDefault) ;
extern int dvcSetCameraDefault(void* hDevice,char *szAttr,char *szValue);
extern int dvcSetCameraDefaultInt(void* hDevice,char *szAttr,int nValue);
extern int dvcSetCameraDefaultDouble(void* hDevice,char *szAttr,double dValue) ;
extern int dvcSetCameraDefaultBool(void* hDevice,char *szAttr,int bDefault);

extern int dvcGetAppDefault(char *szApp,char *szAttr,char *szValue,int nValueLen,char *szDefault);
extern int dvcGetAppDefaultInt(char *szApp,char *szAttr,int nDefault);
extern double dvcGetAppDefaultDouble(char *szApp,char *szAttr,double dDefault) ;
extern int dvcGetAppDefaultBool(char *szApp,char *szAttr,int bDefault) ;
extern int dvcSetAppDefault(char *szApp,char *szAttr,char *szValue);
extern int dvcSetAppDefaultInt(char *szApp,char *szAttr,int nValue);
extern int dvcSetAppDefaultDouble(char *szApp,char *szAttr,double dValue) ;
extern int dvcSetAppDefaultBool(char *szApp,char *szAttr,int bDefault);

extern int dvcSetStrobe( void* hDevice, int eStrobe );
extern int dvcGetStrobe( void* hDevice, int *pStrobe );
extern int dvcSetStrobeDelay( void* hDevice, double dDelay );
extern int dvcGetStrobeDelay( void* hDevice, double *pdDelay );
extern int dvcIsKodakDevice( void* hDevice );
extern int dvcIsSonyDevice( void* hDevice );
extern int dvcReadPromAttrString(void* hDevice, char *attr, char *pValue, int nValueLen);
extern int dvcReadPromAttrInt(void* hDevice, char *attr, int *pValue);

extern int dvcSetNonOverlappedExpose(void* hDevice, int bOnOff);
extern int dvcGetNonOverlappedExpose(void* hDevice, int *pbOnOff);

extern void dvcSetWarningHandler(int dvcErr, dvcCallback2ProcP pFunc, void* pUserData);
extern void dvcSendWarning( int dvcErr, char *fmt, ... );

extern const char* dvcGetUserDir() ;
		// default [%HOMEDRIVE%]\DVCCo or %DVCUSER%
extern const char* dvcGetHomeDir() ;
		// default [%HOMEDRIVE%]\Program Files\DVCCo or %DVCHOME%
extern const char* dvcGetIniFile() ;
		// default [%HOMEDRIVE%]\Program Files\DVCCo\dvcapi.ini
		// or set by %DVCAPIINI%
