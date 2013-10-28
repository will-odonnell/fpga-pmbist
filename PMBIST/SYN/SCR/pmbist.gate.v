
module instruction_register ( clk, rst, updwn_in, op_in, pol_in, no_in, 
        data_in, w_in, admd_in, te_in, hold_in, updwn_out, op_out, pol_out, 
        no_out, data_out, w_out, admd_out, te_out );
  input [0:0] updwn_in;
  input [15:0] op_in;
  input [3:0] pol_in;
  input [1:0] no_in;
  input [7:0] data_in;
  input [0:0] w_in;
  input [3:0] admd_in;
  input [0:0] te_in;
  output [0:0] updwn_out;
  output [15:0] op_out;
  output [3:0] pol_out;
  output [1:0] no_out;
  output [7:0] data_out;
  output [0:0] w_out;
  output [3:0] admd_out;
  output [0:0] te_out;
  input clk, rst, hold_in;
  wire   n37, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n38, n39, n75;
  assign te_out[0] = 1'b0;

  DFFHQX1 \w_out_reg[0]  ( .D(n35), .CK(clk), .Q(w_out[0]) );
  DFFHQX1 \admd_out_reg[3]  ( .D(n36), .CK(clk), .Q(admd_out[3]) );
  DFFHQX1 \admd_out_reg[2]  ( .D(n38), .CK(clk), .Q(admd_out[2]) );
  DFFHQX1 \admd_out_reg[1]  ( .D(n39), .CK(clk), .Q(admd_out[1]) );
  DFFHQX1 \admd_out_reg[0]  ( .D(n75), .CK(clk), .Q(admd_out[0]) );
  DFFHQX1 \data_out_reg[7]  ( .D(n27), .CK(clk), .Q(data_out[7]) );
  DFFHQX1 \data_out_reg[6]  ( .D(n28), .CK(clk), .Q(data_out[6]) );
  DFFHQX1 \data_out_reg[5]  ( .D(n29), .CK(clk), .Q(data_out[5]) );
  DFFHQX1 \data_out_reg[4]  ( .D(n30), .CK(clk), .Q(data_out[4]) );
  DFFHQX1 \data_out_reg[3]  ( .D(n31), .CK(clk), .Q(data_out[3]) );
  DFFHQX1 \data_out_reg[2]  ( .D(n32), .CK(clk), .Q(data_out[2]) );
  DFFHQX1 \data_out_reg[1]  ( .D(n33), .CK(clk), .Q(data_out[1]) );
  DFFHQX1 \no_out_reg[1]  ( .D(n25), .CK(clk), .Q(no_out[1]) );
  DFFHQX1 \no_out_reg[0]  ( .D(n26), .CK(clk), .Q(no_out[0]) );
  DFFHQX1 \op_out_reg[11]  ( .D(n9), .CK(clk), .Q(op_out[11]) );
  DFFHQX1 \op_out_reg[10]  ( .D(n10), .CK(clk), .Q(op_out[10]) );
  DFFHQX1 \op_out_reg[9]  ( .D(n11), .CK(clk), .Q(op_out[9]) );
  DFFHQX1 \op_out_reg[8]  ( .D(n12), .CK(clk), .Q(op_out[8]) );
  DFFHQX1 \op_out_reg[3]  ( .D(n17), .CK(clk), .Q(op_out[3]) );
  DFFHQX1 \op_out_reg[2]  ( .D(n18), .CK(clk), .Q(op_out[2]) );
  DFFHQX1 \op_out_reg[1]  ( .D(n19), .CK(clk), .Q(op_out[1]) );
  DFFHQX1 \op_out_reg[0]  ( .D(n20), .CK(clk), .Q(op_out[0]) );
  DFFHQX1 \pol_out_reg[2]  ( .D(n22), .CK(clk), .Q(pol_out[2]) );
  DFFHQX1 \pol_out_reg[0]  ( .D(n24), .CK(clk), .Q(pol_out[0]) );
  DFFHQX1 \op_out_reg[15]  ( .D(n5), .CK(clk), .Q(op_out[15]) );
  DFFHQX1 \op_out_reg[14]  ( .D(n6), .CK(clk), .Q(op_out[14]) );
  DFFHQX1 \op_out_reg[13]  ( .D(n7), .CK(clk), .Q(op_out[13]) );
  DFFHQX1 \op_out_reg[12]  ( .D(n8), .CK(clk), .Q(op_out[12]) );
  DFFHQX1 \op_out_reg[7]  ( .D(n13), .CK(clk), .Q(op_out[7]) );
  DFFHQX1 \op_out_reg[6]  ( .D(n14), .CK(clk), .Q(op_out[6]) );
  DFFHQX1 \op_out_reg[5]  ( .D(n15), .CK(clk), .Q(op_out[5]) );
  DFFHQX1 \op_out_reg[4]  ( .D(n16), .CK(clk), .Q(op_out[4]) );
  DFFHQX1 \pol_out_reg[3]  ( .D(n21), .CK(clk), .Q(pol_out[3]) );
  DFFHQX1 \pol_out_reg[1]  ( .D(n23), .CK(clk), .Q(pol_out[1]) );
  DFFHQX1 \data_out_reg[0]  ( .D(n34), .CK(clk), .Q(data_out[0]) );
  DFFHQX1 \updwn_out_reg[0]  ( .D(n4), .CK(clk), .Q(updwn_out[0]) );
  NOR2X1 U3 ( .A(rst), .B(hold_in), .Y(n1) );
  OR2X2 U4 ( .A(rst), .B(n1), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n3) );
  INVX1 U6 ( .A(n37), .Y(n75) );
  AOI22X1 U7 ( .A0(admd_in[0]), .A1(n1), .B0(admd_out[0]), .B1(n3), .Y(n37) );
  INVX1 U8 ( .A(n40), .Y(n39) );
  AOI22X1 U9 ( .A0(admd_in[1]), .A1(n1), .B0(admd_out[1]), .B1(n3), .Y(n40) );
  INVX1 U10 ( .A(n41), .Y(n38) );
  AOI22X1 U11 ( .A0(admd_in[2]), .A1(n1), .B0(admd_out[2]), .B1(n3), .Y(n41)
         );
  INVX1 U12 ( .A(n42), .Y(n36) );
  AOI22X1 U13 ( .A0(admd_in[3]), .A1(n1), .B0(admd_out[3]), .B1(n3), .Y(n42)
         );
  INVX1 U14 ( .A(n43), .Y(n35) );
  AOI22X1 U15 ( .A0(w_in[0]), .A1(n1), .B0(w_out[0]), .B1(n3), .Y(n43) );
  INVX1 U16 ( .A(n44), .Y(n34) );
  AOI22X1 U17 ( .A0(data_in[0]), .A1(n1), .B0(data_out[0]), .B1(n3), .Y(n44)
         );
  INVX1 U18 ( .A(n45), .Y(n33) );
  AOI22X1 U19 ( .A0(data_in[1]), .A1(n1), .B0(data_out[1]), .B1(n3), .Y(n45)
         );
  INVX1 U20 ( .A(n46), .Y(n32) );
  AOI22X1 U21 ( .A0(data_in[2]), .A1(n1), .B0(data_out[2]), .B1(n3), .Y(n46)
         );
  INVX1 U22 ( .A(n47), .Y(n31) );
  AOI22X1 U23 ( .A0(data_in[3]), .A1(n1), .B0(data_out[3]), .B1(n3), .Y(n47)
         );
  INVX1 U24 ( .A(n48), .Y(n30) );
  AOI22X1 U25 ( .A0(data_in[4]), .A1(n1), .B0(data_out[4]), .B1(n3), .Y(n48)
         );
  INVX1 U26 ( .A(n49), .Y(n29) );
  AOI22X1 U27 ( .A0(data_in[5]), .A1(n1), .B0(data_out[5]), .B1(n3), .Y(n49)
         );
  INVX1 U28 ( .A(n50), .Y(n28) );
  AOI22X1 U29 ( .A0(data_in[6]), .A1(n1), .B0(data_out[6]), .B1(n3), .Y(n50)
         );
  INVX1 U30 ( .A(n51), .Y(n27) );
  AOI22X1 U31 ( .A0(data_in[7]), .A1(n1), .B0(data_out[7]), .B1(n3), .Y(n51)
         );
  INVX1 U32 ( .A(n52), .Y(n26) );
  AOI22X1 U33 ( .A0(no_in[0]), .A1(n1), .B0(no_out[0]), .B1(n3), .Y(n52) );
  INVX1 U34 ( .A(n53), .Y(n25) );
  AOI22X1 U35 ( .A0(no_in[1]), .A1(n1), .B0(no_out[1]), .B1(n3), .Y(n53) );
  INVX1 U36 ( .A(n54), .Y(n24) );
  AOI22X1 U37 ( .A0(pol_in[0]), .A1(n1), .B0(pol_out[0]), .B1(n3), .Y(n54) );
  INVX1 U38 ( .A(n55), .Y(n23) );
  AOI22X1 U39 ( .A0(pol_in[1]), .A1(n1), .B0(pol_out[1]), .B1(n3), .Y(n55) );
  INVX1 U40 ( .A(n56), .Y(n22) );
  AOI22X1 U41 ( .A0(pol_in[2]), .A1(n1), .B0(pol_out[2]), .B1(n3), .Y(n56) );
  INVX1 U42 ( .A(n57), .Y(n21) );
  AOI22X1 U43 ( .A0(pol_in[3]), .A1(n1), .B0(pol_out[3]), .B1(n3), .Y(n57) );
  INVX1 U44 ( .A(n58), .Y(n20) );
  AOI22X1 U45 ( .A0(op_in[0]), .A1(n1), .B0(op_out[0]), .B1(n3), .Y(n58) );
  INVX1 U46 ( .A(n59), .Y(n19) );
  AOI22X1 U47 ( .A0(op_in[1]), .A1(n1), .B0(op_out[1]), .B1(n3), .Y(n59) );
  INVX1 U48 ( .A(n60), .Y(n18) );
  AOI22X1 U49 ( .A0(op_in[2]), .A1(n1), .B0(op_out[2]), .B1(n3), .Y(n60) );
  INVX1 U50 ( .A(n61), .Y(n17) );
  AOI22X1 U51 ( .A0(op_in[3]), .A1(n1), .B0(op_out[3]), .B1(n3), .Y(n61) );
  INVX1 U52 ( .A(n62), .Y(n16) );
  AOI22X1 U53 ( .A0(op_in[4]), .A1(n1), .B0(op_out[4]), .B1(n3), .Y(n62) );
  INVX1 U54 ( .A(n63), .Y(n15) );
  AOI22X1 U55 ( .A0(op_in[5]), .A1(n1), .B0(op_out[5]), .B1(n3), .Y(n63) );
  INVX1 U56 ( .A(n64), .Y(n14) );
  AOI22X1 U57 ( .A0(op_in[6]), .A1(n1), .B0(op_out[6]), .B1(n3), .Y(n64) );
  INVX1 U58 ( .A(n65), .Y(n13) );
  AOI22X1 U59 ( .A0(op_in[7]), .A1(n1), .B0(op_out[7]), .B1(n3), .Y(n65) );
  INVX1 U60 ( .A(n66), .Y(n12) );
  AOI22X1 U61 ( .A0(op_in[8]), .A1(n1), .B0(op_out[8]), .B1(n3), .Y(n66) );
  INVX1 U62 ( .A(n67), .Y(n11) );
  AOI22X1 U63 ( .A0(op_in[9]), .A1(n1), .B0(op_out[9]), .B1(n3), .Y(n67) );
  INVX1 U64 ( .A(n68), .Y(n10) );
  AOI22X1 U65 ( .A0(op_in[10]), .A1(n1), .B0(op_out[10]), .B1(n3), .Y(n68) );
  INVX1 U66 ( .A(n69), .Y(n9) );
  AOI22X1 U67 ( .A0(op_in[11]), .A1(n1), .B0(op_out[11]), .B1(n3), .Y(n69) );
  INVX1 U68 ( .A(n70), .Y(n8) );
  AOI22X1 U69 ( .A0(op_in[12]), .A1(n1), .B0(op_out[12]), .B1(n3), .Y(n70) );
  INVX1 U70 ( .A(n71), .Y(n7) );
  AOI22X1 U71 ( .A0(op_in[13]), .A1(n1), .B0(op_out[13]), .B1(n3), .Y(n71) );
  INVX1 U72 ( .A(n72), .Y(n6) );
  AOI22X1 U73 ( .A0(op_in[14]), .A1(n1), .B0(op_out[14]), .B1(n3), .Y(n72) );
  INVX1 U74 ( .A(n73), .Y(n5) );
  AOI22X1 U75 ( .A0(op_in[15]), .A1(n1), .B0(op_out[15]), .B1(n3), .Y(n73) );
  INVX1 U76 ( .A(n74), .Y(n4) );
  AOI22X1 U77 ( .A0(updwn_in[0]), .A1(n1), .B0(updwn_out[0]), .B1(n3), .Y(n74)
         );
