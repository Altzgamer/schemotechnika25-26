module SYNC_RAM
symbol rp
family spartan
symboltemplate syncram0
attributes
   BUS_WIDTH = 4
   DEPTH = 16
   MEMFILE = rp
   STYLE = MAX_SPEED
   USE_RPM = FALSE
pins
   A(3:0)
   DO(3:0)
   DI(3:0)
   WR_EN
   WR_CLK
