class usr_sbd extends uvm_scoreboard;
uvm_analysis_imp#(usr_tx,usr_sbd)analysis_export;
`uvm_component_utils(usr_sbd)
`NEW_COMP
function void build();
	analysis_export=new("analysis_export",this);
endfunction

function void write(usr_tx tx);
endfunction
endclass
