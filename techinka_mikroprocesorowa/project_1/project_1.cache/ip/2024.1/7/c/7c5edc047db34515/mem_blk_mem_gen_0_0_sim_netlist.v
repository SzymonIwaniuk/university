// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Oct 21 11:23:00 2026
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
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
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
