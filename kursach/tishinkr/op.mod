module SYNC_RAM
symbol op
family spartan
symboltemplate syncram0
attributes
   BUS_WIDTH = 8
   DEPTH = 16
   MEMFILE = OP
   STYLE = MAX_SPEED
   USE_RPM = FALSE
pins
   A(3:0)
   DO(7:0)
   DI(7:0)
   WR_EN
   WR_CLK