endmodule


module control_mux ( op_in, pol_in, cyc_cnt_in, op_out, pol_out );
  input [15:0] op_in;
  input [3:0] pol_in;
  input [1:0] cyc_cnt_in;
  output [3:0] op_out;
  output [0:0] pol_out;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n1;

  NAND2X1 U1 ( .A(n2), .B(n3), .Y(pol_out[0]) );
  NOR2X1 U2 ( .A(n1), .B(cyc_cnt_in[1]), .Y(n6) );
  NOR2X1 U3 ( .A(cyc_cnt_in[0]), .B(cyc_cnt_in[1]), .Y(n7) );
  AND2X2 U4 ( .A(cyc_cnt_in[1]), .B(cyc_cnt_in[0]), .Y(n4) );
  AND2X2 U5 ( .A(cyc_cnt_in[1]), .B(n1), .Y(n5) );
  INVX1 U6 ( .A(cyc_cnt_in[0]), .Y(n1) );
  NAND2X1 U7 ( .A(n14), .B(n15), .Y(op_out[0]) );
  AOI22X1 U8 ( .A0(op_in[4]), .A1(n6), .B0(op_in[0]), .B1(n7), .Y(n14) );
  AOI22X1 U9 ( .A0(op_in[12]), .A1(n4), .B0(op_in[8]), .B1(n5), .Y(n15) );
  NAND2X1 U10 ( .A(n12), .B(n13), .Y(op_out[1]) );
  AOI22X1 U11 ( .A0(op_in[5]), .A1(n6), .B0(op_in[1]), .B1(n7), .Y(n12) );
  AOI22X1 U12 ( .A0(op_in[13]), .A1(n4), .B0(op_in[9]), .B1(n5), .Y(n13) );
  NAND2X1 U13 ( .A(n10), .B(n11), .Y(op_out[2]) );
  AOI22X1 U14 ( .A0(op_in[6]), .A1(n6), .B0(op_in[2]), .B1(n7), .Y(n10) );
  AOI22X1 U15 ( .A0(op_in[14]), .A1(n4), .B0(op_in[10]), .B1(n5), .Y(n11) );
  NAND2X1 U16 ( .A(n8), .B(n9), .Y(op_out[3]) );
  AOI22X1 U17 ( .A0(op_in[7]), .A1(n6), .B0(op_in[3]), .B1(n7), .Y(n8) );
  AOI22X1 U18 ( .A0(op_in[15]), .A1(n4), .B0(op_in[11]), .B1(n5), .Y(n9) );
  AOI22X1 U19 ( .A0(pol_in[1]), .A1(n6), .B0(pol_in[0]), .B1(n7), .Y(n2) );
  AOI22X1 U20 ( .A0(pol_in[3]), .A1(n4), .B0(pol_in[2]), .B1(n5), .Y(n3) );
