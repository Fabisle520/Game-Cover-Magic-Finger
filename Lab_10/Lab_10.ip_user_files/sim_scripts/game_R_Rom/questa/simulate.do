onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib game_R_Rom_opt

do {wave.do}

view wave
view structure
view signals

do {game_R_Rom.udo}

run -all

quit -force
