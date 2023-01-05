onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TB /sigmoid_tb/CLK
add wave -noupdate -expand -group TB -radix sfixed /sigmoid_tb/data_in
add wave -noupdate -expand -group TB -radix sfixed /sigmoid_tb/data_out
add wave -noupdate -expand -group sigmoid_comp /sigmoid_tb/Sigmoid_comp/CLK
add wave -noupdate -expand -group sigmoid_comp -radix sfixed /sigmoid_tb/Sigmoid_comp/data_in
add wave -noupdate -expand -group sigmoid_comp -radix sfixed /sigmoid_tb/Sigmoid_comp/data_out
add wave -noupdate -expand -group sigmoid_comp -radix sfixed -childformat {{/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(0) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(1) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(2) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(3) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(4) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(5) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(6) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(7) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(8) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(9) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(10) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(11) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(12) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(13) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(14) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(15) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(16) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(17) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(18) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(19) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(20) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(21) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(22) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(23) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(24) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(25) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(26) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(27) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(28) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(29) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(30) -radix sfixed} {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(31) -radix sfixed}} -subitemconfig {/sigmoid_tb/Sigmoid_comp/sigmoid_ROM(0) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(1) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(2) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(3) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(4) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(5) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(6) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(7) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(8) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(9) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(10) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(11) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(12) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(13) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(14) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(15) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(16) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(17) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(18) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(19) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(20) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(21) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(22) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(23) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(24) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(25) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(26) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(27) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(28) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(29) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(30) {-radix sfixed} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM(31) {-radix sfixed}} /sigmoid_tb/Sigmoid_comp/sigmoid_ROM
add wave -noupdate -expand -group sigmoid_comp /sigmoid_tb/Sigmoid_comp/data_in_integer
add wave -noupdate -expand -group sigmoid_comp -radix unsigned /sigmoid_tb/Sigmoid_comp/addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 407
configure wave -valuecolwidth 194
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
WaveRestoreZoom {0 ps} {16295 ps}
