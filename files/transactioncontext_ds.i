/******************************  Dvcs_ Header ********************************\
       Filename: $Archive: /ont/src/panaedra/msroot/msutil/logic/ds/transactioncontext_ds.i $ 
        Version: $Revision: 1 $ 
     Programmer: $Author: $ 
   Date Checkin: $Date: 2010-01-27 16:59:09+01:00 $ 
  Date Modified: $Modtime: 2010-01-27 16:59:09+01:00 $ 

    Description: Transaction context dataset (holds validation messages, e.a.) codeQok#7103

\**************************** End of Dvcs_ Header ****************************/
&if "{&dvcs__panaedra_msroot_msutil_logic_ds_transactioncontext_ds_i}" = "" &then
&glob dvcs__panaedra_msroot_msutil_logic_ds_transactioncontext_ds_i yes
&glob sourcecontrolversions {&sourcecontrolversions} | panaedra_msroot_msutil_logic_ds_transactioncontext_ds_i $Revision: 1 $
&if '{&class}' = '' &then
procedure dvcs__panaedra_msroot_msutil_logic_ds_transactioncontext_ds_i: return "$Revision: 1 $". end.
&endif
/******************************* $NoKeywords:  $ *****************************/

{panaedra/msroot/msutil/logic/tt/transactioncontext_tt.i {&*}}
{panaedra/msroot/msutil/logic/tt/transactionresponse_tt.i {&*}}
{panaedra/msroot/msutil/logic/tt/validation_tt.i {&*}}
{panaedra/msroot/msutil/logic/tt/validationerror_tt.i {&*}}
{panaedra/msroot/msutil/logic/tt/validationquestion_tt.i {&*}}
{panaedra/msroot/msutil/logic/tt/validationreply_tt.i {&*}}

&if defined(static) > 0 and defined(reference-only) > 0 &then &undefine reference-only
&endif

define {&protected} {&static} dataset dsTransactionContext {&reference-only} for ttTransactionContext, ttTransactionResponse, ttValidation, ttValidationError, ttValidationQuestion, ttValidationReply.

&endif /* {&dvcs__panaedra_msroot_msutil_logic_ds_transactioncontext_ds_i} */

/* EOF : panaedra/msroot/msutil/logic/ds/transactioncontext_ds.i */