endmodule


module cycle_counter ( clk, r_in, cyc_cnt_out );
  output [1:0] cyc_cnt_out;
  input clk, r_in;
  wire   N5, N6, n2, n1;

  DFFHQX1 \cyc_cnt_out_reg[1]  ( .D(N6), .CK(clk), .Q(cyc_cnt_out[1]) );
  DFFHQX1 \cyc_cnt_out_reg[0]  ( .D(N5), .CK(clk), .Q(cyc_cnt_out[0]) );
  NOR2X1 U3 ( .A(cyc_cnt_out[0]), .B(r_in), .Y(N5) );
  AOI2BB2X1 U4 ( .B0(n1), .B1(n2), .A0N(cyc_cnt_out[0]), .A1N(cyc_cnt_out[1]), 
        .Y(N6) );
  INVX1 U5 ( .A(N5), .Y(n1) );
  OR2X2 U6 ( .A(r_in), .B(cyc_cnt_out[1]), .Y(n2) );
endmodule


module comparator ( no, cyc_cnt_in, cmp_out );
  input [1:0] no;
  input [1:0] cyc_cnt_in;
  output cmp_out;
  wire   N0, n1, n2;
  assign cmp_out = N0;

  NOR2X1 U1 ( .A(n1), .B(n2), .Y(N0) );
  XOR2X1 U2 ( .A(no[1]), .B(cyc_cnt_in[1]), .Y(n1) );
  XOR2X1 U3 ( .A(no[0]), .B(cyc_cnt_in[0]), .Y(n2) );
