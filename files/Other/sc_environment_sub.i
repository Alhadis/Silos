/******************************  Dvcs_ Header ********************************\
       Filename: $Archive:  $ 
        Version: $Revision:  $ 
     Programmer: $Author: $ 
   Date Checkin: $Date:  $ 
  Date Modified: $Modtime:  $ 

    Description: Preprocessor definitions for sc_environment and it's subprocess(es)

\**************************** End of Dvcs_ Header ****************************/
/******************************* $NoKeywords:  $ *****************************/

/* We are on AIX, 64-bit.                                                         codeQok#7110 
   Direct call to libc.a is not possible, not X64 / not shared on AIX.            codeQok#7110
   See: http://knowledgebase.progress.com/%61rticles/%41rticle/20532/p                codeQok#7110
   We use our own 64 bit python shared object for now, which also includes        codeQok#7110
   getpid.                                                                        codeQok#7110
*/
   
&glob UnixGetpidLib "/usr/lib/libpython2.7.so"

/* EOF : panaedra/msroot/msutil/logic/sc_environment_sub.i */
