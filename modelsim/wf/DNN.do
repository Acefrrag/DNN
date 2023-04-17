onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group layer1 -label CLK /dnn_tb/DNN_cmp/layer1/clk
add wave -noupdate -expand -group layer1 -label START /dnn_tb/DNN_cmp/layer1/start
add wave -noupdate -expand -group layer1 -label DATA_IN -radix sfixed -childformat {{/dnn_tb/DNN_cmp/layer1/data_in(9) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(8) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(7) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(6) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(5) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(4) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(3) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(2) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(1) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(0) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-1) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-2) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-3) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-4) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-5) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-6) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-7) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-8) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-9) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-10) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-11) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-12) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-13) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-14) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-15) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-16) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-17) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-18) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-19) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-20) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-21) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_in(-22) -radix sfixed}} -subitemconfig {/dnn_tb/DNN_cmp/layer1/data_in(9) {-radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(8) {-radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(7) {-radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(6) {-radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(5) {-radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(4) {-radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(3) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(2) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(1) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(0) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-1) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-2) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-3) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-4) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-5) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-6) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-7) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-8) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-9) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-10) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-11) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-12) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-13) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-14) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-15) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-16) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-17) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-18) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-19) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-20) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-21) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_in(-22) {-height 27 -radix sfixed}} /dnn_tb/DNN_cmp/layer1/data_in
add wave -noupdate -expand -group layer1 -label DATA_OUT /dnn_tb/DNN_cmp/layer1/data_out
add wave -noupdate -expand -group layer1 -label DATA_IN_SEL -radix decimal /dnn_tb/DNN_cmp/layer1/data_in_sel
add wave -noupdate -expand -group layer1 -label sum_reg_rst /dnn_tb/DNN_cmp/layer1/sum_reg_rst
add wave -noupdate -expand -group layer1 -label addr_in_gen_rst /dnn_tb/DNN_cmp/layer1/addr_in_gen_rst
add wave -noupdate -expand -group layer1 -label pr_state /dnn_tb/DNN_cmp/layer1/fsm_layer_comp/pr_state
add wave -noupdate -expand -group layer1 -label DATA_OUT_SEL /dnn_tb/DNN_cmp/layer1/data_out_sel
add wave -noupdate -expand -group layer1 -label DATA_OUT_VECT -radix sfixed -childformat {{/dnn_tb/DNN_cmp/layer1/data_out_vect(0) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(1) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(2) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(3) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(4) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(5) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(6) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(7) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(8) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(9) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(10) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(11) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(12) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(13) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(14) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(15) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(16) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(17) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(18) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(19) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(20) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(21) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(22) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(23) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(24) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(25) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(26) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(27) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(28) -radix sfixed} {/dnn_tb/DNN_cmp/layer1/data_out_vect(29) -radix sfixed}} -subitemconfig {/dnn_tb/DNN_cmp/layer1/data_out_vect(0) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(1) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(2) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(3) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(4) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(5) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(6) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(7) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(8) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(9) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(10) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(11) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(12) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(13) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(14) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(15) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(16) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(17) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(18) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(19) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(20) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(21) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(22) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(23) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(24) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(25) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(26) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(27) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(28) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer1/data_out_vect(29) {-height 27 -radix sfixed}} /dnn_tb/DNN_cmp/layer1/data_out_vect
add wave -noupdate -expand -group layer1 -label DATA_V /dnn_tb/DNN_cmp/layer1/data_v
add wave -noupdate -expand -group layer2 -label PR_STATE /dnn_tb/DNN_cmp/layer2/fsm_layer_comp/pr_state
add wave -noupdate -expand -group layer2 -label CLK /dnn_tb/DNN_cmp/layer2/clk
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/data_in
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/data_out_sel
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/start
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/data_out
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/data_in_sel
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/data_v
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/addr
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/rst
add wave -noupdate -expand -group layer2 -radix sfixed -childformat {{/dnn_tb/DNN_cmp/layer2/data_out_vect(0) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(1) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(2) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(3) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(4) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(5) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(6) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(7) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(8) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(9) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(10) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(11) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(12) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(13) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(14) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(15) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(16) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(17) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(18) -radix sfixed} {/dnn_tb/DNN_cmp/layer2/data_out_vect(19) -radix sfixed}} -subitemconfig {/dnn_tb/DNN_cmp/layer2/data_out_vect(0) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(1) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(2) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(3) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(4) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(5) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(6) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(7) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(8) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(9) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(10) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(11) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(12) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(13) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(14) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(15) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(16) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(17) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(18) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer2/data_out_vect(19) {-height 27 -radix sfixed}} /dnn_tb/DNN_cmp/layer2/data_out_vect
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/out_v_vect
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/addr_TC
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/sum_reg_rst
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/mul_sel
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/out_v
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/update_out
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/addr_in_gen_rst
add wave -noupdate -expand -group layer2 /dnn_tb/DNN_cmp/layer2/data_in_d
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/clk
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/data_in
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/data_out_sel
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/start
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/data_out
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/data_in_sel
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/data_v
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/addr
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/rst
add wave -noupdate -group layer3 -radix sfixed -childformat {{/dnn_tb/DNN_cmp/layer3/data_out_vect(0) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(1) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(2) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(3) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4) -radix sfixed -childformat {{/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(9) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(8) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(7) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(6) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(5) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(4) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(3) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(2) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(1) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(0) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-1) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-2) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-3) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-4) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-5) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-6) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-7) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-8) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-9) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-10) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-11) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-12) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-13) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-14) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-15) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-16) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-17) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-18) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-19) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-20) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-21) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-22) -radix sfixed}}} {/dnn_tb/DNN_cmp/layer3/data_out_vect(5) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(6) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(7) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(8) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(9) -radix sfixed}} -expand -subitemconfig {/dnn_tb/DNN_cmp/layer3/data_out_vect(0) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(1) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(2) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(3) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4) {-height 27 -radix sfixed -childformat {{/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(9) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(8) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(7) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(6) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(5) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(4) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(3) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(2) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(1) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(0) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-1) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-2) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-3) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-4) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-5) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-6) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-7) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-8) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-9) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-10) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-11) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-12) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-13) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-14) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-15) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-16) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-17) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-18) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-19) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-20) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-21) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-22) -radix sfixed}}} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(9) {-radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(8) {-radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(7) {-radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(6) {-radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(5) {-radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(4) {-radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(3) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(2) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(1) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(0) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-1) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-2) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-3) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-4) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-5) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-6) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-7) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-8) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-9) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-10) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-11) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-12) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-13) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-14) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-15) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-16) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-17) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-18) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-19) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-20) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-21) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(4)(-22) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(5) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(6) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(7) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(8) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/data_out_vect(9) {-height 27 -radix sfixed}} /dnn_tb/DNN_cmp/layer3/data_out_vect
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/out_v_vect
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/addr_TC
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/sum_reg_rst
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/mul_sel
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/out_v
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/update_out
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/addr_in_gen_rst
add wave -noupdate -group layer3 /dnn_tb/DNN_cmp/layer3/data_in_d
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/clk
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/addr
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory -radix sfixed -childformat {{/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(2) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(1) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(0) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-1) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-2) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-3) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-4) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-5) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-6) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-7) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-8) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-9) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-10) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-11) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-12) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-13) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-14) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-15) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-16) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-17) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-18) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-19) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-20) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-21) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-22) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-23) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-24) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-25) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-26) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-27) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-28) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-29) -radix sfixed}} -subitemconfig {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(2) {-radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(1) {-radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(0) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-1) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-2) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-3) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-4) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-5) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-6) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-7) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-8) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-9) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-10) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-11) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-12) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-13) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-14) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-15) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-16) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-17) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-18) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-19) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-20) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-21) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-22) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-23) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-24) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-25) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-26) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-27) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-28) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout(-29) {-height 27 -radix sfixed}} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/dout
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory -radix sfixed -childformat {{/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(0) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(1) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(2) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(3) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(4) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(5) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(6) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(7) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(8) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(9) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(10) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(11) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(12) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(13) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(14) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(15) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(16) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(17) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(18) -radix sfixed} {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(19) -radix sfixed}} -subitemconfig {/dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(0) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(1) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(2) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(3) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(4) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(5) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(6) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(7) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(8) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(9) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(10) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(11) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(12) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(13) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(14) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(15) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(16) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(17) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(18) {-height 27 -radix sfixed} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM(19) {-height 27 -radix sfixed}} /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/ROM
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/var1
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/var2
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/mult
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/out_p
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/rom_depth
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/rom_width
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/rom_int_width
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -height 21 -group weight_memory /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_memory_comp/rom_frac_width
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/clk
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -radix sfixed /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/data_in
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/addr
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/mul_sel
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/sum_reg_rst
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/update_out
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/data_out
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -radix sfixed /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_out
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/clk_sig
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -radix sfixed /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/sum_reg_out
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -radix sfixed /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/mul_out
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -radix sfixed /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/weight_prod
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 -radix sfixed /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/bias
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/out_reg_val
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/act_log_out
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/act_log_out_d
add wave -noupdate -group layer3 -height 21 -expand -group neuron1 /dnn_tb/DNN_cmp/layer3/neurons(1)/neuron_i/sigmoid_data_in
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/clk
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/data_in
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/addr
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/mul_sel
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/sum_reg_rst
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/update_out
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/data_out
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/weight_out
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/clk_sig
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/sum_reg_out
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/mul_out
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/weight_prod
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/bias
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/out_reg_val
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/act_log_out
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/act_log_out_d
add wave -noupdate -group layer3 -height 21 -group neuron2 /dnn_tb/DNN_cmp/layer3/neurons(2)/neuron_i/sigmoid_data_in
add wave -noupdate /dnn_tb/DNN_cmp/layer2/fsm_layer_comp/pr_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {31380000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 524
configure wave -valuecolwidth 104
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {31350783 ps} {31545563 ps}