endmodule


module flipflop_1 ( clk, rst, d_in, q_out );
  input clk, rst, d_in;
  output q_out;
  wire   n2;

  DFFTRX1 q_out_reg ( .D(d_in), .RN(n2), .CK(clk), .Q(q_out) );
  INVX1 U3 ( .A(rst), .Y(n2) );
endmodule


module cycle_controller ( clk, rst, op_in, pol_in, no_in, ts_in, op_out, 
        pol_out, cc_cmp_out, cc_cmpff_out );
  input [15:0] op_in;
  input [3:0] pol_in;
  input [1:0] no_in;
  output [3:0] op_out;
  output [0:0] pol_out;
  input clk, rst, ts_in;
  output cc_cmp_out, cc_cmpff_out;
  wire   cc_r;
  wire   [1:0] cc_cnt;

  control_mux ctrl_mux ( .op_in(op_in), .pol_in(pol_in), .cyc_cnt_in(cc_cnt), 
        .op_out(op_out), .pol_out(pol_out[0]) );
  cycle_counter cyc_cntr ( .clk(clk), .r_in(cc_r), .cyc_cnt_out(cc_cnt) );
  comparator cmpr ( .no(no_in), .cyc_cnt_in(cc_cnt), .cmp_out(cc_cmp_out) );
  flipflop_1 cmpr_ff ( .clk(clk), .rst(rst), .d_in(cc_cmp_out), .q_out(
        cc_cmpff_out) );
  OR2X2 U1 ( .A(cc_cmpff_out), .B(ts_in), .Y(cc_r) );
endmodule


