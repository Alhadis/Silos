#!/bin/csh


set PRESENTDATE     = '/usr/knmi/bin/extdate'
set BACKUPDATE      = '/usr/knmi/bin/backupdate'
set path_tsf_2_real = 'tsf_2_real'



/***********************************************************************/
/*                                                                     */ 
/*                                MODES                                */
/*                                                                     */
/***********************************************************************/

# 
# dit script aanroepen met 1 argument
#

# argument is cijfer uit reeks 1 - 18 (zie hieronder) b.v. "gps_main_control.sc 16"






/***********************************************************************/
/*                                                                     */ 
/*                          DIRECTORIES EN FILES                       */
/*                                                                     */
/***********************************************************************/

# gps home dir waar het volgende geinstalleerd moet zijn:
#
# - directory: input_cic
# - directory: input_nedwam - file: tsf_info.txt (niet leeg)
#                           - file: tma_info.txt (niet leeg)
# - directory: input_hirlam - file: uba_info.txt (niet leeg)
# - directory: output_cic
# - directory: output_nedwam
# - directory: temp_cic
# - directory: temp_nedwam
# - directory: temp_hirlam
#
# - file: gps_new.exe
# - file: get_rtwndb_cic_data.exe

# - file: gps_main_control.sc (dit script file)
# - file: gps_cic_control.sc
# - file: gps_dsp_control.sc
# - file: gps_nedwam_control.sc
# - file: gps_nedwam_retry_control.sc
# - file: gps_nedwam_tweede_retry_control.sc
# - file: gps_nedwam_verif_control.sc
# - file: gps_nedwam_update_3_control.sc
# - file: gps_nedwam_update_6_control.sc
# - file: gps_par_control.sc
# - file: gps_par_retry_control.sc
# - file: gps_par_tweede_retry_control.sc
# - file: gps_par_update_3_control.sc
# - file: gps_par_update_4_control.sc
# - file: gps_par_update_5_control.sc
# - file: gps_par_update_6_control.sc
# - file: gps_par_update_7_control.sc
# - file: gps_par_update_8_control.sc
# - file: get_rtwndb_cic_data.sc
# 
# - eventueel file: gps_hwa_input.c 
# - eventueel file: gps_cid_input.c
# - eventueel file: gps_nedwam_tma_uba_ps.c
# - eventueel file: gps_hirlam_uba_input.c
# - eventueel file: gps_nedwam_tma_input.c 
# - eventueel file: gps_nedwam_tsa_input.c
# - eventueel file: gps_main.c
# - eventueel file: gps.h
# - eventueel file: gps_dsp_polair.c
# - eventueel file: gps_dsp_input.c
# - eventueel file: gps_nedwam_polair.c
# - eventueel file: gps_html.c
# - eventueel file: gps_hirlam_input.c
# - eventueel file: gps_nedwam_ps.c
# - eventueel file: gps_nedwam_compute.c
# - eventueel file: gps_input.c
# - eventueel file: gps_ps.c
# - eventueel file: get_rtwndb_cic_data.c
# - eventueel file: makefile_get_rtwndb_cic_data
# - eventueel file: makefile_gps





# gps locations dir (zie: ENV_GPS_LOCATIONS) waar volgende geinstalleerd moet zijn:
#
# - file: locations.txt (niet leeg)



# gps intranet dir (zie: PATH_INTRANET_GPS_UNIX) waar volgende geinstalleerd moet zijn:
#
# - dir: png_graphs
# - dir: png_graphs/archive
# - dir: png_charts               - file: location_chart_11_s7.gif
#                                 - file: golven_background.png
#                                 - file: golven_linker_kolom.png
# - dir: gps_beschrijving         - file: gps_tr.htm
#                                 - file: getobs_gps_uvs.htm
#                                 - dir: gps_tr_files - files: 30x (bv header.htm, image006.gif etc.) 
#                                                     
#
# - file: index.html
# - file: info_general.html
# - file: info_spectrum.html
# - file: spectrum.pdf
# - file: info_sp_wmog.html ??????????????
# - files: 74x html files (b.v. mpn_1.html, cic_all_ana_1.html etc.)




# gps log dir (zie: ENV_GPS_LOG) waar volgende geinstalleerd moet zijn:
#
# - file: naar keuze (zie: ENV_GPS_LOG)




/***********************************************************************/
/*                                                                     */ 
/*                        ENVIRONMENT VARS                             */
/*                                                                     */
/***********************************************************************/

