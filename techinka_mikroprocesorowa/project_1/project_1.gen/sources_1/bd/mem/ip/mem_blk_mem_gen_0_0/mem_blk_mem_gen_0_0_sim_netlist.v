// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Oct 21 11:23:01 2026
// Host        : UTCALB-05 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/student/Downloads/KaczmarczykKoscianekLab1/project_1/project_1.gen/sources_1/bd/mem/ip/mem_blk_mem_gen_0_0/mem_blk_mem_gen_0_0_sim_netlist.v
// Design      : mem_blk_mem_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mem_blk_mem_gen_0_0,blk_mem_gen_v8_4_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_8,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module mem_blk_mem_gen_0_0
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
  mem_blk_mem_gen_0_0_blk_mem_gen_v8_4_8 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21232)
`pragma protect data_block
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
wTcaPYU7bwEbJSg4g9r8euRNvnGBhI5Hkj5nwA==
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