module address_counter_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module address_counter ( clk, rst, hold_in, updwn_in, s_in, r_in, tas_out );
  output [7:0] tas_out;
  input clk, rst, hold_in, updwn_in, s_in, r_in;
  wire   N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N22, N23, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n1, n27,
         n28, n29, n30, n31, n32, n33, n34;

  address_counter_DW01_inc_0 add_59 ( .A(tas_out), .SUM({N15, N14, N13, N12, 
        N11, N10, N9, N8}) );
  DFFHQX1 \tas_out_reg[7]  ( .D(n22), .CK(clk), .Q(tas_out[7]) );
  DFFHQX1 \tas_out_reg[4]  ( .D(n25), .CK(clk), .Q(tas_out[4]) );
  DFFHQX1 \tas_out_reg[6]  ( .D(n23), .CK(clk), .Q(tas_out[6]) );
  DFFHQX1 \tas_out_reg[1]  ( .D(n21), .CK(clk), .Q(tas_out[1]) );
  DFFHQX1 \tas_out_reg[2]  ( .D(n20), .CK(clk), .Q(tas_out[2]) );
  DFFHQX1 \tas_out_reg[3]  ( .D(n19), .CK(clk), .Q(tas_out[3]) );
  DFFHQX1 \tas_out_reg[5]  ( .D(n24), .CK(clk), .Q(tas_out[5]) );
  DFFHQX1 \tas_out_reg[0]  ( .D(n26), .CK(clk), .Q(tas_out[0]) );
  NOR4BX1 U3 ( .AN(n34), .B(rst), .C(hold_in), .D(s_in), .Y(n18) );
  INVX1 U4 ( .A(r_in), .Y(n34) );
  NOR4BX1 U5 ( .AN(hold_in), .B(r_in), .C(rst), .D(s_in), .Y(n7) );
  NOR3X1 U6 ( .A(rst), .B(s_in), .C(n34), .Y(n5) );
  NOR2BX1 U7 ( .AN(n18), .B(updwn_in), .Y(n6) );
  AND2X2 U8 ( .A(updwn_in), .B(n18), .Y(n4) );
  OAI2BB1X1 U9 ( .A0N(tas_out[6]), .A1N(n7), .B0(n13), .Y(n23) );
  AOI22X1 U10 ( .A0(N22), .A1(n4), .B0(N14), .B1(n6), .Y(n13) );
  OAI2BB1X1 U11 ( .A0N(tas_out[5]), .A1N(n7), .B0(n14), .Y(n24) );
  AOI22X1 U12 ( .A0(N21), .A1(n4), .B0(N13), .B1(n6), .Y(n14) );
  OAI2BB1X1 U13 ( .A0N(tas_out[4]), .A1N(n7), .B0(n15), .Y(n25) );
  AOI22X1 U14 ( .A0(N20), .A1(n4), .B0(N12), .B1(n6), .Y(n15) );
  INVX1 U15 ( .A(n29), .Y(N20) );
  OAI2BB1X1 U16 ( .A0N(tas_out[7]), .A1N(n7), .B0(n12), .Y(n22) );
  AOI22X1 U17 ( .A0(N23), .A1(n4), .B0(N15), .B1(n6), .Y(n12) );
  NAND2X1 U18 ( .A(n2), .B(n3), .Y(n19) );
  AOI22X1 U19 ( .A0(N11), .A1(n6), .B0(tas_out[3]), .B1(n7), .Y(n2) );
  AOI21X1 U20 ( .A0(N19), .A1(n4), .B0(n5), .Y(n3) );
  NAND2X1 U21 ( .A(n8), .B(n9), .Y(n20) );
  AOI22X1 U22 ( .A0(N10), .A1(n6), .B0(tas_out[2]), .B1(n7), .Y(n8) );
  AOI21X1 U23 ( .A0(N18), .A1(n4), .B0(n5), .Y(n9) );
  NAND2X1 U24 ( .A(n10), .B(n11), .Y(n21) );
  AOI22X1 U25 ( .A0(N9), .A1(n6), .B0(tas_out[1]), .B1(n7), .Y(n10) );
  AOI21X1 U26 ( .A0(N17), .A1(n4), .B0(n5), .Y(n11) );
  NAND2X1 U27 ( .A(n16), .B(n17), .Y(n26) );
  AOI22X1 U28 ( .A0(N8), .A1(n6), .B0(tas_out[0]), .B1(n7), .Y(n16) );
  AOI21X1 U29 ( .A0(N16), .A1(n4), .B0(n5), .Y(n17) );
  INVX1 U30 ( .A(tas_out[0]), .Y(N16) );
  INVX1 U31 ( .A(tas_out[5]), .Y(n33) );
  NAND2BX1 U32 ( .AN(tas_out[1]), .B(N16), .Y(n1) );
  OAI2BB1X1 U33 ( .A0N(tas_out[0]), .A1N(tas_out[1]), .B0(n1), .Y(N17) );
  OR2X1 U34 ( .A(n1), .B(tas_out[2]), .Y(n27) );
  OAI2BB1X1 U35 ( .A0N(n1), .A1N(tas_out[2]), .B0(n27), .Y(N18) );
  OR2X1 U36 ( .A(n27), .B(tas_out[3]), .Y(n28) );
  OAI2BB1X1 U37 ( .A0N(n27), .A1N(tas_out[3]), .B0(n28), .Y(N19) );
  NOR2X1 U38 ( .A(n28), .B(tas_out[4]), .Y(n30) );
  AOI21X1 U39 ( .A0(n28), .A1(tas_out[4]), .B0(n30), .Y(n29) );
  NAND2X1 U40 ( .A(n30), .B(n33), .Y(n31) );
  OAI21XL U41 ( .A0(n30), .A1(n33), .B0(n31), .Y(N21) );
  XNOR2X1 U42 ( .A(tas_out[6]), .B(n31), .Y(N22) );
  NOR2X1 U43 ( .A(tas_out[6]), .B(n31), .Y(n32) );
  XOR2X1 U44 ( .A(tas_out[7]), .B(n32), .Y(N23) );
