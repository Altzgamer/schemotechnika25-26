module ROM
symbol rom
family spartan
symboltemplate rom0
attributes
   BUS_WIDTH = 20
   DEPTH = 16
   MEMFILE = ROM
   STYLE = MAX_SPEED
   USE_RPM = FALSE
pins
   A(3:0)
   DO(19:0)
