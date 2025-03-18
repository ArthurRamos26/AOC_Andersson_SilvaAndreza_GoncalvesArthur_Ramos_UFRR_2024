view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue U -period 100ns -dutycycle 50 -starttime 0ns -endtime 10000ns sim:/processador8bits/clock 
WaveCollapseAll -1
wave clipboard restore