endmodule


module decode_logic ( tas_in, lu_out, ld_out );
  input [7:0] tas_in;
  output lu_out, ld_out;
  wire   \tas_in[0] ;
  assign ld_out = \tas_in[0] ;
  assign lu_out = \tas_in[0] ;
  assign \tas_in[0]  = tas_in[0];

endmodule


module data_register ( clk, rst, data_in, data_out );
  input [7:0] data_in;
  output [7:0] data_out;
  input clk, rst;
  wire   n9;

  DFFTRX1 \data_reg[7]  ( .D(data_in[7]), .RN(n9), .CK(clk), .Q(data_out[7])
         );
  DFFTRX1 \data_reg[6]  ( .D(data_in[6]), .RN(n9), .CK(clk), .Q(data_out[6])
         );
  DFFTRX1 \data_reg[5]  ( .D(data_in[5]), .RN(n9), .CK(clk), .Q(data_out[5])
         );
  DFFTRX1 \data_reg[4]  ( .D(data_in[4]), .RN(n9), .CK(clk), .Q(data_out[4])
         );
  DFFTRX1 \data_reg[3]  ( .D(data_in[3]), .RN(n9), .CK(clk), .Q(data_out[3])
         );
  DFFTRX1 \data_reg[2]  ( .D(data_in[2]), .RN(n9), .CK(clk), .Q(data_out[2])
         );
  DFFTRX1 \data_reg[1]  ( .D(data_in[1]), .RN(n9), .CK(clk), .Q(data_out[1])
         );
  DFFTRX1 \data_reg[0]  ( .D(data_in[0]), .RN(n9), .CK(clk), .Q(data_out[0])
         );
  INVX1 U3 ( .A(rst), .Y(n9) );
endmodule


module data_comparator ( bist_data_in, mem_data_in, passfail_out );
  input [7:0] bist_data_in;
  input [7:0] mem_data_in;
  output passfail_out;


  XOR2X1 U1 ( .A(mem_data_in[0]), .B(bist_data_in[0]), .Y(passfail_out) );
endmodule


module operation_formatting ( op_in, op_out );
  input [3:0] op_in;
  output [3:0] op_out;

  assign op_out[3] = op_in[3];
  assign op_out[2] = op_in[2];
  assign op_out[1] = op_in[1];
  assign op_out[0] = op_in[0];

endmodule


module operation_control_register ( clk, rst, op_in, op_out );
  input [3:0] op_in;
  output [3:0] op_out;
  input clk, rst;
  wire   n5;

  DFFTRX1 \op_out_reg[3]  ( .D(op_in[3]), .RN(n5), .CK(clk), .Q(op_out[3]) );
  DFFTRX1 \op_out_reg[2]  ( .D(op_in[2]), .RN(n5), .CK(clk), .Q(op_out[2]) );
  DFFTRX1 \op_out_reg[1]  ( .D(op_in[1]), .RN(n5), .CK(clk), .Q(op_out[1]) );
  DFFTRX1 \op_out_reg[0]  ( .D(op_in[0]), .RN(n5), .CK(clk), .Q(op_out[0]) );
  INVX1 U3 ( .A(rst), .Y(n5) );
endmodule


module flipflop_0 ( clk, rst, d_in, q_out );
  input clk, rst, d_in;
  output q_out;
  wire   n2;

  DFFTRX1 q_out_reg ( .D(d_in), .RN(n2), .CK(clk), .Q(q_out) );
  INVX1 U3 ( .A(rst), .Y(n2) );
endmodule


module instruction_register_hold ( lu_in, ld_in, updwn_in, ts_in, cc_comp_in, 
        hold_out );
  input lu_in, ld_in, updwn_in, ts_in, cc_comp_in;
  output hold_out;
  wire   n2, n1;

  NOR2BX1 U1 ( .AN(n2), .B(ts_in), .Y(hold_out) );
  OAI221XL U2 ( .A0(updwn_in), .A1(ld_in), .B0(lu_in), .B1(n1), .C0(cc_comp_in), .Y(n2) );
  INVX1 U3 ( .A(updwn_in), .Y(n1) );
endmodule