setenv ENV_INFO_KNMI_GPS_HOME  http://info.knmi.nl/~stam/test/                                        # virtueel adres: GPS home dir (via info.knmi.nl)
setenv ENV_INFO_KNMI_GPS_INDEX http://info.knmi.nl/~stam/test/index.html                              # virtueel adres: GPS index pagina (via info.knmi.nl)
setenv ENV_INFO_KNMI_GPS_LINKER_KOLOM http://info.knmi.nl/~stam/test/png_charts/gps_linker_kolom.png  # virtueel adres: GPS linker kolom plaatje (via info.knmi.nl)
setenv PATH_INTRANET_GPS_UNIX /IenI/webdata/www/homepages/stam/pub_info/test/                         # fysiek adres: gps intranet root dir html paginas
setenv path_intranet_gps /IenI/webdata/www/homepages/stam/pub_info/test/png_graphs                    # fysiek adres: png_graphs sub dir van gps intranet root dir
setenv path_intranet_archive_gps /IenI/webdata/www/homepages/stam/pub_info/test/png_graphs/archive    # fysiek adres: sub dir van gps png_graphs sub dir
setenv ENV_GPS_LOCAL /users/stam/TEST                                                                 # root dir van dit systeem
#setenv ENV_HWA_GLOBAL /users/stam/CIC_RTWNDB/DATA                                                    # metingen
setenv ENV_LDS_GLOBAL /users/stam/SPECTRA/output_lds                                                 # metingen
setenv ENV_CIC_GLOBAL /users/stam/SPECTRA/output_cic                                                 # metingen
setenv ENV_CID_GLOBAL /users/stam/SPECTRA/output_cid                                                 # metingen
setenv ENV_DSP_GLOBAL /users/stam/SPECTRA/output_dsp                                                 # metingen
setenv ENV_TSA_GLOBAL /apl/apldata/TRDB                                                              # nedwam (files: NEWH_TSA_... etc.)
setenv ENV_TMA_GLOBAL /apl/apldata/TRDB                                                              # nedwam (files: NEWH_TMA_... etc.)
setenv ENV_HIRLAM_GLOBAL /users/stam/HIRLAM                                                          # hirlam (files: hirver... etc.)
setenv ENV_UBA_GLOBAL /apl/apldata/TRDB                                                              # hirlam (files: LAMH_UBA_... etc)
setenv ENV_GPS_LOG /users/stam/TEST/log/testgpslog.txt                                                    # log directory + file naam
setenv ENV_GPS_LOCATIONS /users/stam/TEST/locations/                                                  # dir. van de file locations.txt





if ($#argv == 1) then


   /***********************************************************************/
   /*                                                                     */ 
   /*                                   cic                               */
   /*                                                                     */
   /***********************************************************************/

   if ($mode == 1) then
      gps_cic_control.sc
   endif

   if ($mode == 2) then
      gps_dsp_control.sc
   endif




   /***********************************************************************/
   /*                                                                     */ 
   /*                                  nedwam                             */
   /*                                                                     */
   /***********************************************************************/

   if ($mode == 3) then
      gps_nedwam_control.sc      
   endif

   if ($mode == 4) then
      gps_nedwam_retry_control.sc
   endif

   if ($mode == 5) then
      gps_nedwam_tweede_retry_control.sc
   endif

   if ($mode == 6) then
      gps_nedwam_upate_3_control.sc      
   endif

   if ($mode == 7) then
      gps_nedwam_upate_6_control.sc      
   endif

   if ($mode == 8) then
      gps_nedwam_verif_control.sc
   endif




   /***********************************************************************/
   /*                                                                     */ 
   /*                          geintegreerde parameters                   */
   /*                                                                     */
   /***********************************************************************/

   if ($mode == 9) then
      gps_par_control.sc
   endif

   if ($mode == 10) then
      gps_par_retry_control.sc
   endif

   if ($mode == 11) then
      gps_par_tweede_retry_control.sc
   endif

   if ($mode == 12) then
      gps_par_update_3_control.sc
   endif

   if ($mode == 13) then
      gps_par_update_4_control.sc
   endif

   if ($mode == 14) then
      gps_par_update_5_control.sc
   endif

   if ($mode == 15) then
      gps_par_update_6_control.sc
   endif

   if ($mode == 16) then
      gps_par_update_7_control.sc
   endif

   if ($mode == 17) then
      gps_par_update_8_control.sc
   endif



   /***********************************************************************/
   /*                                                                     */ 
   /*                               rtwndb cic                            */
   /*                                                                     */
   /***********************************************************************/

   if ($mode == 18) then
      get_rtwndb_cic_data.sc
   endif





endif








/***********************************************************************/
/*                                                                     */ 
/*                                     NOTE                            */
/*                                                                     */
/***********************************************************************/
# aanroep gps_new.exe
# argument 1: datum-tijd (YYYYMMDDUU)
# argument 2:  CIC = metingen spectra (1 dim.) 
#              DSP = metingen spectra polaire plotjes (2 dim.)
#              TSA = nedwam spectra (1 dim.) en nedwam spectra polaire plotjes (2 dim.)
#              TMA = tijdreeksen
#              TSV = nedwam archief (achteraf) 1-dimensionaal spectrum + CIC archief (achteraf) 1-dimensionaal spectrum
