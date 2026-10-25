// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Oct 21 10:16:48 2026
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
TEPv6nENSzfe3biQZIZqjy9p0dOAOYw0VPcdEBRjUPe64ZsKW16Ho4/fvDQdQF61hmOwkL5NzAg5
Q6tiGqEmB8ce43SFV+Usm40MXbHE07C+YUauMxRgrhea2GMteb5NJ3fU/jqmkfQohMkRPmGih9WY
p+ovBl8Dx4VmkbSmviC0jpD3uXlf26SrzgdJGaMMed133RJi4B2RvGsdbjnSXlNxU76qcVTECL/M
X7CwOScarl69uFZQYaKBLlhRxHnYA0aQRHHkXZ04gRYg/qayF7J9pHtsSz4W3/6uNP2Ev+qFJTZu
cAvjFfdXbc+/0XeA07/u0pBBqMLBKhNKIZ+wwDTUOxZDEnapYKxUCEiFMGgtuDGuOWCSZGto+mTY
G7tUj1jgVZVA482CzlTu0EC9OKSmktmpkqh4KLKIcUfdEoCOxEJp5CSbA3ozvncR6rNm0jb5Nssk
MNFzukSUS0CtjgAg0rQfbVDrjqwp5sc5pv9vSMeU3YxDD03026NLIA/tFWJnqpBqMBYnV4RSJ34L
FMV5XZ7TAYX0IdNdjzTDavdrMz+bhV1k6aHhTOfklFXsmECdF/NsT2tCcurhdpC85k2by4HAHkse
VHBjwjKP98k0oB3OeUn2euPxr+ku/LoEOUxkRoML3nx2F+DcBNyUT5zFyjQ9/HDceLQF4EJv7uLm
BtHRfZIai4sUW2OFZkT6CuT4rUtRnjGkU/3k4eW2LHbOm4RZ8mb0oIYVyiElAJmWxFM9/MUC0K//
U2xFY+mIDRrRSyYUo2jq2eNor4FFYhWkkDt2imf9DgeAxkpdKL5HC63Cbw55Tksj03VpBX6cBDQi
ZMtaVcuq5prjM7Vsu/OdnhTngfHfPlz/SugnVFJgefcZr6WGtO9Wuzy4hKPUYD9XnDXRdQWC37fj
Vj1k4PW9v9z/jIrQjx6gfcgwfGYB4Px+tIAeux51gRAMxPr5A9IPRaBk4aJR8t1pz5DidAgwMO+J
IIEPhvIQ4Eceh4A1cBae1R83jhxcm9BXsbX/cI0+n/pNauTC0y1QyOYBboADtY2tnedeiYuuyeDO
u5FN6t4DVp0uUyxu/P4P0Y0yx/2kbolsR1l0m66/Pg77k4YfIZVHwzI9w5UTtD88rqVSDAqvUkIh
Vu+n9qh2Jewo0KT5gG6uBdXK4wdY44apvBc5hHZAfTfF5mkkiWQhG1/aT0iJTt614jll870IASUl
l5kQAAXylM0OkkXxg6tpiO0s/BkHHE//Zk07X6UqELL65A18uhIYk0QZWX2CilPyz4cT9cQzSK0+
kFCZXcjach/U+yDQqffBegJ0azoj2GRE5WxO5L1c2e+/pY/b+NlWdCXlcHr4Y3INfgHpy/LyIsXy
Y2FCmc76HJKNopKeqzUTe4XyX30QqASyGQzS1bXNpqE7sVoQajh+xAu86haJmJxT/CwnWjOFD+Ml
VAqMYlmIxB7f830loN0sagfLIRtonDoeU2AzSKPtyyT5GzEiUh5AN/u8bl8idKjkYO7GSctt2dMP
1b6STWIleRgqpfiFDkr0SYEsuqG/SRLo7vFX7gZg+qLW0eG+1kKoFV3o6MTxA/QUawLjAeIBshnY
lBVw15ZesOvlefWp6M93sAq9OY+g9fkEozWbCPZCZCC41w52uwla/6ZvAVXxQ1evGBSLOQJ9wdGm
LJfOgaBuYXtPJj+N+KAq82v+Ba5sQonXjiywWLtm+y05SiP3Ezxp630uv97T7qTqjwdpbA6OHlm0
1vMY8joXtHYZXMWCjkvXoDItZWoUSbEGovnUd4W1gIjLyNo6PJqXWGEtiYmMO1Gen7tCp+FYif6B
a4ohJsfrT1JkcmE9uL+dAZsHj/lDdfxVkbwqsoUtFZ5N4nocN9nHjAfjT0YAJQzvN566GxH3Gyiy
qAii2GEYNFsMF0RjhZjzPjokA9Xt4hx4UR0EiQyG2IBn2x69L8OuulkKArzI3bYuLRIu1e5BUU0W
+t4pG/koqNevjNrfvC+dBHmOhzTbAQASsTL2/EL87PbdNbjdFQ1bAnNrry5lYJ9I6JuCRQeU1TEp
UZSE4T/UyatDrNhGj4mCyU0EEAIuphChJijkfRKhZxyHz0gAFKLzE7ZsDmNMgcOFBRkbChx8JVBG
WZDbS4UZIoqJ/6lMbAki2ulGxa35fx9JpOZSs1N480h/izeSrKHqmAckWsN/sE9ZDMmgQBt4si/Q
kXe9G/WkZAQJ7YkF5p99/e49g269KyUREh1IFK37uBEqr/uFU34bB7VAyDYLKcbcrpRLUebIHp9N
KS3LE8uNC8zCAQALKG4w0t9Z9RfOrEnDk9F95y8p6du8btVXKQAqWNt5cNKHa+dq9qCipFoC/e48
Ct/i5p2KSJpP9Ds1iynfsgb9Ok3cZp0MnNxsFg1mZUTzElE+ilrSU9qjAQxGlTOhszRoQ+bCBDPO
yXQ6S8yLySBFno2/xyIvlVB0NMPtDIZEtIGbiEq3097KT2ypKRdrvIfGY//TNueYR5rjgqSufYLt
uI/HG6Ep34B3xiBuRhbz6D2qG39VaYLi9bya2tn3z6GX5ArR7hf4Wibx3JTVWPS8KegsWURHCL7t
BRphNTpgA8V0EhCNaeiUNfQZKl5Kiu5qf/lkguouEgZX/lyEVka5HhDjgFB79LikalMhLZJrU29L
jM9sgna7HSWY0wQ+zMJCsr/SdhEKSVDUK6DJERutVKqnxuE6OO3vK/v5nRHQk78XGzjO9l6GPTVx
JBwzA9bYZQWz2tmeSMPcs+qv9erVZnqHpkoSnH3qYtiERGEvREY1eUqgGzbOa00MN/gHHe+xbSZQ
i29TEfqWLtDZfvHtHp3lWMnkRRe1nSc36Ql3J4Jg5IMLryL+ubryfh8vqOm46gfVEy+CcMCAQ0Yx
x8G69OcbJfL2tp3JumfAS6qLfUtvhvpAanglCB9k/NVLU+Ca6uYV/qvqGLs3yHPn9gCmffKB9OHU
xu4ZpRw/wiRMd5GW4wiyIImyKacijhCiu7dsm82bkPjKGZ6N/TW2PFSO5BOxQdVYFlwyr+hgw26Q
FCshw9KGtsuQvLD+ZjBgvSYRar3t0VccGoYHYl9hpccwk/pBtm5y4QQIv+ry710dzilSooIJsCxQ
R5Jzq95iThWtsVObd8bHTWXlwQXzkgoX9jMdYqPUYwxQn6XGDc7iTTgk2jvhinBwksaE7+VM4eoH
qVN3eA3pBzQ0jPf+XwQVisLszg5yinB8cF74oEz1qWvy+PiPW57F293QQqan8PALVKwL14U0hMp/
YMMa4OGXkU4uJiFmP7jDOEIj+uW2wPLjSN02nzPazGiPe+1gjbwUN0Vpc9zGbM/YeGH7dRG2RrQB
Qtwkv94QjcOexQf+vBEjrHH9t+h1s8NblFvMA3O5piRBEQTMw9RdFDC+He5S0L+qPqQ40wWsFd8P
h+TJS5Ki9PcmN5MgvXd3+IGIukmQrLLlSm9QWKmwFl6EI4BEQ0FLhrjYrNv255QStoxSA4x2vyvr
L8Ngs31MQAVRaWLqvfm13bO5DaxQpEWP8phyCVtrLM42JMExIrHlJT36nsTERQVCllcDlVoJj2o8
aSDacI+qbeBywhHCCSug3iUEb75IfRn1CRJ4hftkIH0ieG/4B8PB3c43Se73hPNzq2BB6jN28qZF
PxjPQFLgT8KnordbBX27tMwVonHYohfrc9aAwrM1/4wiYVwO8iQzy428odELwLvpCWamN4Kapp/7
lcRuqHiq/+4yOMiOyogibvxFjWF6L86zrKN8rFC1mz3DAqcbjMaQpAwomVXSFg9g5Gk7b2nHnln/
zAHGJsczt2c5ThYVdQA0zOVy7o40MYRpqr7QUXy8/L6VbMCEp1Jjzzy4PY83Ey+5MdaCK7TjBr/b
6w7AsMYWVW7rjS8EgmwAzIyVzsMcZSM6Rj8jixUUjFHBloFeom52F/0Y68LTHrdWp3J/4uFzFTcp
2bjVaRpJqibC2lZkQvfd5Xj3cOmxB9foVcrwHPMxRZDo7LAmgYqeS6V2/vLRlyT3kGY8+dm9IC5N
BKKH7fa0x5YuLV/+AotVI9R2lx5q49VTP/erHnUQCFDc5VD5QwGbF3bYhgpeZF+gnaLFBJ/oMYkh
b/DXETuvkrMoOJZGYaROA4/jOx/Wp/M/iOHJtrKwN1R8OJndy+0zx9eWlCaW7CbVw3u+LFAIUJjj
DHktXvF6CrXVvB8qMYh0FsgOLVhEvm37WUGXLdO1GhFy7iGoFw9p2ltED/OiwN3t4puQAWUZRCvq
hAO0zdW6Jq2hPYJQCtkBvA2H/sDT3pBRaE7ObXbr3QH3EUYGNNhFnODoVaorZ2JbHyZH4RErXxfG
y30c75W/plOFu6BsIC62A1RpPGeatwKL/5XBLLBHeVyvQ3pBygXWgwpWWK2if6nWVo2AFv2gZpQ/
jU3b9zpOl7s8uiXQRHEWjhGufReglxgZeIxYH+3XwblJnmoZtrJBrLu676b68UeV1/sikGp89Veb
35Af9VWo/om0S6IM6BSVYObI6klNyZGaXHI6DNesPpSSoCneoJ2WTsBnED/rklCKdo7ImGD9nrT7
Av3SeV7g9jdzM6mCqLNlJoTo2dqcCKRM6lngA/Rw0F1WNEYM1Vm9GNYYBEDbq1Uc7AfnkdvSG37Q
VHtpNH8Wu/5nBXJNHQ9IToUdVCoZUcZBXXR8LKIg8ynN3GjG9qEqvo0VxLLLaCa147iy4gM7lirV
QfIl9X7lXKO0jZc7SHGjsAv/TwikTKdikfDYO+sf4ev2SmKuoyZbhOEf7/oCSKM/KWY18Th9blN8
MmJmUZYqNtebNu/I6hzbaP2o5ycfjW0ViDzYhNE6WrEZFz7BQddDJjsNx7HkbPfABghgTHPbzI2Y
V6HyU3Kg3hKnYxasYGurviFYnYsl8T9Bmk/466F/+ykR5G8iQhMBxmaLVsfH4k2RbUGMQYXD2aAT
EqHo3FgShBMnAv4s6ForW/B7rrOfucQG9/3Oa8ooHq4Znx6pSG8MxN5gvsieTimvnzxmH6qpZDLp
YTCqrmZowDOleZbQQ3K1/VkvyqgxVYve1EDmlMEJ/0NZ6kubBIB5vWLD8Cu6NNgXqxAhWUPfwfS4
VrAMc6eoq1UlhsxQyNWqJIsOOkVMhBu9K3vYuMMz+6ZXESkZeCFHG1hYxAg3B51gnmh/MV0b1Gc8
ex6ZTvWs/xzMX1U+0hfSpXR0bBHx08+3k1BAZzopprXHsF8fSmqhcKUYQjdhY5seQASQINcW8PFM
WI2qY8z453F0+b+BnfvbRcbQoRmNfBzEPmhEWt9M1tYQ2sj0rIJEP5795XZ+dsbaWBakF3rlQoOB
e50dS7WTjI805nzm2faeBwqIL3uWLOkvalm4h4H17eQ8gqARJem1Fx+rQ4VMZjzefOdggZMzLulc
ZXzhn3l8rOxkFsuTyOzTxDKfIepRvr1L7hJ0gN+b/JQn8z5JidKBfx7bh8B0RdjRizYSZ1pFMkP2
s6euwXszu2o5wwp0eqrrgRvPVrVfqzSeIv7WR7w7ELv2D3ARWOp2kAz43b+QZ4pkYhOJks8U+o6u
J+E8qtEcGTvaf3NqUOz8/uhuatefEcMbs4FLkbJ0/7JyU6OHlmz8cQzHeoWa3UwR9aHHF/LkB9Tb
leyeSFTZmbYMxQpqKr3iRWBHIS9xkW9gfcHJsnVJBcuHtfPU9WpKgkQ2FgwCnICK98GhmNxQ/YEh
RfpH5ZSOae2dwqJHh2HW3JYdCKaYa1J006qQNw6qqzxhqH9GLcfnHvKkSrIu74D8eN7RWfMu2jHT
gNqQx0lVzh30Jhlt0tTHGbfbGI108zo3+cRFra20FTHHXUXDaGNkXsoZol/Bq79z5DB3hivfvK8c
gcJo04rHQRfZMjcR/F/pAzD7WoX/BnlCKQwnn5jujTB8y5umCxOFGz+jsM07pNV6GfxPm7LUE3gn
VjS3vKmoWkSgssx0EDm0BFGIH1nnVuKJr9yOWoLUewo0OlUbn13aTR3cltp4PT4Y3DcbVebtFCmU
bcyDQpXn9ifop59ku80lLLpp3q8ap7uepNyEC3p1JjBjnewQTJ7V3I+s0SsAAP0uok8/5vXjnrpr
IckcCZlT8qQl0zF7twPpXnJwMdO5Cu7tZ2xsTBAoST8gSaiLwoJi2sMgCX1DWYEDmfg9pVsro/4b
o7RbeMUbOyWRjDwJUshYUCjUPigWGOC82ArsfVNo5aGAKKs5cfF1kK7NlW1vdZSs4ap4ayiLUgBG
Ezg5ggxRUVyOYXq+ojnt/ntwUeYLdjSZXee7kd9LHPsI8g7qwm6yuHmgecOsCMJv6ennGl7X/EVp
TGy9n17/aKAMGtNx115ReT5q5Wv6ku4+AuVc53eM/bxdc9Hn1GUavt2dlG50NHIT7BbD8Y5XDabh
59AliKuD6aEaIrC5/smSm0SKSc1HVVFbcgjvQdO2FVthQhcZRZZDSiITD8pUdjonqelkv0l4dSei
wxcRXVCo7Vq/ydv2JQypvx5FmKwtQs0oOVaFdE5XLnVRLb/uimcdY2/JKQtxNkukgCvh70ws5Vsz
ePBGhzJKrJh/vDW4JggOJXNmQMeueES+tZ6dWEgw+pg9VB6AqgIHxNJe0H+anXjjmSeR/xuFIQHK
kjtSBT9xEGiY695G4T6yrSq3dcD9fhXSPJD38HpsGrRK3iOpG2HkTJ+CpvM8v3J1feLH1gbOtcGO
oK2jHb46tAidardzR+3MXMVBr9x3XNhHdTH6W3w12utvPrA4Pt0h2/A4hNMLkNJ2Kdk1Lb04tuAW
2zyyldnnfODupYtlc//ypMYUvFJMEIKqQAUm87GVdI6prOZAYPXTkckayAHcNc9vW88Wv3iOx0s5
t43oeNJrJRfkew5JEOPy9+HkXV5KzQ1amX730iRkkyE0bpcsqjIGGdfQ7RDp4T09FbY/dWNiHnwq
qEuPf34Ac3f5Ct/DVgm/ZwHhjs55c5meyiGp/u6rAP/Ry0b8scpZt46eMyiFZDW3rJrIvZiJ22jf
NA5wq7fiBApoc5BjtxM+TT3tzvwED5hafILMRKSIdKkDLnU3QGH7zHeQi86WHEc6jBSuE8MoUtAI
9dGbZduFILHDnmcp3e2BbzV86j5NFn/P5uCvpW+tyfBUncCmUoayzOzUYKgrI0dY5yEAD248DxZk
X58DHeaQp0/TPG/BiEbf62/I7IdubDz6LSuJ8MCtrF7siG/sabw7SYSmvIZRVteVpJuqYOH60l/J
n9s+7Vyk/QvA8BMt5SLG2eiE+8buX8KJd3nWaNcehJfWVFdRravFcQNpTJ2fwtUv9y2WQmSQVG6B
9uW8B4LIG1jUnvUuL+2RFFE0BZEJpEegKEaTRTfekw6TknijMxs5tIAqiE1VygeM8ZvtxgsA9d1o
ctls7dPENd2DQ852sDPDjqUIku7+GWGAG8GaHWTj2VIHxOR+iFIKgRT/ozLpn7P2jIk2/nUlYG5T
mtOnI8/iE26v6FHbxTWPZvaxg4HEUxLO4cIOwfR8+TLyLSvQkXsoQbe20jHMJjHv0YBPC/ZLk3Bj
pFdvup59N9+U+cZtyd/m7IxYV4NxhKs4f00wtBx6PU0j9esSsDAjK7jaR0T7MGeerpz6W+z6Aq0h
TJGhuKw0rn8muItpBBBbg4T7bMXwBeFm0aie/FBK+c/wOL2WYATemKG27boKRqUSjoQBCsYd4da/
VCBQB98R8n1ijnWciZS3YP0KzxO2MuqEbhKUlV8susGzQ4GE2AzJA+kEcSBW0IabVpKf7Isj/kIt
o7+u0Yqpy40kbFQIQj+JijnRR9ZL8l7Lxygg/y823C9Uqk9E4qPM9U2rmHKitfOfQB54YVTchIBH
Vw0Pt/NGLcW0GBIoUbK7flp667JKO+uwtT6/LubeujrS4WfSg5DfZOTy8f7LDA7ABXPbkhugIBTd
OaguwIDqKVy2qpdkwWIAdn6sW1D2s0AtOElm5tdpBnHdUf2jjw1zCmLJ7ReBimaRzXeeuZZcMGaD
UfYMLAucceuq9TcUMXgT12XlBZFmEqHPw83bbz/UNYGT96D8vKQY6i8z/ntkmg38LTbewzQrYKME
3ymTcyYyDNtnz6bcTDB+AiUXx1xItGH3BL+ZVLs7ro6TyEZV2hx0o05RC6kNDjzt7Rd0q+Jp7YbM
8AiPrNRU+IZwroHO8v63fHAvKr/MLSUETeJ1Nfb6oIUX4ln4GNab/Lc2iFQP0EGEXspiZV5M2rmg
j4EWMqLGYpDvZIS281317PQxgUsjOP3XveRw84DgOHIUm952NVyqTbGb1KxC7YZzqHlrQ4phRbDJ
jgD+AztsVXauJPjG1xxdc+XobDLsxcYrvkL98ZWQQsqEscb3oytfES2Oi3VYPRHoEOrtNmgyObLu
pNgVpflRF4x1efF302cYxcidB0Krr1nnadkYwaqM/a7/e1abRFGXpnYRcG1DoghT6Lzhua6pu/lb
kHqULsVcfRokbIwblI7HQciTvmfabgiVzeA61lTw1mHJpss8XApX5vEYuEw/O3HqYucLMeSL0i01
JCF2I1baqg/kXMWtfnYwk6uY5m8ecXkmvVtRL3Rc6bJxIPxIdMdxUkvQfUPmRbXLDpDQnu2YmwrC
tkr2a1Q8L/WhLS/DbQ69X+8y+WloBxccqubqMOsmz3/roe3tlwz1s/b3T35j2+WtQeeNg5RGMgP2
73d67q3WWY91TwgSssAJ7lZfztYdeVFbuk6DDq8ooHenTAHw5FLDzEl0eLi697jbSfzV8M5k4q4Y
8Qf61vmTgV6z0hzcV4fWA1qKbeOlnh0U/fZgEvru2NcehUM680eueetCCEfjg5D1HjK5B178MfGl
p9LkDymObtTdQyet+CjuyuNfRIDUOn72IUyNxLD6/WCdrAWbqZh/s155R6+XBRj+u5+s7acpt2+w
0Ptx1Ujm2vZj7IjwQkTs6HbJ8pFx/YB8f/c4XNcFpzRGWEKW7exnkJuVh/FAmQxbPwETIUQPNEfm
d+3ivBoa7/a+rsIGBIffQgdNXQjOXivnkpii7L5CIQmlHE/yg3g/cqjn0PHwegbUz7Cy0KLda/yD
uCMuCynNp0Y+JMz+QoM42KN2Fxz+XKymhZKweqbnVcjjiWo2LBugSnGjx/2SQo06+H/FmJG+FY9X
AgRXEZs75VzRoUMeiuYjCyq0Wyoaa78L35SdWltrvGtWjqRuiokz3XCIcSWoiYzJL3sW7AwkRMUH
u1pY90w8YZ2L/l/bkroyBrb9d+fYba70jCdynHaFiWjejF2Df5PP0GWnQyKTT9YaG99j/bUEA1CO
pd5ZiXBIfilxfCEj60rDNA13t5PoX52+5ZEge3gpCWmeimGjoUnVJtlQ3oNoOd2+kouSBcBXCt/c
Y0H3OOs7iAEGGG3//gSf2RQWdNRLvV+dFoD842nVJqYRMxjIgpsO6KOzR6LStyKJOUDVbpOd9PdQ
O8AWrg9patW3wxzWhVP6c2J0fndK9YJWuZ8tK5nSMqUaxbh4xJ3f2ic2JOipIZGxWKQf/nBMhufE
MXGPe4SFUwSm3di16aeh/3ioYbglmv3v4IZA6P3pqVu9F8jR1/YSUjo25fk2ly56LM1wyOU7g74D
JA6luu/yXrBLoYEju65P74CtYVnF8laFY0HSTr0I/JITi1KeSxQNPh9eel8NZH+EayiGTMCzdrCp
tgxwyhjs/6oI7w8W7LaUZw9KSo+vT7Gp+pFUjIc9tS6D5HNsIulvRr70q9dNAz9ToFdN0oUOw+71
9o81+OHUlzTw6WewKsKVk3zRkpnOj3uRPfxh4sSYoRYnZKkhW8K4mUwxH9WKil7Eh8XmD4Cagh9c
rc4aqlr9NMEZ+xUoCTAc/J1/+ffGBiTPQin0Js1z+Sa0twZDi1H9xtWTep3wSvPca3XNTvsxFmtQ
hOGREvYw9TKZvqmk4h6eHiDNWyXHSOuyhPMSRoBDaPZh21UqWShHIj/E13uZdJAv5JagkPxfyp0S
jSDPZq5uTXrGnvwQm2oZWu/U/b3Zjc9cUuN4vHBLWMj+UgzNceARd6k9hqklZERYhLnYll+N/xP1
8Hw65YfNISOWXu/QifzO5H5aLpvJIIDJ9JFHYqsx+Rfhj0l+clXIf0dcqgcmSV2W7rQ70uYVBOVK
uB+fZwVWN4cKNDmb37CBFFNSYq/MJU08GvTZIJLFHZCvDw3kw0BMsh9bmvodjueGnnIKlJeocwBA
ULFCv7j0BRL+eHHjD1zFY/q8/a+36MIEvxU5IXV3xgot0ALluuzQAJ0fofWic6Qpl+hHLdytih6S
XP8xuAEWltU824Yc5e3ejj8RYFzrCQqOu9xF2Pmzt+reRqmQnwmCTvpw0GYy3lusmBMSCXuTeKpG
XxvUe2FQEwrSe9W7/qNnyoNvjDsiYVyg9zRMz9VrWnzWOPdCcD+Tve526KtloiIXKYkR3MQ96wu5
hMmsHL7J5Lhv3GRDgBLh4VnRWNvvJXEnchYmeUqgnpsyMJcRXxiebja3xW1KC1mRIG9g6EuyWwEv
920S/4Lnt5dHaa6GME2bGGGdo62YSuLrAKFRhbtqDqdn0CDU4TtGBnVkcBpHgqAUSr0+VQ0YnGMQ
fPW1bm0zHYG9Ii1onrgZZbN07o9Bl9IUptksjkTQexu3Cz8S7eiKaRcZMlVfqhhSYqS9mff02gWk
NRGdhfNZ2Tq4L6k3j+CsExc3kJEC1kcgRgizIG6Cq4hhMt84Zeaj4zj97DpupKeZ3mWXmMzLbiwa
Qp5Y3GlZ01B9x0tgRu1qilWzKk+Hw2HDIP+szurdx/0jI8p3rA8i2qhTscYji9nvBF9LHtOTdLnS
H331/aPShtD0WJ8OEu70J4pLu9r0Ubapv/S05Ex+P9Xfw5EHEo62LAkB3IGxI7RvxxxTZlvbozZG
HOgo+YthXKfMFoxdjcD25LnkglYDCZ7sk7TDMEuUsVOxvUdgWFe/x47XqJz2ie+UMUPOxg7MwEB/
WMKVP7dH3iES+R/s5f79zF7kNRlzFJmGyVVSi2m1TG/ERRoZsHQ06wQe/r/7tjRFAdsU2jyNE5Nt
GEzb4RHnCxspYJ7E+6AaNpPKMrGouhUXZDg497L4KL0mRMmeR5V7QlAQVF6GtCxiFuBkKmNNA9pB
OWDbPBwHOpO48MZWzPA2SfXOq5KgGxhq9cCZGNNJFWJxeiJ5cMMnpsyNZUU3Wk5cRtgpjE0UQ0fO
MS8yNUVdyD5U0gUD6ddrxy+SpcrHTxtSnyxOKNhNqXFbjSfE55OHbbjZR4RPq+q+4YXIuaTH0Oee
66falxITpNYC9J4kYx2zWvf1nUERWjp3DAnjUevi37GenP0GiN6VBJuwzxcpew5Ac0ouFupXN6x+
n38V7c7z/eatV0wPPEO2jTIEXYWh4cO/bJvFEWNhcpHVbOfjoOlOzr6y1zWcuKQXyJvFRCc+bcXV
f4AqLiofhWjfuZQyKU3vV/Ptl9Ee1XDb0iVmOnOrUNAz7hLWDMvpsQT4No/Hb9JRiiBdJA2jQJ7D
S+jovhvUX2yVg8nNkILJtN05LtAoHcbq443fPqLANWmnX23i9OuRhw2K38M9GmsHRrEG60X4pvCH
0FnvmdqSfOxm1q6y3cqE81QCcJc0ocVvuqXZxUccQBqBZA6Ku/RWX51/WOgbtM9CkFsDLW9bjO+T
Zz8iF4Lo09m3rpYS8v53qsN1Dhsw/j7KsEN2+9NPMN6FfNc4zbbH07TWaO12JBOeTlok8f1mLqBB
q1kYeZ2PR4rCFngSHIz7eHmBnRASBkAfPnZizKOKabJBAKJbz5zIZF265PoBB7SGPBs27mf1sosx
DNqeLBonSPZU1EHbPdvY9+oMPgncuEaCwmpr8lquXXQj/IvvcYUkIV3IDWvw4m7Pcib6Y/drJzw5
tWVaW+m39LhyB7FZJPyxuzgSgvOmig1M+egg1Q8YBPLpVZMqNSmGrP1cyRNdqtX60BVBcrkc8mV2
3ug0tjmYXg88mVOBRwAGMQh7ZxRA1DBK/XjO0QQV2dConwAWfT28QUUexajCbjOdtepAat+QVY18
4iGbNv07B3Eovsz6LeHQV97MmlAD+e/4jeizVTxa4Ht2EiNiwGb/33XVKO8/5Dd9+D/TtsMDPhFP
Njt/CkNycPI4tbRExFoxojDlV9FZiTqxIzyqIRLUvQxi00ExNk4qG8hUqFM69jYH6gUHixFfdfh7
xDtavroz8LsObXbgkqqFeU5hcdfH3RuZMNvpSw0K/YHjHzINCHxSV5ERgFgUOakWkiF/qgr0R2YR
RREzd3sl/LIjyX4cvYTrfmpOxIhK/hnXiCUs8rqsIORNHGBs403YdeKNC7O/epukQgLHgtI4d42x
0AxakWQq6hUeprKmt2s8JRUxuCA35S6r++sfzKSOK9gQ9iLXQB8op8iwwIx1i45UqSJoXNSQrA6/
FfyjF7g5l4SjU1mffun3ijhdnDm4lFs4+42+VMhmiaFjRv0bspXaBsedxSB/TyL6O6wJSVzqUL6x
XVhx7ZFJ6QHRctkGRHtV3957aT2vp5IvLETdXbsX4aBSYp4j0CvYZwt6p9NBWAcMWyEWtU/MM3FU
yLACssSQ4YWMl352q0EeTk3fhZFPvffXQ/m4oL0Sfkbmbx2lALkxrccZNlqioZUwplOo2gJeiTsz
JiVmzquFp5DUgqYDeagcFSVlaqfB9of2oEbd8LmJKPyhNdTKqz8ZxpWvH6ooKQPbO2J8u9VmA6wq
iBcb+ln00XoEEp+7R7XuJU1a7sgUi4chCw9prVfPAlo56QPQd2UnB1rkH9VL1FsBfI9yUKRDhA+D
XUuMH1trYtmn1jfVUgdoLIReY4qLeICeBUhXxVd6YM1cShVLlBASy+QdFeoh9fjp0tq27i9q8C2B
SU5Mde/qYFljh0k/VpLQHC+G/gBX956jC29UMO7q6mscNf2xcUP8LlaGXEUOg/8HAVXPg+uGLXs6
TMset7ldqpGnqcdOpJ3Yr7as7QaQMCd6pLWzb+hx0o9qmQv5LiiD4X/tP1nbTaWj1gye9lGPNmjL
AB4yOE97xf6FOmsmk97+2vgjxVuLVlVgYmSmOM6dmqDzS1peJa1JHUWL5Xvt5+45+IxyjtEAmrzv
ejZKEa36Ilhqg5NVo2fpdCzGfNxaB30oj6EPI7S/Kj+7qr062C6CQAbjsMDjoS4EAfpV/lWhH3wm
5Vhscy26A2r21dMlXOrDmEWN8ptAgchuKrknrD8N3NQR2mi3/wsqPdwWe9okKVRE1353aiNShMzs
w6aw0JYwIA0ZnDvKLyFPyYdPfGErp/N6M3x6Aa6YtwrbYbSOa5BAZxhHDdZ75jMQ9WNrFCyDftnN
4L98QKfK9Ck0o+HlyCwUXeTDzt/jDZFYvGcjHl5N6jxl6IXBjRUzOhKfrD5qHxIEoPaHA7GMKHSp
ky2XZXNNeDW6irYg7yO3uQqigqNYNTD2VTG1Xyv61YA8tT+B+hoMEiUaZjQwMYUp+ntrEaycd5Wy
v6c16s0Mfhi8MR7qCQvwvpZfHk4oiqp9zZ4eBqzXdJSNKurSzTYix//uEjB661CXluSeC2JmM8+x
NiscicNXbA/4pzu5n0ofuMF4tI889tNn+aictpy2o39KB3zIJJcGV9oX0PgeDXfmp0sNuV9Ca/6j
UgXsfdrdRB0V9DCNFojZmzqT3aWFxrJrEu7DoMWIgkmag0XGU8vjPnmiC2srgFdyelp8W+PSE2WF
0x50b5y5eLSbIs2fAhM8nOrlOuIGvqxF5JP+hWh2egTo/3suXnM4lryc8JsFOuq0NbEu5KDLVf6K
yrYEclXUBzvtlO8JCnRIDkLuK/+0K9MO+Isayt/ZStygZGkIKiB7FCNNmN3SZfQ97PqsKYmcC1Bw
9fVjoKRIe1QX6mQCKUuPKy5IBfMBFuMppPgscHAc2RKdERt7iRpOhpYDVdWyJejvnq6426/YBLdg
MaiAKKHpZEneAtrcjuIXCB5ma5ut0xjvFHY9Qjf3WK9wFdpvhryWumdrtT1zfrDGQILgSteBtKOI
8LeG/h+zI6Fgdq/AzCVKkHz8A+GKmYcZPjZ7OGdi3eR6a+kX8cvkal8PdFqOxSLPBv9f5G3WmOUb
4sufHs9M4pqm4+iG43qZp4l3Mr+RtP5ChiSMDq5qhI2VsWtAQ/NGueLnElfGtgXzRT7zuyfT3xhI
K3OQOIp+br3vyEMDOLJX6Se872fHhEM8lpXcTZgxEnyfR+4TFx2R+drq73koZvcij0FROtw5yBrK
oe5noHSV3Q3FsmHB8xvBJQwQNZeKhJwBRb5vq82ISmK4rP1tOSTzobgezMo5CGuC01bBsmKCRIhD
WFFV7QcNCDZBy46ozS8scQ9k8awTSiD9us/KaM/crvAzGNUeVeECg+1Mm3a6Uc58CswiyhAbG9fw
w/w/B2i4v32ea8zXjbolpSb+X7v+XcSaKEuxZ7ozKckszLmGQrKwWMlZRcM/G4OpwSmt2Pq8AH6M
2gSH2JNdbreZuNr88VepsrXYmUtuRlv5spFVwp/R7j3VreswKE1GUxBfjD49ouxsAeziX8hXXWMn
IgCcykN3D8Ny+SRM9QnmIpnI7xuqQv8vSAWatgrOBAzN9LC7UtvbsC7Wryo5z1OUllxceBJbTxXk
JLGBC6tLtGOMX9fdP+LGzZsCGRNAgDoLkQTMpaAf6GrYwPMSLZYhnW3KMc3FQbyTPgPsBz2IClLU
A+yQvCuIHzrUYrpXuLPZCvoRkUOgExedVG2XsrnDyLAtcBKpifWio3OIUb1D9GLeOoU8mvucIAHB
/wd1Xsnru2du4pmfK07l0gso41jYb2UyqzBotRl1pAAU0Vv8/CukmCNKpduCX8AjcrmFtT8m6mm0
F662qK2gY0uGJ2Vjy+oMuSlSoPIe0PGzRrcgzX5sUAf3iTHW5WkWj8zg0lq19nVASO2ScEf6sA56
KOZK/Q5zJD/LGZg23kJ0L1u0Tc0u125VhAkCSGnM5dxVibj8w11Tm+KGlU4Tv4BogHg8D4K0jxG0
PFIxmOELlMW3nc3QSZ/BwrFJi2+Mkz7fREVUaTSw1ZisCSfrsEInsbXr7DFYvLMpEFx1DndhIZ1q
0kkV+NRxwOmgGuYrFiHKVf9sNYVtXFvHk34JjBa+hOapMQJZdEurszfNydWs3aGC91wWq07dy5Yq
URqLu/QlnYJGYQ/74H+lJUQqGDbbwIk3T2hedH43l8ySrFD/6P7K6ViAAnGJ5IdTeDOmrXDQ/GC+
CrXR9C8d/jyjh588zuHu7JrpZWdf4lOf9shX+Naqjgjlq+oNrRNsTv7oyK3wPretkHQlk9twose0
O2j1CUCcvWmUWaED5Gr8wf+4khuAfIoqILKAl8nroGsQyRr7/GcbT2a+b4fXozV1w91AN4AO0ixd
mX68RiIwOip9GALR3kts8ufoIOUIsP1GomzJ7GR/etLIsn4hxr67yns0H4FNPvW7cpEh1kaFIaCL
FvD2litNlWamgfvhgzknBc+L/FAYA6dVHKmmwl4FGDyGhYOVUZe3BUq6l6bcH9z5eRQy8iILMKHi
BWgHG7O7sNXQq08IByYtNIa2E6EPVxTKTIPIDMydkCp3Ub7ktko+YCI5uWIzLQ9PQji2Ws3brShi
InrUAf1JjvWxcq3xdq7bm2J3AjEoIocqhPWkyAvzekX+JuWP6lMsC2GpEPbyJ/jv7vOin/XWnJSS
nMEQ0nS/PMEX/6Pzpzuo6yUQrBmknVuES+xlmwgUSk4XendkOJss813SL9diQSv9tVUgqtfbSRBH
YqymMoDDozGCUOmFZ6AYeQygM6Z6n/TYz2vALMPcgBU5X5l+niyIfFnLxbQ0noRjXFFTgnRjGWGv
UyLbWAeBZWRPXjG+LJImGWe2LpXdEM+Dzex2Hdhc5NFA9wAzZwOndUzOpZk+TLw5v+0p5rhbS+fx
HqV3P15lc+qW4w3yDMJCwCMbm/8zpaN7AJHGucU5bREcq04UqsvvqdxZQhebeidrU1E4ed+HHwDP
6R60Z14U3Q2TZ/56ge+Pma+My2d/dOdm+3dGYMPFqG9kTASbhIMPkmb+Bqt06+EbrovW7YlbN/2D
0KiiYJOyZo/P5gHKWrao5ss+TZXmB2P2Y9UA9k5D9CV5x2ZilUB6YDaEzXYlZvFMb/JXUP2jB8Nl
mlKk6w70k7Dw8e5nQyk0ZB3A1pBPMEckvqUvNln3ybv21suhAuJjBEXVfPiGLLvH3ftO3kQiQ+YF
KqsTOEZfipl4y5VWr3EAK/t528CH0/oWaQ2PV2/veRu9G83gpRf81q6MghKxwhwMv2xmiNk/CU38
c4jr+D83xJSULNXWkT2wKuEuFNgeRswLYLoJupmemi7vCkI3CxcaUC+eMaEF4xtL+p8vDqCf7Vjr
uJEqPOUV1G4oou42Du22pdHW/SIaPmDEOmkQpH6EYnHNKa+mKQNRT+tSagnj46C6Cv1ZYoeXmIF5
JT92oQIOMO0qZMyq5d4Krwgq2pU5DVx6EI1UhXkmJIdr3lfO3WCosKkig2pArAgn7CZLXCEZ/cDJ
k604IbBejTYsogfn6oEJGXlx8HvwcReZcQgMaSE+f7/mMMhUzN2FLHUygV9F4j1BW4yX6X2DFq2J
FCRnart6V8Q6MOr7gVDpDhs5sCzNPqCOkfIjeXBhntcA6Dq9HiER/r/JyfSNCqhRShKRa9HnkxjM
CWqVD0BmtniHo+FpRic3+dqNKBRk21y5rHC3rlxjllpVSRtXDpOpFMzrlYd6HYyv38XuEKyR9qVq
sAVXUrOSisOZ46iRp05dLuGB5TWdfKuuerpUcuLDZVIyCxhSeCyA0cSS60y5H+BKmgGOP0uq4J13
rdo/M4+wHJj3hbYcIrC8ChmWvYqBRYNT7gBUmIU5S3am5GN243xYpQ8DebYKVOWmeLcoO5PNnC7K
quDvmQ7LEl9XzA5xRms4g+XAdxXSnWO5ALTz89oLbznTCJXSME2miVB4P+ad1/qGRssqxKjYJcP3
uKvBgidYhU1O2Rdupp5iW6rxwRyb0Q/sznouBJ1Md8C3MK8NqpLo8RqpsYC9pfpEgm+jhWpGbIp3
bBh31p3lqirVmSlwF0l7MtiD5Ro/FmxXzl5m/UbHKUvNNAE3k0u40Ks8XMk2BRzU05ozpK3ow01Z
yMIxuR0EuAQDS3cB1iTf5mIUem4FAIw29RApECz0pJvkw1ZWIyTDNYms/rkYp6We2EYHw+JW5Vmi
xSTMtM/VHtWbicKk06rl2vCISBQG/fFl7PFwEv+Gn4qT7O5lb8Ft0+x3ddtKq24f8isTuCuLIdkv
yu9PjN1aaYFK4xjlsLqsmQ2TLhAoBTMZqcqpAp5oTzkOnlQX9sWxp75PWlgmUmtMZiRX7TXbIHLb
OP3WKB0bljvi7+XSn+dG+T8LzVOMshNzSYsmh1NIxDp7eXYoFxWyJ9x0RCe5pa35J60alGnhhScy
yWr2kDq3dVx3/AMU1aCqRXJt0eVjY+xxEnA8m5xIzpe+4hHFUP1V8/Nqlop8FrmBc+z/MCE/RGxA
XUwJXiy9ELeBd6Jk9qWUhk/4N/v9rC5fpa9OL5/pGdY5W29AafuyPsESZ15X9SSmnvYg5QHx/ROM
e9VsSisWJOMuc/BqTPZZgW5Q9/c3H9hKfI8sMy72mnQ8CZL42NwU4F1kIfpJxB8tDXl3L2FH0C94
TTcS52WsS9Gjak9iWnlg4eUAMwn2blwP5Y2rEeqaeCwEcOWufCCi00wru1Z70fTpy1EStlo9Ge1I
eyzG8crO2tenDAbwOUyxhPlZoCTWOqBbwSP8PJxYQhqv/RaAvau91k6WtM001P/sph7OQbRpH1Yv
HcFoUgad/AdZ3IXDzGwOdvWSUH5Th5xZ/0QBP7fODMhvLaCKSDvJuhUiwywyIDyXWHyDYjrzoGLI
/uOs0TcVcB1npyXsI957f4DCvxB2uGVO05JuaaKYQXDmzc7TQMJ7JlnCQHEzjNxnQ0DX+oR8cyCD
1asvjkr7iy+u+PeD2d3UpfUTVBqrC3cxdfNjd8LJsr4pUHL3d5+bTi1HgZJXqhixRHxYxOfXCZ0z
0tA6Ol5WaGjdwtlfxX5ImyXCYr6sgIECtngucAAAnfI8KIUJPk0VQK6daURqBemkFUUfP1DwRW18
JM9ET/hYQQ5fikAKA+Qghl/QbasXbO7RURhTWwtexWHIMV34fKYxDLVOzomdEEKLXtxC9dXahw1W
wZcl6PdinBfbZ5G+LdN2OqZRKv8xMegVXJA0HsnFMbCMLHHw1xUiBRgCW49Mz7HR+qZQdWgyGPxK
RrKvQ5sKHafhIEOXOdZQ+3zjABHEpT+SN+i0fkGIgMFl9CoHlGMYNILFUuA1npixJHurS5XrtuJc
S5Rgnvt2Jzj6gbrk5dUcsD3xx1MNLjTKdm4QxBmJra4s+X7te729BoLuQZLS8xaDKjLMSgboU/LC
igjCiId4KIr+USEJoHA801KeB4BU1qNV5oYwH3ORu7ebTpRjDHFFCEzyxtSFTHG5BJtfOGrI00sK
Gs3cjRf0Olx/5mp4p23akYFiNnNJYxmsEI33DbX6wIXUCzV9kVaDo4FkqbA4ZW8h4MuW1TUgW+4o
ih7yjmcQBxPPX7e7zpzKm9+cUfNHQMbGjkiK+vgqT7vajYwhWFcifFdmEC9k679BxlirTlk88tgX
gArlX/8N4fMqXZs1ILoADPdpsnMy80ScIVqHhF2kTLQ+Pneipt3vOD7k1BDxot7p2Jc9cPImJpVn
DFRR/HvB2csespfbvh8NPko5NAyUpYHVGDi3VgRGPRQ0Et+t3eBToCEsSRjpBQK541eBLvknzI60
8YC/Tvgobmxe9sXtEPciHC45NG4Ikfqrm1ZeUag25pnY3T0DG+X7l6syzdGmHBdpr0pPBi+DBT2d
B0xz8Ruyqz4v1aE/kwVe8FdoFtJEGpERzKG1F1T3wy2nNQpTGij78+d98QeeoUHV2WyEU86zFB3u
mPaH9M1QYD9fe5L9u3jylqBILnJ3kMzobrEQr8tnr/TVqu/0qrw0/P5Cc3UWtnBz0BuV5dJFm2yl
+MdBBninEhTm6sMmxN3x8+Wjdp60fGkTIH3ToPrMEhpYZR0WmZZ+3M/zBnP/dW3sBVLIOOlhvxa5
jLRgORKpl6w8ElgoiMMCe+dAO7IEVgZNplnUsbrVA4NMevw73TYUEZdcrIx65V/SoCKEy39s1Mx9
BWfyrx8DirsX96OgIVCcyZdEaOeLS/DM2tQHsH1QEbEPnUNg6mwsTuOVC9KRMGOmEosgV5svipfq
FPqSIFC8IUM6LxisSNGTz+dEvH/FB6G0pNHYqnH78xA0WfieMvUBvves2sYfKRfzKZ0TdLpjDIO+
EUza7Mu0nTZDo9kVwMP+7tMcRCEFxf+xR/eSMV0mWPVEB6PKv+YrUJC5zYC/iQdcLyR96ZhB3qZR
eml5VJ50O4AKglTkQ1OxJzz3JrjMjgTp7raq4LAejgGMvKKpIUh2puGZ0rFePu5qjRZ+r3GygYvh
10cE0WrUL1P7rwVQ0cqqMGGhcy8MDot0fCxbdZ863ppDvZxQzkZ+6DhO/rifE6Xydck8qwozHflk
smO8NQJupp/N+3bkhPUCEk5IkMGKCcpjQPzarFtu0yLj3i+nBzermWg/0rdT6jG3OVBM3TKoIzHW
wTavIhwoLR8TH5TTivsZmarabsfmKZ7DxtXcwIhGfLJIdf7Qwpeoxcg90jPKzKk6g1a4T+T6BJmE
y5h3S8MOael1vTSbQ8FSGV/tRruc5nBW9mduXo3mnAupVYcWq9BpMhnRFL+dx6V5sdo8n5eVt9+j
OjVg4XbYIja878uTc4FTatAtmjvbThlOMrg2RqUMKvAaYjiCrYmXmYsDBe+vLlpV4tFuFME3lAsC
7VjM0RR4Pe2OlMCZRL3Fe8taZCZeMc4KQo0M3emFAVjcY2No/PTn/9cD2Iu0iGttwdD0hr0j8WXD
wuMa3Xj2+xvSj7UBwu7uQbbT5lRQZ02aBS3JbIlGE2rV0xfPThSsSRH7gmVYdht4wXw+xvu0F3+n
icuPrDgaepEVN8qRo6DTLg8O2ga+w5Cwzyq+owrXZYsEUhSxwJk91QPRcYnvexRy25KjLc77CzjI
Q4tH1oGNXXOCP2xm8SRZcdriLpfeIaovYSDr6W5eb20rPYd3CXN79MCvrUeeyfkwBDjH6VoNlaVt
XW3lMwSYoPaa0ubbSG1wXl/C7stJyaKUB2gz6aofV6pYzBtElTTn7aIJND1u47Y1RVSHJ0ptQmo7
xn5qicMkRvgT/G75RrlGO5JGPi2h543NJILkG3zr6TcRVzKo/Q77gNSW2p0aIBTevC2I6qnAH3JD
UR/qqzXGiGr1p2SLtm1+gQokX8fF0qxFeZnZUe8kob4BbrzzRJodBO7Zd1eQ4u/e3G9sEKivaMmc
1E8Wx9WRj1x+Q4YW/RVEI8KnFrP3W6OCV/guUSIt7FccPgeR7isXz3ZzmC0hFmudWNjN6QymZQx7
bIpF31px0stZyuVcdVUZMtXhy6tq5slNtOi72IN/f7NzBcNJVtiaOYtw1SAoKVfs4jlZr9roBR0e
Ilq+577TQEh8ju7mfYzcTQ2GC9AFORh1TwRhr54fQlCSOXX8AG/GoCAE/Mu+Pvl5gyJiH0K/AGJx
VcDj/3xk0U1kYQ0LOBhLfRhqNJLbuZDts5EiSpdxRdE1g8xfjf6wjHLdlXkLSq2Qxaw+x5oAfdZj
dQPrZWt5vMJd2W0xDgfMOWOpEsgcfETE2H94R+iz+xleGjtYs2gJixS3jMLnbgcVfzdz8suaeq3d
Cc5Gmc/gTyX67hywf6RQ8TzeS7QAeHWMTt0YRHgDDjvOECOXfdPcFmq5aGziRLZw6mT9hTjnVU2S
0FYN5N26u3oHnoVsFk+aq+MOAtvA4Nudr7LDOvN35afwQ+poRVBjwx7xIkXvTsDCBb6sZfAkYEOE
QapqQ4GOs0Q6VVstsNuc5Fb2YBg6KeEhge2UjAe6KNMk7Ap/aCTYfR6DNyBrbLKxMpG1lyMNRA8v
o2vOKBm9dTEvYHl9tCVhL8RqNb0UdloOaQvspJFgBH7Uc0YFQjlpUUVPtYZ7bnoVHTRFLKBIwupW
51WgCmC5ISX9Lea5lvGHT2/gUkLKQwS4hoJ5W2fApKfuNjyZ99rC4VxdtNhVyjQumtwsa6rE4/zc
HdzRmdMlzBv35ymJGWUDFAjbJ8kk9nGvNopeU5h7En6gL2v3EVERnXRp7urtX5XDslcXTA8hafpm
/M0n7l4PSW2CfiXRqUP4f53ZXZruGIDZ+fmSkOVTV0F5pc66bov/sxUpi/bgR1m36mBKKuCqgkzU
Y54rKFNjDIRMnlf4hf5GiPhTBl/lgQFpSk6XKWB4FmP9nBJW2dNLxzbqcQOOaTecSXnz7NounLji
IO0jv2RlWYj5hZGR+/gExSZJ/dofS2eIZwF3krZ5GtzHUfYzO2ywWuHzgO3BnDvdLKaIuSkBT5Kl
q2eRPdky/PfwsrXJMiskfkiKF5HoLNqmvsRMtxd9x17IrbxQnEg4rmsrgaeCZu2sObVs5PievI0K
WnnpIg8mlzDmwn1jQr0r4dyQzFTSHnUcAti/tKWtYJZAeMHWbQcLlfX7j5a2tPvVIlAPmEy2eF/l
6r2m2b5XO9PJl+Cy/l537borgs0kfh4MH1HDn24L9j1KyAum100mZPYs6UeWTRgvMCQ6+Xbewbu2
w9QVb1rhQgc7uCjFOkqvLRE/+3H+cu4l9uELi9hG9n99UlNUbBwZNfO3h+3+aTuM5+OG0LZIZIA8
GYuST+nyGuYOqu/LYbDUIurdAyD4X4w69V436Q/9a/v3H8rF3sRlkEzfc2o/orzwfP/LRiHMi5ir
OliMg0dsl6RbWVFx+R7srlCmQ7M4Ds+3Od1gNKM1pp1nKZNlL0SX4NRCc38Otq51RabJbFlBcxxP
Sh+SMsdq6GE9wEGahHaZCHhAGFe99H/M2r4p+qCbpti798mmkLrky7XVxfnhnSFYLyBglded4KJk
pSB9i9LjmLMBTdvzpFa9V3n8Fv9GEdDL7uO6LH0xBiiHZyT5RW9ETazcP23e7PCmOzKHb0MxkJdA
6p9kJJwZTtG7Qkv8XZWaDMCsPTp05BpocDm51EjBCdcjsbA+l+kUce9OOQrnA+If+mUPJzP9hlMw
habwyuTKMh3cj5mUz+fRugA38o2Y3i6CkaW3gjstmguNwh4C0FFnfO2ekk4F9FkyrjlAohrhdPR3
iBJFPveJR3cglGuxblNk6h+ajaagsFpdP9QpU+eKoxZdF3WoAtD7Nok6i67hZbRIXuDPM0zPAYbk
jxpjcCLTYDcX3zJJGmBA927WK7lP18v9y3+WyDBoDMep0JDHn/eGag7VLWTXDNsVcwIf5UU8UlZ/
8z8aXkMNcdUn8QrA9Y98SPHZCrB/vYurGD8bS5cgvNS3xGDec4KEXjTObBxNK4Mj/XiT0sOaZAiQ
RPmqhHjwO3tNg2HyFI6nlSTP+60qU+hjNgXGlwd8a0KESCGiOQVtDO3GzHI2MOqQ6ofNMiyO3+Fq
WP3Vg7I2JJgigtem+ZTJtl/1skRYlbHdhI5b6JCpSDT9xAkHBTQp4ZzwUVJd8dzQnjUbhHSnEAJT
aIGrtj29ntBh6M+FuoU8XODgvsRqcw5mu6WCiKjVGAtm5KcKrdgAbg+iE13cDxAD8B105ZKcKx1G
Kj2WtVrqdUOQ2dnh1ilpWwsa6MhLvhA+joUE72wchDtgxW5SQk1jzbpZL1otR71NpXxuDlbShjq6
Q9wTTaahDNqayxGxUiTOqBW6In9nGouyDscgc/S8s/gT5qhb89EtWjuo6C/oDJYPX3zhor6ychkf
LULbQfjTQRMDF2xhI5C6ltXZwb7kRus3BhxLNgLdHZK/vDhpfXVmOgUBawR6BpFRBOc2bYPXKsie
fAIbNcZFXHCfdTJewZHO9T3pVggieELqSrGZC8RfczwrN/b+jRr8pgHj9s4FdKUH9YyFDX5ntEjH
bwWIULs9azZTS6AiVVroirf8n94jjS+0ywDy/AJqL+JLA0Ry+SSZyAbIyM6ufGtGkmmRQ/BhYKbd
u1CDr4MfXGby2cUWX/Gya7xJtHK02qtX5JqW2iNq2T0AL2yCs40IWqzwVqVrao9zybXQNpI9Nmk/
1sOdOfrdKXZjaMoLj4fXRkR6KrvCjTtjMxk2+eWe31NMaZA1Jb7gzm9bMQM7ui2gLb63WNpm9UWB
N8WQ2Zp0BuAhSvTeMkVIPv7Wb9lry9x0bKt36YNTMrNK0TL6KKayNBr9NYIcn4pfxn9nEvYmsVVZ
9ju0zOMhmQ32hJvaG5Tmxtk1JNX0Y1iFu1jQ3ZzvYIFDil4+80f9sCB/BzAkcXG9ge/oVXG4T7ex
BCCQUzsw9sgeYc8rjQM9Q5+HqowgKf3SCt+BTKiBVCElKH5cHsLXVDRchKOHHuEE12oUzIbIXmyE
odY5Vl2PZ4oTANgfc9ulJcjYdla4Q1DrMo6qPkInc513ZfahmBT8yDjz2V5BA018yvbERUwtOWji
AfovWUfNTBSCPyZNJDHxR2Ns2pifky10N01Vy4tqDa1kTxLnv6xGPNCII9P/mcfDfMi1fV6LdsqX
0DE41zIh2K4U9k2A2n3hi2SrP5il4Wwq9xIKHyfMw6PGJdZAoJuaPCExfgsRUJq1Y2zgV7tLs4Td
X77erkpf49dVvVn/TGznaIENQD/fKJjZIhcCHmteYs7ehNr2AaxL0VkTt1EcKn44MC+oXaH62Y7L
daT2h1n4loR4Yrci9754iJo0C5yuzRGiewMU7cLUymtPbBPa7Dj5mfec2IXPRt+7m7pQrhUBIpeT
Da480Fxi20p8ZadtqMIxNsUvjy0Vqanc1NPoXWUICA5RvPKj/jIDxVproBgBXBlZq4eSmCEhNGhF
PT+WAUxv1KUgulkeNsV4mfU22xXo2SXXxvjEl7oyUvWMH3dvsGfTvwx/ZfghTMCN42EYcdQHapqo
Ysj9EQ24ij1LTwFuJJ/J5Ne1XKTfE2i4DxA0KUMGAfcFmbBUlH35FdEqtcuhSE7DjuU55qLUlnlG
XPGf/OauyGr7izHYPVwPdGWLV6K9kVLBtWd4vQxQ4bDL2mbZF83VIrJW0VptnsW8k+XPCD5bxRhv
4K6kYPEG34djls1TeOl7uSlZ7o7ZvPhCFmlFr3mHD8DqsnMJfZGhW1DzlW82fvvomLFvSPdDrTjs
km3Up0l9qUGZuSx190jDB0ncAz5qjrOvFnHPgqGUy9da7wmAZdNjn9kQCBOfNHCNdFumUx9ayEls
8U7Gut7EHNIWZgnOt01QYOw7YFEUy2I3Bwhko/KzaSUfWCzuEUyxlBjxg8RJPktqVrhxAJL0FCCl
qt9tvouZATnPP00nsU8ALV/wMwZkcDCRn0sapepM7bm9QK7kD6Y91FML5dvi+pnRwENSBYC+HlH0
VyRAsy5ASijZ9sE/cKhVkCpBn/NlUK6l+SgP/W1HSHsZ+Qa65rO+AOp03hf9zrzp5D4WH/2HeNKq
Zqvlz3fgcQ/GdiUrxEwTv4slx84uFEJL4Ua25+L2aFZoM7zuQB80F2fbIMD0dl53oGLlsdVkdY/Z
e2DIpZ+CCuDNXZzxJsVccl6+pevwTjNKi+4s1a6UpEoEBfmhC3QZ7YSxoRcR7LtpeAKbvM1dF5Fr
L7Mu0fcswVJQuEku5krh4kfZmVb22S82TY8itdDKtfu+jySK0KUc2/Du7rwprMGbka/oy/OMLXMs
CMiM+FNYdInKREN8xtNkXXph+zbKiY1FHOOMAnsaP/D2QTyn1o5yFoSLQMFjOQAiU+mz9Y9YGnf7
JtQWYLyit6/0JmqgS/sIVUeRorN6faAqB21NQzx5tSLa1OaqpvVOfNpUy+pQA4wmXnMAaDi9Ujsr
EE5yEBprqWBXxhip/CpCfTdzBPwXASuDtzyb1yYXnDP9+7ti2HAqG9sY7xmu2eOV6OK1Smaa1uuD
wdlga4+5KUW/mincCcKw/GlPZfL1JYNU5zlVXJ7T/3lf4t2lhuRVWraRXII7oqgzojeI4WgWu00K
vs3oSYBcNHJrpa2Z6bodoyp0/Rbt3mbox8IgBLSh/+gWi4O8LsoPv6K8DWH6ASreZcmVo0IsSo5X
EiVm8iDekoRIonNTEyD+nTqAVj8TMEqOoN8NkXIwylgEFJ4h7hPKl/pNXjhWvFcRrwTO/MRQ3/iM
+kyNW3h+747Y/tS0I2BNVnSWJxcUrQemNa8gmreCpn8eXLsEzFYpDU1KhIzSNgNk7xkLSLqtQGk6
rlu7ZBeCfFpdZ5q+1PL3oegl7lEQVkjYYU2yOcxjZhzvHLCPbRXAtWPz5m7nzylKWG2Twlt00XSF
da18j/HsgVI4VnEEIKo5Y2e/uOWGw2e5R7dT1AEjtQTDVh/YREnTXRTdgQYnjjbJC65X+JQ5SqgO
/090+rsJmCYhuoLSx1h1+fs/Fl3UT2QsdyCMXMxYZ8PFoRDI9UYWf5bDL16gYz6tyocUXqCaOl4d
uUYJRbUICU62cLRcsQ1SjOJucWGkYDBCWvAQDcwt4plxfEg+0H1NSBvvm9abavl91L0BfuaziHrf
05oSAruj0e31+eF8owmHtQoLZSInV0Mz6bXhX2R0D4hVTWmlfdsXJHRjYSc/Xv91nHWSD8nij/8C
RjflU/jQoMCiwRercKy6YmTailjVIDn5j2G/cE4nWWo+cbh6FFucRfKEPtkXL20xY03ngtt0ppyu
bWEobiZWfWLmEsW83FECPvMSQ+kXlPlt7j+zad2zsUbvqEjPUyNzh7wMxm910K56GVKxeL5IrZJY
Yb0kqezOW7Ts+QYB3sdfZ1MspapOfyCUt/N0nx9b64Sku6u7slz95t2F0YFk+N7HztupsR3jucP9
41B+U9zR2ZuB7kqoAT8IQo+0C0NM5+tnfL9qwHrHhxZoVx+sMDRg8ziScwU2sN7Vcsb1y7SPZkxl
b2Lux0AA5KErel39faeJgoxujWMckMvhKcal6pIMjoAiXJRfEpNuKlMXCJhjRIzeoH93IGi+AdS/
ba9xzNpkL0Lxf7BjG5eFnZ4+BDgP4acS5HoxiA2sIvrNA3wjLSFvuSqFqCEk/NRwt5sjTKl1JF38
BHsqAAU98Bhg45BrQKvX83S0g1tXlfABEP9sCxULZRTW76tnRykrQyBmAU4ZAhMaFrwlFtbO7gKb
YJ9DAL8J7BpFRWJDA+vm6kHjZSvL3TF1+p7lmcYTK+6TX2kYofS47Fidz61bfHvJh6YtUwk/FuRP
bO2aAvmZiyXhzIkgrIwVP2UEwQDCRWooH5Fi/UpJX9F4p5D2Vg5VJKCxqAgbX8+xuWPkvJOcgQzm
kqSetNYD0N0Fm7VwV+yKcbC+ZqM7EQznlo1gMcQKgdOMT9HHQfE2PK9WeEvD9nGOi91WPW/uTdev
6pkkEgw146fgc0dkzoBdEcKXObeNpb4P17lssRS7Sf6zeQvyhqBbqIMR9k2WgJIT+ba2K1zjAlII
lHIdIeph95rr59w/vVFJv2WDpsIbKZBhVJ4QLKr7+yz0RcSuL9Cwo9mpvRdrF9U8RL/N/2d8o6Ql
eBcARoS9ww7OgyTLPbVcrwljy9bJlcqp+6KWQKhx8hMc4GblCxY0JmDclLlrFzyOYGxIOyrbvdXj
poBx5NwBFAc9JRXCwXNx5cwK45FKkUcqdzK2Rz0PLfoykjY2kF3qHcP4SXnnMOYhpo3+9jVspp+o
XaxwPGjUy66wQj0rhReOROT88afbSsjLG8kZmE8DNXnqFeind43NeeuBo+GsiwAeIO/VKDZJMIKc
7rb+J+KoftuB+Irx14dZ800qwQ5i0og0PF7idYdRTpgTnkb6btPZEPxHuIlmQSOW2XSJ+90omfLk
57lM9G3sZieiAZLbAlz2FVR6NMni3MpB7bAkoJpawABZBOmO+jeTDi3kXukH6PIJUFY/iaKQRO1c
Ugx/LXKFG6WXJymukQhydLjpaKHpd8Tyh7DN6HVRTqzrxwZkuYm/R9EY7zJUdpjzf6qQ/Qs2pzYq
jrtt1YAIrAC0zEL92V4WoAR0uMA3vCRLAMtXWK5rvz7Sz0ZnQFEKxu1yxc7mAC85VZD0I57+5rZt
JXarT/C/tl4OLRtXhivMlXZ74actGCZlGTbOR61HIdr3njU69Q2PjuZU3MjuBV5nUVuNBOLamMES
yVVSwr2/6KBjcgrhB+cergAfrk7D22iMu/KIMG6Lcp5V1wQnAfNdkmKJgO54tA7SvPNgj320Lq/1
tdDAmYvj8rfaifuDdUXi+0IXTAQveLoMMG55sgU5q6tScHt063cqTu6u+ut/G/SuyLHBAfWUuqUs
09BaknJi4SFdlNIx2xO93DYCYd1QKAPv/1Jg7g0XKDrzAkL7KbZZmRFvzzfEKLBVPigOFD7J7wte
nN/7q/6GwO/neAatrq095xdrfAhlNb18QRBNTjgo4vbN7oe25BdD5yzGqY/16XTOc4P7lOvYKcBG
18/urNg07nW2BApAy+I29L0KDNH8U2oW9I/EO319WMzlTdl07/vm09ZkRLyn3wIRAwmqrYeIZJTQ
/3e24VwVvAIEl/G7Eq7ce1Fw+9932aQCXkV2SC0woIGN0R7p2Vyaa9GlISAdTnaliqEZSJ2NeiUr
+9A3xNgAtGZQTagzS+QsSk13W8F61fnXNRSPxL33Z0lr8MT1PBsX/2f+zycMhdVWNDP5HT/Ta2uI
lWLMm+QhEgYgIgckvfRwc4nVnqJSksC8nUvt6PWPzojiwi31yKngZNnk0ghhR/jYulQlp5AIeNtl
PYDg7E83rZZa2jXBvd4LtO2SIvTzOn0OlMZSH98dHMS1zYbbWzWmra9sJ7338mVk3/9kx63yw410
ZFu2/TwtPsli0tR9w2l0l3gkpDs9GQQ8MI1Xh7P9lCXRKUXFozm/SW8JdWOa1wWVrLBZmoNNHG0x
HRLJxFazGneKxQr65On4NjZ5xN9UY8j93k5FjrKAW3jqfpe59fLPCC0n6i01HazU1/YDllEcO+vg
nN5XnnRseojq4oHKUthw5BExHSBVxGLgrIUDj0LsZDb6WnA4Nj+F8ktUpPxD5hNg4pPMplIve2OF
n6cgxRVb1s54CjrCjG+Uh3hR5R54F4SnW2PMVlfHJnC6D0Q7MuORqHse37L2OuYDIex3RKlSS7Hm
r44cgbwyArnJu5mXDTJnwJSQkfAM1WvGxC6QrZh3HCAVxu+1lDgZhbpRn5Hr8CwolKRziugidxva
idUhUmQ3DPTbtrgGgKk8ONm8kxHcYSy5viXbkY+uM45ylSLJyw==
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