module address_counter_hold ( cmpff_in, udff_q_in, ir_updwn_in, hold_out );
  input cmpff_in, udff_q_in, ir_updwn_in;
  output hold_out;
  wire   n1;

  NAND2X1 U1 ( .A(n1), .B(cmpff_in), .Y(hold_out) );
  XNOR2X1 U2 ( .A(udff_q_in), .B(ir_updwn_in), .Y(n1) );
endmodule


module address_counter_up_down ( updwn_in, ts_in, s_out, r_out );
  input updwn_in, ts_in;
  output s_out, r_out;


  NOR2BX1 U1 ( .AN(ts_in), .B(updwn_in), .Y(s_out) );
  AND2X2 U2 ( .A(ts_in), .B(updwn_in), .Y(r_out) );
endmodule


module data_polarity ( data_in, pol_in, data_out );
  input [7:0] data_in;
  output [7:0] data_out;
  input pol_in;

  assign data_out[7] = data_in[7];
  assign data_out[6] = data_in[6];
  assign data_out[5] = data_in[5];
  assign data_out[4] = data_in[4];
  assign data_out[3] = data_in[3];
  assign data_out[2] = data_in[2];
  assign data_out[1] = data_in[1];

  INVX1 U2 ( .A(data_in[0]), .Y(data_out[0]) );
endmodule


