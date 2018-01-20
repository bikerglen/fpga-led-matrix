set_property -dict { PACKAGE_PIN G13  IOSTANDARD LVCMOS33 } [get_ports { r0 }];     #Sch=JA1
set_property -dict { PACKAGE_PIN B11  IOSTANDARD LVCMOS33 } [get_ports { g0 }];     #Sch=JA2
set_property -dict { PACKAGE_PIN A11  IOSTANDARD LVCMOS33 } [get_ports { b0 }];     #Sch=JA3
# set_property -dict { PACKAGE_PIN D12  IOSTANDARD LVCMOS33 } [get_ports { }];      #Sch=JA4

set_property -dict { PACKAGE_PIN D13  IOSTANDARD LVCMOS33 } [get_ports { r1 }];     #Sch=JA7
set_property -dict { PACKAGE_PIN B18  IOSTANDARD LVCMOS33 } [get_ports { g1 }];     #Sch=JA8
set_property -dict { PACKAGE_PIN A18  IOSTANDARD LVCMOS33 } [get_ports { b1 }];     #Sch=JA9
# set_property -dict { PACKAGE_PIN K16  IOSTANDARD LVCMOS33 } [get_ports { }];      #Sch=JA10

set_property -dict { PACKAGE_PIN E15  IOSTANDARD LVCMOS33 } [get_ports { a[0] }];   #Sch=JB1
set_property -dict { PACKAGE_PIN E16  IOSTANDARD LVCMOS33 } [get_ports { a[1] }];   #Sch=JB2
set_property -dict { PACKAGE_PIN D15  IOSTANDARD LVCMOS33 } [get_ports { a[2] }];   #Sch=JB3
set_property -dict { PACKAGE_PIN C15  IOSTANDARD LVCMOS33 } [get_ports { a[3] }];   #Sch=JB4

set_property -dict { PACKAGE_PIN J17  IOSTANDARD LVCMOS33 } [get_ports { blank }];  #Sch=JB7
set_property -dict { PACKAGE_PIN J18  IOSTANDARD LVCMOS33 } [get_ports { latch }];  #Sch=JB8
set_property -dict { PACKAGE_PIN K15  IOSTANDARD LVCMOS33 } [get_ports { sclk }];   #Sch=JB9
# set_property -dict { PACKAGE_PIN J15  IOSTANDARD LVCMOS33 } [get_ports {  }];     #Sch=JB10

set_clock_groups -asynchronous -group [get_clocks { clk_pll_i }]  \
                               -group [get_clocks { clk_out3_system_clk_wiz_0_0 }];
