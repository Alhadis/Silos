//-- Copyright(C) 2005 by Xilinx, Inc. All rights reserved.
//-- This text contains proprietary, confidential
//-- information of Xilinx, Inc., is distributed
//-- under license from Xilinx, Inc., and may be used,
//-- copied and/or disclosed only pursuant to the terms
//-- of a valid license agreement with Xilinx, Inc. This copyright
//-- notice must be retained as part of this text at all times.

//-------------------------------------------------------
// PCI Express Endpoint Module
//-------------------------------------------------------

`ifdef PCI_EXP_64B_EP

`ifdef BOARDx01                        

`define PCI_EXP_EP                      pci_exp_1_lane_64b_ep
`define XILINX_PCI_EXP_EP               xilinx_pci_exp_1_lane_64b_ep
`define PCI_EXP_LINK_WIDTH              1

`endif // BOARDx01

`ifdef BOARDx04                        

`define PCI_EXP_EP                      pci_exp_4_lane_64b_ep
`define XILINX_PCI_EXP_EP               xilinx_pci_exp_4_lane_64b_ep
`define PCI_EXP_LINK_WIDTH              4

`endif // BOARDx04

`ifdef BOARDx08

`define PCI_EXP_EP                      pci_exp_8_lane_64b_ep
//`define PCI_EXP_EP                      pci_exp_8_lane_endpoint
`define XILINX_PCI_EXP_EP               xilinx_pci_exp_8_lane_64b_ep
`define PCI_EXP_LINK_WIDTH              8

`endif // BOARDx08

`endif // PCI_EXP_64B_EP


`ifdef PCI_EXP_32B_EP

`ifdef BOARDx01

`define PCI_EXP_EP                      pci_exp_1_lane_32b_ep
`define XILINX_PCI_EXP_EP               xilinx_pci_exp_1_lane_32b_ep
`define PCI_EXP_LINK_WIDTH              1

`endif // BOARDx01

`ifdef BOARDx04

`define PCI_EXP_EP                      pci_exp_4_lane_32b_ep
`define XILINX_PCI_EXP_EP               xilinx_pci_exp_4_lane_32b_ep
`define PCI_EXP_LINK_WIDTH              4

`endif // BOARDx04

`endif // PCI_EXP_32B_EP

`define PCI_EXP_EP_INST                 ep

//-------------------------------------------------------
// Config File Module
//-------------------------------------------------------

`define PCI_EXP_CFG                     pci_exp_cfg

`define PCI_EXP_CFG_INST                pci_exp_cfg

//-------------------------------------------------------
// Transaction (TRN) Interface
//-------------------------------------------------------

`ifdef PCI_EXP_64B_EP

`define PCI_EXP_TRN_DATA_WIDTH          64
`define PCI_EXP_TRN_REM_WIDTH           8

`endif // PCI_EXP_64B_EP

`ifdef PCI_EXP_32B_EP

`define PCI_EXP_TRN_DATA_WIDTH          32
`define PCI_EXP_TRN_REM_WIDTH           1

`endif // PCI_EXP_32B_EP

`ifdef BOARDx08

`define PCI_EXP_TRN_BUF_AV_WIDTH        6

`else //  BOARDx08

`define PCI_EXP_TRN_BUF_AV_WIDTH        5

`endif //  BOARDx08

`define PCI_EXP_TRN_BAR_HIT_WIDTH       7
`define PCI_EXP_TRN_FC_HDR_WIDTH        8
`define PCI_EXP_TRN_FC_DATA_WIDTH       12

//-------------------------------------------------------
// Application Instance
//-------------------------------------------------------

`ifdef PCI_EXP_64B_EP

`define PCI_EXP_APP                     pci_exp_64b_app

`endif // PCI_EXP_64B_EP

`ifdef PCI_EXP_32B_EP

`define PCI_EXP_APP                     pci_exp_32b_app

`endif // PCI_EXP_32B_EP

//-------------------------------------------------------
// Configuration (CFG) Interface
//-------------------------------------------------------

`define PCI_EXP_CFG_DATA_WIDTH          32
`define PCI_EXP_CFG_ADDR_WIDTH          10
`define PCI_EXP_CFG_BUSNUM_WIDTH        8
`define PCI_EXP_CFG_DEVNUM_WIDTH        5
`define PCI_EXP_CFG_FUNNUM_WIDTH        3
`define PCI_EXP_CFG_CPLHDR_WIDTH        48
`define PCI_EXP_CFG_CAP_WIDTH           16
`define PCI_EXP_CFG_CFG_WIDTH           1024
`define PCI_EXP_CFG_WIDTH               1024
`define PCI_EXP_LNK_STATE_WIDTH         3
