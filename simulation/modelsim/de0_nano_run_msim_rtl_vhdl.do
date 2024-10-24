transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib utils
vmap utils utils
vcom -93 -work utils {D:/Documents/Quartus_files/de0_nano/utils/virtual_clock.vhdl}
vcom -93 -work utils {D:/Documents/Quartus_files/de0_nano/utils/types.vhdl}
vcom -93 -work utils {D:/Documents/Quartus_files/de0_nano/utils/fonts.vhdl}
vcom -93 -work work {D:/Documents/Quartus_files/de0_nano/spi_master.vhd}
vcom -93 -work work {D:/Documents/Quartus_files/de0_nano/I2C_MCP4725.vhd}
vcom -93 -work work {D:/Documents/Quartus_files/de0_nano/de0nano_adc.vhd}
vcom -93 -work work {D:/Documents/Quartus_files/de0_nano/top_level.vhd}

vcom -93 -work work {D:/Documents/Quartus_files/de0_nano/top_level_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -L utils -voptargs="+acc"  top_level_tb

add wave *
view structure
view signals
run -all
