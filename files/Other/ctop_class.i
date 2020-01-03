/******************************  Dvcs_ Header ********************************\
       Filename: $Archive: /ont/src/panaedra/msroot/msutil/logic/top_i/ctop_class.i $ 
        Version: $Revision: 2 $ 
     Programmer: $Author: $ 
   Date Checkin: $Date: 2010-01-27 21:10:16+01:00 $ 
  Date Modified: $Modtime: 2010-01-27 19:30:12+01:00 $ 

    Description: Include this in each Panaedra class.
                 "ctop" means: At the top of the source, before the class definition.

\**************************** End of Dvcs_ Header ****************************/
&if '{&dvcs__panaedra_msi_logic_ctop_class_i}' = '' &then
&glob dvcs__panaedra_msi_logic_ctop_class_i yes
&glob sourcecontrolversions {&sourcecontrolversions} | panaedra_msi_logic_ctop_class_i $Revision: 2 $
/******************************* $NoKeywords:  $ *****************************/

using Progress.Lang.*.
routine-level on error undo, throw.

&endif

/* EOF */