module mbist_top ( clk, rst, ts_in, scan_in, tas_out, tcs_out, tds_out, 
        passfail_out );
  input [36:0] scan_in;
  output [7:0] tas_out;
  output [3:0] tcs_out;
  output [7:0] tds_out;
  input clk, rst, ts_in;
  output passfail_out;
  wire   n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, ir_hold, \ir_updwn[0] , cc_pol,
         cc_cmpff, ac_hold, ac_s, ac_r, dlirh_lu, dlirh_ld, udff_q, n59;
  wire   [15:0] ircc_op;
  wire   [3:0] ircc_pol;
  wire   [1:0] ircc_no;
  wire   [7:0] ir_data;
  wire   [3:0] ccfm_op;
  wire   [7:0] dl_data;
  wire   [7:0] mem;
  wire   [3:0] fmocr_op;

  instruction_register inst_reg ( .clk(clk), .rst(n59), .updwn_in(n61), 
        .op_in({n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, 
        n74, n75, n76, n77}), .pol_in({n78, n79, n80, n81}), .no_in({n82, n83}), .data_in({n84, n85, n86, n87, n88, n89, n90, n91}), .w_in(n92), .admd_in({
        n93, n94, n95, n96}), .te_in(1'b0), .hold_in(ir_hold), .updwn_out(
        \ir_updwn[0] ), .op_out(ircc_op), .pol_out(ircc_pol), .no_out(ircc_no), 
        .data_out(ir_data) );
  cycle_controller cyc_ctrl ( .clk(clk), .rst(n59), .op_in(ircc_op), .pol_in(
        ircc_pol), .no_in(ircc_no), .ts_in(n60), .op_out(ccfm_op), .pol_out(
        cc_pol), .cc_cmpff_out(cc_cmpff) );
  address_counter addr_cntr ( .clk(clk), .rst(n59), .hold_in(ac_hold), 
        .updwn_in(\ir_updwn[0] ), .s_in(ac_s), .r_in(ac_r), .tas_out({n97, n98, 
        n99, n100, n101, n102, n103, n104}) );
  decode_logic dec_lgc ( .tas_in({n97, n98, n99, n100, n101, n102, n103, n104}), .lu_out(dlirh_lu), .ld_out(dlirh_ld) );
  data_register data_reg ( .clk(clk), .rst(n59), .data_in(dl_data), .data_out(
        {n109, n110, n111, n112, n113, n114, n115, n116}) );
  data_comparator data_comp ( .bist_data_in({n109, n110, n111, n112, n113, 
        n114, n115, n116}), .mem_data_in({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .passfail_out(n117) );
  operation_formatting op_fmt ( .op_in(ccfm_op), .op_out(fmocr_op) );
  operation_control_register op_ctrl_reg ( .clk(clk), .rst(n59), .op_in(
        fmocr_op), .op_out({n105, n106, n107, n108}) );
  flipflop_0 udff ( .clk(clk), .rst(n59), .d_in(\ir_updwn[0] ), .q_out(udff_q)
         );
  instruction_register_hold logic_ir_hold ( .lu_in(dlirh_lu), .ld_in(dlirh_ld), 
        .updwn_in(\ir_updwn[0] ), .ts_in(n60), .cc_comp_in(1'b0), .hold_out(
        ir_hold) );
  address_counter_hold addr_cntr_hold ( .cmpff_in(cc_cmpff), .udff_q_in(udff_q), .ir_updwn_in(\ir_updwn[0] ), .hold_out(ac_hold) );
  address_counter_up_down logic_addr_updwn ( .updwn_in(\ir_updwn[0] ), .ts_in(
        n60), .s_out(ac_s), .r_out(ac_r) );
  data_polarity data_pol_logic ( .data_in(ir_data), .pol_in(cc_pol), 
        .data_out(dl_data) );
  BUFX3 U1 ( .A(rst), .Y(n59) );
  BUFX3 U2 ( .A(scan_in[0]), .Y(n96) );
  BUFX3 U3 ( .A(scan_in[1]), .Y(n95) );
  BUFX3 U4 ( .A(scan_in[2]), .Y(n94) );
  BUFX3 U5 ( .A(scan_in[3]), .Y(n93) );
  BUFX3 U6 ( .A(scan_in[4]), .Y(n92) );
  BUFX3 U7 ( .A(scan_in[5]), .Y(n91) );
  BUFX3 U8 ( .A(scan_in[6]), .Y(n90) );
  BUFX3 U9 ( .A(scan_in[7]), .Y(n89) );
  BUFX3 U10 ( .A(scan_in[8]), .Y(n88) );
  BUFX3 U11 ( .A(scan_in[9]), .Y(n87) );
  BUFX3 U12 ( .A(scan_in[10]), .Y(n86) );
  BUFX3 U13 ( .A(scan_in[11]), .Y(n85) );
  BUFX3 U14 ( .A(scan_in[12]), .Y(n84) );
  BUFX3 U15 ( .A(scan_in[13]), .Y(n83) );
  BUFX3 U16 ( .A(scan_in[14]), .Y(n82) );
  BUFX3 U17 ( .A(scan_in[15]), .Y(n81) );
  BUFX3 U18 ( .A(scan_in[16]), .Y(n80) );
  BUFX3 U19 ( .A(scan_in[17]), .Y(n79) );
  BUFX3 U20 ( .A(scan_in[18]), .Y(n78) );
  BUFX3 U21 ( .A(scan_in[19]), .Y(n77) );
  BUFX3 U22 ( .A(scan_in[20]), .Y(n76) );
  BUFX3 U23 ( .A(scan_in[21]), .Y(n75) );
  BUFX3 U24 ( .A(scan_in[22]), .Y(n74) );
  BUFX3 U25 ( .A(scan_in[23]), .Y(n73) );
  BUFX3 U26 ( .A(scan_in[24]), .Y(n72) );
  BUFX3 U27 ( .A(scan_in[25]), .Y(n71) );
  BUFX3 U28 ( .A(scan_in[26]), .Y(n70) );
  BUFX3 U29 ( .A(scan_in[27]), .Y(n69) );
  BUFX3 U30 ( .A(scan_in[28]), .Y(n68) );
  BUFX3 U31 ( .A(scan_in[29]), .Y(n67) );
  BUFX3 U32 ( .A(scan_in[30]), .Y(n66) );
  BUFX3 U33 ( .A(scan_in[31]), .Y(n65) );
  BUFX3 U34 ( .A(scan_in[32]), .Y(n64) );
  BUFX3 U35 ( .A(scan_in[33]), .Y(n63) );
  BUFX3 U36 ( .A(scan_in[34]), .Y(n62) );
  BUFX3 U37 ( .A(scan_in[35]), .Y(n61) );
  BUFX3 U38 ( .A(ts_in), .Y(n60) );
  BUFX3 U39 ( .A(n117), .Y(passfail_out) );
  BUFX3 U40 ( .A(n116), .Y(tds_out[0]) );
  BUFX3 U41 ( .A(n115), .Y(tds_out[1]) );
  BUFX3 U42 ( .A(n114), .Y(tds_out[2]) );
  BUFX3 U43 ( .A(n113), .Y(tds_out[3]) );
  BUFX3 U44 ( .A(n112), .Y(tds_out[4]) );
  BUFX3 U45 ( .A(n111), .Y(tds_out[5]) );
  BUFX3 U46 ( .A(n110), .Y(tds_out[6]) );
  BUFX3 U47 ( .A(n109), .Y(tds_out[7]) );
  BUFX3 U48 ( .A(n108), .Y(tcs_out[0]) );
  BUFX3 U49 ( .A(n107), .Y(tcs_out[1]) );
  BUFX3 U50 ( .A(n106), .Y(tcs_out[2]) );
  BUFX3 U51 ( .A(n105), .Y(tcs_out[3]) );
  BUFX3 U52 ( .A(n104), .Y(tas_out[0]) );
  BUFX3 U53 ( .A(n103), .Y(tas_out[1]) );
  BUFX3 U54 ( .A(n102), .Y(tas_out[2]) );
  BUFX3 U55 ( .A(n101), .Y(tas_out[3]) );
  BUFX3 U56 ( .A(n100), .Y(tas_out[4]) );
  BUFX3 U57 ( .A(n99), .Y(tas_out[5]) );
  BUFX3 U58 ( .A(n98), .Y(tas_out[6]) );
  BUFX3 U59 ( .A(n97), .Y(tas_out[7]) );
endmodule

