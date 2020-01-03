/****************************** Source Header ********************************\

    Description: dataset for testing

\**************************** End of Source Header ***************************/
&if "{&dvcs__panaedra_msroot_msutil_logic_ds_sc_dataset_xml_unittests_i}" = "" &then
&glob dvcs__panaedra_msroot_msutil_logic_ds_sc_dataset_xml_unittests_i yes
/******************************* $NoKeywords:  $ *****************************/
{panaedra/msroot/msutil/logic/tt/sc_dataset_xml_unittests_tt.i  {&*}}

&if defined(static) > 0 and defined(reference-only) > 0 &then &undefine reference-only
&endif

define {&protected} {&static} dataset dsTestDatasetXml {&reference-only} for tt{&ttPrefix}TestDatasetXml{&ttSuffix}.

&endif /* {&dvcs__panaedra_msroot_msutil_logic_ds_sc_dataset_xml_unittests_i} */

/* EOF : panaedra/msroot/msutil/logic/ds/sc_dataset_xml_unittests.i */
