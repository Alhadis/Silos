/******************************  Dvcs_ Header ********************************\
       Filename: $Archive: /ont/src/panaedra/msroot/msutil/logic/top_i/ptop_procedure.i $ 
        Version: $Revision: 2 $ 
     Programmer: $Author: $ 
   Date Checkin: $Date: 2010-01-27 21:10:16+01:00 $ 
  Date Modified: $Modtime: 2010-01-27 19:30:11+01:00 $ 

    Description: Include to be used at the top of each procedure.

\**************************** End of Dvcs_ Header ****************************/
&if '{&dvcs__panaedra_msi_logic_ptop_procedure_i}' = '' &then
&glob dvcs__panaedra_msi_logic_ptop_procedure_i yes
&glob sourcecontrolversions {&sourcecontrolversions} | panaedra_msi_logic_ptop_procedure_i $Revision: 2 $

routine-level on error undo, throw.

&if '{&class}' = '' &then
procedure dvcs__panaedra_msi_logic_ptop_procedure_i: return "$Revision: 2 $". end.
&endif
/******************************* $NoKeywords:  $ *****************************/

&endif
