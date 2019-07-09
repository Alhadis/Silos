package com.saike.ebiz.wireless.venus.error;

public final class ${baseNameU1}ErrorCode extends ErrorCode {

    public final static String SYSTEM_NAME = "${systemName}";
    
    public final static int SYSTEM_CODE = ${systemCode};

#foreach( $module in $modules )
    public final static String MODULE_NAME_${module.name} = "${module.name}";

#end
    //-- error code definition -----------------------
#foreach( $module in $modules )
#foreach( $errorCode in $module.errorCodes )
    // ${errorCode.name}
    public final static int ${errorCode.name}_CODE = ${systemCode}${module.code}${errorCode.value};

    public final static ${baseNameU1}ErrorCode ${errorCode.name} =
            new ${baseNameU1}ErrorCode( 
                ${errorCode.name}_CODE, 
                MODULE_NAME_${module.name}, 
                "${errorCode.description}" );

#end
#end
    // this class only used to hold constant variables 
    private ${baseNameU1}ErrorCode(
            int errorCode,
            String moduleName,
            String exceptionDescription ) {
        
        super( errorCode,
                SYSTEM_NAME, 
                moduleName,
                exceptionDescription );
    }
    
    private ${baseNameU1}ErrorCode( 
            String moduleName,
            int moduleCode,
            int exceptionCode,
            String exceptionDescription ) {
        
        super( SYSTEM_NAME, 
                SYSTEM_CODE,
                moduleName,
                moduleCode,
                exceptionCode,
                exceptionDescription );
    }
    
}
