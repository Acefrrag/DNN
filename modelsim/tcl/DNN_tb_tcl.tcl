namespace eval ::codelocktb {
 
	# Put all the Tcl code in here
 
	cd [file dirname [work -n  work.DNN_tb.].vhd]
 
	#Load the simulation
	vsim work.DNN_tb
 
	# Load the waveform
	if {[file exists wave.do]} {
		do wave.do
	}
	
	run 10 us
 
}