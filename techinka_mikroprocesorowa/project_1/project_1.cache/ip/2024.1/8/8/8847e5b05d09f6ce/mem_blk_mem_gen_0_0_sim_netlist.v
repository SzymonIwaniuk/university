// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Oct 21 10:56:23 2026
// Host        : UTCALB-05 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mem_blk_mem_gen_0_0_sim_netlist.v
// Design      : mem_blk_mem_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mem_blk_mem_gen_0_0,blk_mem_gen_v8_4_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_8,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    wea,
    addra,
    dina,
    douta,
    clkb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [3:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [7:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [7:0]doutb;

  wire [3:0]addra;
  wire [3:0]addrb;
  wire clka;
  wire clkb;
  wire [7:0]dina;
  wire [7:0]dinb;
  wire [7:0]douta;
  wire [7:0]doutb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "4" *) 
  (* C_ADDRB_WIDTH = "4" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.7033 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "NONE" *) 
  (* C_INIT_FILE_NAME = "mem_blk_mem_gen_0_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "16" *) 
  (* C_WRITE_DEPTH_B = "16" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_8 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[3:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[3:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RSqbsRZSIb+QlYJMfFv1T7uHQ7PiCEXQkl687MHGm2LgPB15GIYcPmqKUSXgtkLsIFes91PTAyyB
9H9cyY4ZUxedcRg/9ZOB5pm3zPqAbcvGPmg1ivMhr/MlS19t5lYKM2tQo+0Yd+arJXlVZu2BMnvn
+I3G9t9tJuWUIWKjI+I=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VRSQ05ZaB6bIhFIQ823mTvlJaG9+5iW5C3+KxGjq0sq9ziCshKOLpOGPDMmOWDqA4uBaxC5IKISr
w8+A8mqbYjXo5m1g8sGjNaETS0HKJsK+l5Y++tN4IEUs+DwxgrPR/+LWtChuOzVkfC7BG3LVUEMj
zM3GAyGcXGJ3sdBItZAfsevyiy7kr4Fw+nk2hWytGteu1NZk3VzPE7KQHLkOlHBPXf6P0j8LpKcr
2oNDgQ/WaEmg6OOvFeJuaWDaee8Sn6wKP/caMyoGdSeczsPtRrJeoSRlbNHlxhCv7zg+Cn2AgwrR
PTqGsMrkhv9U0sq+waS0CmwChsk4WB7RspGYUg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
tNziOjCznlvIl4dadmB9r23Duf+HQHWOuHmupEU3PJxrazHVtZdNKspG9sRXhF9mjbpnSiKYCdFK
Jr9W/dxUid36faFIPKQazVTuOiE0hkzVQAGpYxXjT/ITB/9EFBvgvP5L3EAhHv32x6MA1vkFSI7x
HrZ09YNFEF6T7DPTZE4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QCYfxgkUHlX1cre1q9aS3sVDIOX36YBK4ZwJXAVUwA6f1OQ77XibjpWJHt5FK9F0PcYp/j21pqzO
BRdkDcFLVAjxER4J5t5iMVhoeMk+3fpiKfYrm4WFl1ygsJsfFJP0jqO1OkjC8iFBtm3n6b7CTl1o
cjBbcBp8UgW6E8rf5inXA0dRqybnyxKJSnMFYLinvpVU6QEc4OKO7mi/i/s9p/efiP+CdQf0yDRU
Fw7o7x0D7tjBv943g5L+4wGZ2JYU+ISqn4Ajxy/bWTTJDe6T/15evhngS61MC8Xjamzc4YLZBP8o
ShfSLoeZeO+Hk5n3xzJRghM0DQ6Sj7NqXFY68w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Uy8FDDy3dZQGAnMQV0HBesEs+/oZdaq35Kj1PGhy9J/+EBZm0nhhQgYtku8tWABW2jKAC1GtNTvo
uReQyr1hteMxTbD5OIuqv86eb1hXZVENlZ7ichG8auUjkeHAkaSYNbHOuDLIhSqHEL67XbcZ9zPG
1JOY3+VONSww0KYPcQbGSo/2DaC5C0Y+mZODRfJ4+b0WXjce6UaJetilBc3VtqqmodIM2d3HDawF
R0xVJfHj86rXmUkY+SNUw60zsV6raCY6G3k/rXpei1d6zn8tCThkKG5fwiWY8zA7kRdTFIlVKP9h
fb6kfzRBRT/BgVQ8d4RgEcEVV8m3u/Mf4KIlTw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pk1GeRlkUK9lt6DVXYVdtOABlzDEWQDcBsP/p+Wo5HaglDLG5b8gk08xTP3IcJ1RKcfuARPMGO2s
/VqFbnVADV90T1rhjIuWMcBnzYQK/ALUvwv11Uju9Gn0fvPIz52l3QBnpjHI1nlsFB7WeqkzVfHZ
tg9gO9bPHjHLjVd9BzH6McrEWY5RkZ0UBy0Fmh/SownJX1b0YGE7LdwKydEMEpyvb28bwTOwfEv/
4RtsfYtEvTjo6e1ZBm66D9IQmKUu32wzTfn5bFZHdyjZg6+HcTzvHMtQX2+AggXfP6FsO2/83qkb
0bfj226fnLhr32dJxtsaJS5OR63GYtzDJ05ITA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LCfWqKmUoUSVOTKNAl5p8n1hfz7SMU2kDOUMBjsDncgSFqiu2zUy1I6GSDrVnF/2umJG5/mWcpvi
rQaFJOlrJ8DNctSuavdlopRAwTMsVi6dAlNGrAawSiDIxtI3tN3MDVdMiH5H+pJMqMt59yXneyCf
2RRSRz2sUQK/aj0lXlqKjVJzVbk8HaBQ8akBJF4iWSMK4foIzJ6iO1EupYovuW6uEiO7jQRWezlW
pbbDenOHHWbfinuX5cbkjpTKHGsEKct65q+ZXJp60m3sconSK3Y2eLQxusuJ1FHDJ4GGKO8mEzCv
3cfGdXX3pVL81OfGO/JD1aMs9H98CO5ssbHqlw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A4S1e3DHcTeWzaDVuWDRb3Yf1BjiEsR1RtAeL0BJ7J/oPWMNj96MeGsUiHtZoiYqteTZxqax2cyZ
PV0cMLoBK4Ya8CyM+BTnkFA2ablsGt5Es4TgG/nFS9VEhmeKxu8boAsqW5697aiqOATJf/LucQh5
GOnPXHAuPrDj0A/fu8N2QduqGyysWUSc1KsoJ0/0noJYvLJ2yOhFi4uIUYQfG5LOuOrca5P43pqA
iwUKW/RrFXal2acJdFeXIKffZpKanSV97urdzKyBvf9EPV/M8g9uPFJJ1z6aS+FbknhVPs0pt6eD
+J/qib4gVp/HGnRo4YlxauUMv6Yv9wxiaObY6ttDfYf5p3uzWZMlf3i7YOzZwcd4aS/6+vkD28LG
L9piBIpLx2dvQy74RdvCVdvaP1LC6RMju9RfuXJhuX4ZAmDxRi0zQyRda838ikzwYeOCSKLIvRPb
nuJ8Zx2ot8EFqSeGaaRFaEMU6Zf5SptCUuVMHvSkinBewcwrLB5uiJTJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gj+uMxV+tK4Di7pgSOE82FOBeWmUB1A7OKFOSMUW3qrmQ4/YhryfHMlWPxfAq8avQL7tnBTnRFEg
czbErdIcNzYjrM7Qq00QC/mTqmeQX4/apbqGvN+rwK4RR5oj22wfTib/UQNEQX6fbpi6PtmAeUR9
eShsfq+YWcf7z2Zw4Q+o4+E6m4/3CzU68vglNpzNsJ8S9/8XpdIrvAA/WRAX6OEOC4wlNIKDZsq/
+zMbFgSzN1rP844I/CDmxYM0NIzBWWhYBkPfJyQyigmUoXb84lDip0/Dmnq4EHvu7D/tZNnDl5st
JpftRfEpT6S8e/5MBeKUuhbfg6etHo/oFZvPKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aWTy3xv6SqKsldtLS2gY4KrTS8U+KtFNRHS314f6EYZy1MHE9t7oICJ8eNB8up8A+odoE23N3fJb
1alhaadeRWU2GjlIiK1LjZ5PQw+jb1u1GWtRiY+TcTlD75XUlqwykVBrCDfm565DmgZjZle9T3/t
WEfLo+m/8GfBe8trVnoftsk/XI00BMFXRzw8doPGDhNECS1NUrLebryb9iO5Hf4A/40dtslTARsR
nicN0KoIIyiQ+QzliqyXU/8VjS45inON8R0Kv9Qx46EXUp7bds5uQ7QycRhpLG0IPnMIweudU67w
eQmpHJzvZKBCZks/R0OafZx44H6Jib2+QazBCw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UGdPiChIPj1lSozqzCQx17Bi+8FWSuMUMzXUkDLH5zcP1t8tZLzh4CU4WAR8lmJxn8gH763fLp5c
RYU6zA0yxHzl2ksc5YRU1XEfQQT9ha8fQnz+18wVKcsa5UIOfMbGDwnS9yfX59ntG8CB0uF8bJKE
y1CS6U/1Stfs1w2mF94iDxI2n2GJlb1UPtWpmxMBI88hY0GktTPXP2Y7JKl8zRl/Lq0wIF8pHwXk
B4nOgKm6hfzPj0xZ6E/TuER/JE3fy8RSm24IlL/CUgpReEslEOYjQ4EKKZRG9/fxg26utQWW9p+G
fWVU53qrFGzBhKQ96Paj1ROkv6hDHyUb6n7uSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21184)
`pragma protect data_block
+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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
