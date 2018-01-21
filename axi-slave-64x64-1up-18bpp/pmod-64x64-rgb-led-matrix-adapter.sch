<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.7.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="0GlenConnectors">
<packages>
<package name="CON-PMOD-1X6">
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="5.715" width="0.127" layer="21"/>
<wire x1="-1.27" y1="5.715" x2="-0.635" y2="5.08" width="0.127" layer="21"/>
<wire x1="-0.635" y1="5.08" x2="-1.27" y2="4.445" width="0.127" layer="21"/>
<wire x1="-1.27" y1="4.445" x2="-1.27" y2="3.175" width="0.127" layer="21"/>
<wire x1="-1.27" y1="3.175" x2="-0.635" y2="2.54" width="0.127" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="-1.27" y2="1.905" width="0.127" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="0.635" width="0.127" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="0" width="0.127" layer="21"/>
<wire x1="-0.635" y1="0" x2="-1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.27" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-0.635" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="-1.27" y2="-3.175" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-3.175" x2="-1.27" y2="-4.445" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-4.445" x2="-0.635" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-0.635" y1="-5.08" x2="-1.27" y2="-5.715" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-5.715" x2="-1.27" y2="-6.985" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-6.985" x2="-0.635" y2="-7.62" width="0.127" layer="21"/>
<wire x1="-0.635" y1="-7.62" x2="0.635" y2="-7.62" width="0.127" layer="21"/>
<wire x1="0.635" y1="-7.62" x2="1.27" y2="-6.985" width="0.127" layer="21"/>
<wire x1="1.27" y1="-6.985" x2="1.27" y2="-5.715" width="0.127" layer="21"/>
<wire x1="1.27" y1="-5.715" x2="0.635" y2="-5.08" width="0.127" layer="21"/>
<wire x1="0.635" y1="-5.08" x2="1.27" y2="-4.445" width="0.127" layer="21"/>
<wire x1="1.27" y1="-4.445" x2="1.27" y2="-3.175" width="0.127" layer="21"/>
<wire x1="1.27" y1="-3.175" x2="0.635" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="1.27" y2="-1.905" width="0.127" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="0" width="0.127" layer="21"/>
<wire x1="0.635" y1="0" x2="1.27" y2="0.635" width="0.127" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="1.905" width="0.127" layer="21"/>
<wire x1="1.27" y1="1.905" x2="0.635" y2="2.54" width="0.127" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.27" y2="3.175" width="0.127" layer="21"/>
<wire x1="1.27" y1="3.175" x2="1.27" y2="4.445" width="0.127" layer="21"/>
<wire x1="1.27" y1="4.445" x2="0.635" y2="5.08" width="0.127" layer="21"/>
<wire x1="0.635" y1="5.08" x2="1.27" y2="5.715" width="0.127" layer="21"/>
<wire x1="1.27" y1="5.715" x2="1.27" y2="6.985" width="0.127" layer="21"/>
<wire x1="1.27" y1="6.985" x2="0.635" y2="7.62" width="0.127" layer="21"/>
<wire x1="0.635" y1="7.62" x2="-0.635" y2="7.62" width="0.127" layer="21"/>
<wire x1="-0.635" y1="7.62" x2="-1.27" y2="6.985" width="0.127" layer="21"/>
<pad name="1" x="0" y="6.35" drill="0.9" diameter="1.6764" shape="square"/>
<pad name="2" x="0" y="3.81" drill="0.9" diameter="1.6764"/>
<pad name="3" x="0" y="1.27" drill="0.9" diameter="1.6764"/>
<pad name="4" x="0" y="-1.27" drill="0.9" diameter="1.6764"/>
<pad name="5" x="0" y="-3.81" drill="0.9" diameter="1.6764"/>
<text x="-1.27" y="-9.525" size="1.27" layer="21">&gt;NAME</text>
<pad name="6" x="0" y="-6.35" drill="0.9" diameter="1.6764"/>
</package>
</packages>
<symbols>
<symbol name="PMOD-1X6-GENERIC">
<pin name="1" x="12.7" y="5.08" length="middle" rot="R180"/>
<pin name="2" x="12.7" y="2.54" length="middle" rot="R180"/>
<pin name="3" x="12.7" y="0" length="middle" rot="R180"/>
<pin name="4" x="12.7" y="-2.54" length="middle" rot="R180"/>
<pin name="GND@1" x="12.7" y="-5.08" length="middle" direction="pwr" rot="R180"/>
<pin name="VCC@1" x="12.7" y="-7.62" length="middle" rot="R180"/>
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-10.16" x2="7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="-10.16" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="-5.08" y2="7.62" width="0.254" layer="94"/>
<text x="-5.08" y="-12.7" size="1.27" layer="95">&gt;NAME</text>
<text x="-5.08" y="-15.24" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="PMOD-1X6-GENERIC">
<gates>
<gate name="G$1" symbol="PMOD-1X6-GENERIC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CON-PMOD-1X6">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="GND@1" pad="5"/>
<connect gate="G$1" pin="VCC@1" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply2">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
Please keep in mind, that these devices are necessary for the
automatic wiring of the supply signals.&lt;p&gt;
The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<text x="-1.905" y="-3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="GND" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-panduit">
<description>&lt;b&gt;Panduit Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="057-016-0">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
series 057 contact pc board low profile headers&lt;p&gt;
angled</description>
<wire x1="-1.9" y1="-0.23" x2="-1.9" y2="5.86" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="-0.23" x2="1.9" y2="-0.23" width="0.2032" layer="21"/>
<wire x1="1.9" y1="-0.23" x2="1.9" y2="5.86" width="0.2032" layer="21"/>
<wire x1="-9.61" y1="5.22" x2="-8.91" y2="3.25" width="0.4064" layer="21"/>
<wire x1="-8.91" y1="3.25" x2="-8.21" y2="5.22" width="0.4064" layer="21"/>
<wire x1="-8.21" y1="5.22" x2="-9.61" y2="5.22" width="0.4064" layer="21"/>
<wire x1="-14.02" y1="-2.54" x2="-14.02" y2="5.86" width="0.2032" layer="21"/>
<wire x1="14.02" y1="5.86" x2="14.02" y2="-2.44" width="0.2032" layer="21"/>
<wire x1="-13.97" y1="-2.54" x2="-11.43" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="-11.43" y1="-2.54" x2="-11.43" y2="-5.98" width="0.2032" layer="21"/>
<wire x1="13.97" y1="-2.54" x2="11.43" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="11.43" y1="-2.54" x2="11.43" y2="-6.05" width="0.2032" layer="21"/>
<wire x1="11.42" y1="-6.04" x2="-11.42" y2="-6.04" width="0.2032" layer="21"/>
<wire x1="-14.02" y1="5.86" x2="14.02" y2="5.86" width="0.2032" layer="21"/>
<pad name="1" x="-8.89" y="-5.08" drill="1" shape="octagon"/>
<pad name="2" x="-8.89" y="-2.54" drill="1" shape="octagon"/>
<pad name="3" x="-6.35" y="-5.08" drill="1" shape="octagon"/>
<pad name="4" x="-6.35" y="-2.54" drill="1" shape="octagon"/>
<pad name="5" x="-3.81" y="-5.08" drill="1" shape="octagon"/>
<pad name="6" x="-3.81" y="-2.54" drill="1" shape="octagon"/>
<pad name="7" x="-1.27" y="-5.08" drill="1" shape="octagon"/>
<pad name="8" x="-1.27" y="-2.54" drill="1" shape="octagon"/>
<pad name="9" x="1.27" y="-5.08" drill="1" shape="octagon"/>
<pad name="10" x="1.27" y="-2.54" drill="1" shape="octagon"/>
<pad name="11" x="3.81" y="-5.08" drill="1" shape="octagon"/>
<pad name="12" x="3.81" y="-2.54" drill="1" shape="octagon"/>
<pad name="13" x="6.35" y="-5.08" drill="1" shape="octagon"/>
<pad name="14" x="6.35" y="-2.54" drill="1" shape="octagon"/>
<pad name="15" x="8.89" y="-5.08" drill="1" shape="octagon"/>
<pad name="16" x="8.89" y="-2.54" drill="1" shape="octagon"/>
<text x="-11.43" y="-8.89" size="1.778" layer="25">&gt;NAME</text>
<text x="-12.7" y="6.35" size="1.778" layer="27">&gt;VALUE</text>
<hole x="-17.29" y="3.66" drill="2.8"/>
<hole x="17.54" y="3.66" drill="2.8"/>
</package>
<package name="057-016-1">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
series 057 contact pc board low profile headers&lt;p&gt;
straight</description>
<wire x1="-1.9" y1="-3.32" x2="-1.9" y2="-4.03" width="0.2032" layer="21"/>
<wire x1="1.9" y1="-3.32" x2="1.9" y2="-4.03" width="0.2032" layer="21"/>
<wire x1="-11.31" y1="-1.97" x2="-10.61" y2="-3.04" width="0.4064" layer="21"/>
<wire x1="-10.61" y1="-3.04" x2="-9.91" y2="-1.97" width="0.4064" layer="21"/>
<wire x1="-9.91" y1="-1.97" x2="-11.31" y2="-1.97" width="0.4064" layer="21"/>
<wire x1="-14.02" y1="-4.1" x2="-14.02" y2="4.1" width="0.2032" layer="21"/>
<wire x1="-14.02" y1="-4.1" x2="14.02" y2="-4.1" width="0.2032" layer="21"/>
<wire x1="14.02" y1="-4.1" x2="14.02" y2="4.1" width="0.2032" layer="21"/>
<wire x1="14.02" y1="4.1" x2="-14.02" y2="4.1" width="0.2032" layer="21"/>
<wire x1="-13.22" y1="-3.3" x2="-13.22" y2="3.3" width="0.2032" layer="21"/>
<wire x1="-13.22" y1="3.3" x2="13.22" y2="3.3" width="0.2032" layer="21"/>
<wire x1="13.22" y1="3.3" x2="13.22" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="13.22" y1="-3.3" x2="1.9" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="-3.3" x2="-13.22" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="-14.02" y1="4.1" x2="-13.22" y2="3.3" width="0.2032" layer="21"/>
<wire x1="-14.02" y1="-4.1" x2="-13.22" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="14.02" y1="4.1" x2="13.22" y2="3.3" width="0.2032" layer="21"/>
<wire x1="13.22" y1="-3.3" x2="14.02" y2="-4.1" width="0.2032" layer="21"/>
<pad name="1" x="-8.89" y="-1.27" drill="1" shape="octagon"/>
<pad name="2" x="-8.89" y="1.27" drill="1" shape="octagon"/>
<pad name="3" x="-6.35" y="-1.27" drill="1" shape="octagon"/>
<pad name="4" x="-6.35" y="1.27" drill="1" shape="octagon"/>
<pad name="5" x="-3.81" y="-1.27" drill="1" shape="octagon"/>
<pad name="6" x="-3.81" y="1.27" drill="1" shape="octagon"/>
<pad name="7" x="-1.27" y="-1.27" drill="1" shape="octagon"/>
<pad name="8" x="-1.27" y="1.27" drill="1" shape="octagon"/>
<pad name="9" x="1.27" y="-1.27" drill="1" shape="octagon"/>
<pad name="10" x="1.27" y="1.27" drill="1" shape="octagon"/>
<pad name="11" x="3.81" y="-1.27" drill="1" shape="octagon"/>
<pad name="12" x="3.81" y="1.27" drill="1" shape="octagon"/>
<pad name="13" x="6.35" y="-1.27" drill="1" shape="octagon"/>
<pad name="14" x="6.35" y="1.27" drill="1" shape="octagon"/>
<pad name="15" x="8.89" y="-1.27" drill="1" shape="octagon"/>
<pad name="16" x="8.89" y="1.27" drill="1" shape="octagon"/>
<text x="-8.87" y="-6.88" size="1.778" layer="25">&gt;NAME</text>
<text x="-10.89" y="4.55" size="1.778" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="MV">
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<text x="1.016" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-2.54" y="1.905" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M">
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<text x="1.016" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="057-016-" prefix="X">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
10-pin series 057 contact pc board low profile headers</description>
<gates>
<gate name="-1" symbol="MV" x="-10.16" y="43.18" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="12.7" y="43.18" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="-10.16" y="38.1" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="12.7" y="38.1" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M" x="-10.16" y="33.02" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M" x="12.7" y="33.02" addlevel="always" swaplevel="1"/>
<gate name="-7" symbol="M" x="-10.16" y="27.94" addlevel="always" swaplevel="1"/>
<gate name="-8" symbol="M" x="12.7" y="27.94" addlevel="always" swaplevel="1"/>
<gate name="-9" symbol="M" x="-10.16" y="22.86" addlevel="always" swaplevel="1"/>
<gate name="-10" symbol="M" x="12.7" y="22.86" addlevel="always" swaplevel="1"/>
<gate name="-11" symbol="M" x="-10.16" y="17.78" addlevel="always" swaplevel="1"/>
<gate name="-12" symbol="M" x="12.7" y="17.78" addlevel="always" swaplevel="1"/>
<gate name="-13" symbol="M" x="-10.16" y="12.7" addlevel="always" swaplevel="1"/>
<gate name="-14" symbol="M" x="12.7" y="12.7" addlevel="always" swaplevel="1"/>
<gate name="-15" symbol="M" x="-10.16" y="7.62" addlevel="always" swaplevel="1"/>
<gate name="-16" symbol="M" x="12.7" y="7.62" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="0" package="057-016-0">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-13" pin="S" pad="13"/>
<connect gate="-14" pin="S" pad="14"/>
<connect gate="-15" pin="S" pad="15"/>
<connect gate="-16" pin="S" pad="16"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="1" package="057-016-1">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-13" pin="S" pad="13"/>
<connect gate="-14" pin="S" pad="14"/>
<connect gate="-15" pin="S" pad="15"/>
<connect gate="-16" pin="S" pad="16"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="J1B" library="0GlenConnectors" deviceset="PMOD-1X6-GENERIC" device=""/>
<part name="J1A" library="0GlenConnectors" deviceset="PMOD-1X6-GENERIC" device=""/>
<part name="J2A" library="0GlenConnectors" deviceset="PMOD-1X6-GENERIC" device=""/>
<part name="J2B" library="0GlenConnectors" deviceset="PMOD-1X6-GENERIC" device=""/>
<part name="SUPPLY1" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY2" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY3" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY4" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY5" library="supply2" deviceset="GND" device=""/>
<part name="J3" library="con-panduit" deviceset="057-016-" device="1"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="20.32" y="78.74" size="1.27" layer="97">J1 Pins 7-12</text>
<text x="20.32" y="106.68" size="1.27" layer="97">J1 Pins 1-6</text>
<text x="20.32" y="17.78" size="1.27" layer="97">J2 Pins 1-6</text>
<text x="20.32" y="45.72" size="1.27" layer="97">J2 Pins 7-12</text>
</plain>
<instances>
<instance part="J1B" gate="G$1" x="25.4" y="96.52"/>
<instance part="J1A" gate="G$1" x="25.4" y="124.46"/>
<instance part="J2A" gate="G$1" x="25.4" y="63.5"/>
<instance part="J2B" gate="G$1" x="25.4" y="35.56"/>
<instance part="SUPPLY1" gate="GND" x="40.64" y="111.76"/>
<instance part="SUPPLY2" gate="GND" x="40.64" y="83.82"/>
<instance part="SUPPLY3" gate="GND" x="40.64" y="50.8"/>
<instance part="SUPPLY4" gate="GND" x="40.64" y="22.86"/>
<instance part="SUPPLY5" gate="GND" x="134.62" y="63.5"/>
<instance part="J3" gate="-1" x="99.06" y="88.9"/>
<instance part="J3" gate="-2" x="114.3" y="88.9" rot="R180"/>
<instance part="J3" gate="-3" x="99.06" y="86.36"/>
<instance part="J3" gate="-4" x="114.3" y="86.36" rot="R180"/>
<instance part="J3" gate="-5" x="99.06" y="83.82"/>
<instance part="J3" gate="-6" x="114.3" y="83.82" rot="R180"/>
<instance part="J3" gate="-7" x="99.06" y="81.28"/>
<instance part="J3" gate="-8" x="114.3" y="81.28" rot="R180"/>
<instance part="J3" gate="-9" x="99.06" y="78.74"/>
<instance part="J3" gate="-10" x="114.3" y="78.74" rot="R180"/>
<instance part="J3" gate="-11" x="99.06" y="76.2"/>
<instance part="J3" gate="-12" x="114.3" y="76.2" rot="R180"/>
<instance part="J3" gate="-13" x="99.06" y="73.66"/>
<instance part="J3" gate="-14" x="114.3" y="73.66" rot="R180"/>
<instance part="J3" gate="-15" x="99.06" y="71.12"/>
<instance part="J3" gate="-16" x="114.3" y="71.12" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="R1" class="0">
<segment>
<pinref part="J1A" gate="G$1" pin="1"/>
<label x="40.64" y="129.54" size="1.27" layer="95"/>
<wire x1="38.1" y1="129.54" x2="86.36" y2="129.54" width="0.1524" layer="91"/>
<wire x1="86.36" y1="129.54" x2="86.36" y2="88.9" width="0.1524" layer="91"/>
<wire x1="86.36" y1="88.9" x2="93.98" y2="88.9" width="0.1524" layer="91"/>
<label x="88.9" y="88.9" size="1.27" layer="95"/>
<pinref part="J3" gate="-1" pin="S"/>
</segment>
</net>
<net name="G1" class="0">
<segment>
<pinref part="J1A" gate="G$1" pin="2"/>
<label x="40.64" y="127" size="1.27" layer="95"/>
<wire x1="38.1" y1="127" x2="134.62" y2="127" width="0.1524" layer="91"/>
<wire x1="134.62" y1="127" x2="134.62" y2="88.9" width="0.1524" layer="91"/>
<wire x1="134.62" y1="88.9" x2="119.38" y2="88.9" width="0.1524" layer="91"/>
<label x="121.92" y="88.9" size="1.27" layer="95"/>
<pinref part="J3" gate="-2" pin="S"/>
</segment>
</net>
<net name="B1" class="0">
<segment>
<pinref part="J1A" gate="G$1" pin="3"/>
<label x="40.64" y="124.46" size="1.27" layer="95"/>
<wire x1="93.98" y1="86.36" x2="83.82" y2="86.36" width="0.1524" layer="91"/>
<wire x1="83.82" y1="86.36" x2="83.82" y2="124.46" width="0.1524" layer="91"/>
<wire x1="83.82" y1="124.46" x2="38.1" y2="124.46" width="0.1524" layer="91"/>
<label x="88.9" y="86.36" size="1.27" layer="95"/>
<pinref part="J3" gate="-3" pin="S"/>
</segment>
</net>
<net name="R2" class="0">
<segment>
<pinref part="J1B" gate="G$1" pin="1"/>
<label x="40.64" y="101.6" size="1.27" layer="95"/>
<wire x1="38.1" y1="101.6" x2="81.28" y2="101.6" width="0.1524" layer="91"/>
<wire x1="81.28" y1="101.6" x2="81.28" y2="83.82" width="0.1524" layer="91"/>
<wire x1="81.28" y1="83.82" x2="93.98" y2="83.82" width="0.1524" layer="91"/>
<label x="88.9" y="83.82" size="1.27" layer="95"/>
<pinref part="J3" gate="-5" pin="S"/>
</segment>
</net>
<net name="G2" class="0">
<segment>
<pinref part="J1B" gate="G$1" pin="2"/>
<label x="40.64" y="99.06" size="1.27" layer="95"/>
<wire x1="38.1" y1="99.06" x2="132.08" y2="99.06" width="0.1524" layer="91"/>
<wire x1="132.08" y1="99.06" x2="132.08" y2="83.82" width="0.1524" layer="91"/>
<wire x1="132.08" y1="83.82" x2="119.38" y2="83.82" width="0.1524" layer="91"/>
<label x="121.92" y="83.82" size="1.27" layer="95"/>
<pinref part="J3" gate="-6" pin="S"/>
</segment>
</net>
<net name="B2" class="0">
<segment>
<pinref part="J1B" gate="G$1" pin="3"/>
<label x="40.64" y="96.52" size="1.27" layer="95"/>
<wire x1="38.1" y1="96.52" x2="78.74" y2="96.52" width="0.1524" layer="91"/>
<wire x1="78.74" y1="96.52" x2="78.74" y2="81.28" width="0.1524" layer="91"/>
<wire x1="78.74" y1="81.28" x2="93.98" y2="81.28" width="0.1524" layer="91"/>
<label x="88.9" y="81.28" size="1.27" layer="95"/>
<pinref part="J3" gate="-7" pin="S"/>
</segment>
</net>
<net name="A1" class="0">
<segment>
<pinref part="J2A" gate="G$1" pin="1"/>
<label x="40.64" y="68.58" size="1.27" layer="95"/>
<wire x1="38.1" y1="68.58" x2="76.2" y2="68.58" width="0.1524" layer="91"/>
<wire x1="76.2" y1="68.58" x2="76.2" y2="78.74" width="0.1524" layer="91"/>
<wire x1="76.2" y1="78.74" x2="93.98" y2="78.74" width="0.1524" layer="91"/>
<label x="88.9" y="78.74" size="1.27" layer="95"/>
<pinref part="J3" gate="-9" pin="S"/>
</segment>
</net>
<net name="A2" class="0">
<segment>
<pinref part="J2A" gate="G$1" pin="2"/>
<label x="40.64" y="66.04" size="1.27" layer="95"/>
<wire x1="38.1" y1="66.04" x2="132.08" y2="66.04" width="0.1524" layer="91"/>
<wire x1="132.08" y1="66.04" x2="132.08" y2="78.74" width="0.1524" layer="91"/>
<wire x1="132.08" y1="78.74" x2="119.38" y2="78.74" width="0.1524" layer="91"/>
<label x="121.92" y="78.74" size="1.27" layer="95"/>
<pinref part="J3" gate="-10" pin="S"/>
</segment>
</net>
<net name="A3" class="0">
<segment>
<pinref part="J2A" gate="G$1" pin="3"/>
<label x="40.64" y="63.5" size="1.27" layer="95"/>
<wire x1="38.1" y1="63.5" x2="78.74" y2="63.5" width="0.1524" layer="91"/>
<wire x1="78.74" y1="63.5" x2="78.74" y2="76.2" width="0.1524" layer="91"/>
<wire x1="78.74" y1="76.2" x2="93.98" y2="76.2" width="0.1524" layer="91"/>
<label x="88.9" y="76.2" size="1.27" layer="95"/>
<pinref part="J3" gate="-11" pin="S"/>
</segment>
</net>
<net name="A4" class="0">
<segment>
<pinref part="J2A" gate="G$1" pin="4"/>
<label x="40.64" y="60.96" size="1.27" layer="95"/>
<wire x1="38.1" y1="60.96" x2="129.54" y2="60.96" width="0.1524" layer="91"/>
<wire x1="129.54" y1="60.96" x2="129.54" y2="76.2" width="0.1524" layer="91"/>
<wire x1="129.54" y1="76.2" x2="119.38" y2="76.2" width="0.1524" layer="91"/>
<label x="121.92" y="76.2" size="1.27" layer="95"/>
<pinref part="J3" gate="-12" pin="S"/>
</segment>
</net>
<net name="BLANK" class="0">
<segment>
<pinref part="J2B" gate="G$1" pin="1"/>
<label x="40.64" y="40.64" size="1.27" layer="95"/>
<wire x1="38.1" y1="40.64" x2="83.82" y2="40.64" width="0.1524" layer="91"/>
<wire x1="83.82" y1="40.64" x2="83.82" y2="71.12" width="0.1524" layer="91"/>
<wire x1="83.82" y1="71.12" x2="93.98" y2="71.12" width="0.1524" layer="91"/>
<label x="88.9" y="71.12" size="1.27" layer="95"/>
<pinref part="J3" gate="-15" pin="S"/>
</segment>
</net>
<net name="LATCH" class="0">
<segment>
<pinref part="J2B" gate="G$1" pin="2"/>
<label x="40.64" y="38.1" size="1.27" layer="95"/>
<wire x1="38.1" y1="38.1" x2="127" y2="38.1" width="0.1524" layer="91"/>
<wire x1="127" y1="38.1" x2="127" y2="73.66" width="0.1524" layer="91"/>
<wire x1="127" y1="73.66" x2="119.38" y2="73.66" width="0.1524" layer="91"/>
<label x="121.92" y="73.66" size="1.27" layer="95"/>
<pinref part="J3" gate="-14" pin="S"/>
</segment>
</net>
<net name="SCLK" class="0">
<segment>
<pinref part="J2B" gate="G$1" pin="3"/>
<label x="40.64" y="35.56" size="1.27" layer="95"/>
<wire x1="38.1" y1="35.56" x2="81.28" y2="35.56" width="0.1524" layer="91"/>
<wire x1="81.28" y1="35.56" x2="81.28" y2="73.66" width="0.1524" layer="91"/>
<wire x1="81.28" y1="73.66" x2="93.98" y2="73.66" width="0.1524" layer="91"/>
<label x="88.9" y="73.66" size="1.27" layer="95"/>
<pinref part="J3" gate="-13" pin="S"/>
</segment>
</net>
<net name="A5" class="0">
<segment>
<pinref part="J2B" gate="G$1" pin="4"/>
<label x="40.64" y="33.02" size="1.27" layer="95"/>
<wire x1="38.1" y1="33.02" x2="139.7" y2="33.02" width="0.1524" layer="91"/>
<wire x1="139.7" y1="33.02" x2="139.7" y2="81.28" width="0.1524" layer="91"/>
<wire x1="139.7" y1="81.28" x2="119.38" y2="81.28" width="0.1524" layer="91"/>
<label x="121.92" y="81.28" size="1.27" layer="95"/>
<pinref part="J3" gate="-8" pin="S"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="J1A" gate="G$1" pin="GND@1"/>
<wire x1="38.1" y1="119.38" x2="40.64" y2="119.38" width="0.1524" layer="91"/>
<wire x1="40.64" y1="119.38" x2="40.64" y2="114.3" width="0.1524" layer="91"/>
<pinref part="SUPPLY1" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="J1B" gate="G$1" pin="GND@1"/>
<wire x1="38.1" y1="91.44" x2="40.64" y2="91.44" width="0.1524" layer="91"/>
<wire x1="40.64" y1="91.44" x2="40.64" y2="86.36" width="0.1524" layer="91"/>
<pinref part="SUPPLY2" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="J2A" gate="G$1" pin="GND@1"/>
<wire x1="38.1" y1="58.42" x2="40.64" y2="58.42" width="0.1524" layer="91"/>
<wire x1="40.64" y1="58.42" x2="40.64" y2="53.34" width="0.1524" layer="91"/>
<pinref part="SUPPLY3" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="J2B" gate="G$1" pin="GND@1"/>
<wire x1="38.1" y1="30.48" x2="40.64" y2="30.48" width="0.1524" layer="91"/>
<wire x1="40.64" y1="30.48" x2="40.64" y2="25.4" width="0.1524" layer="91"/>
<pinref part="SUPPLY4" gate="GND" pin="GND"/>
</segment>
<segment>
<wire x1="119.38" y1="86.36" x2="134.62" y2="86.36" width="0.1524" layer="91"/>
<wire x1="134.62" y1="86.36" x2="134.62" y2="71.12" width="0.1524" layer="91"/>
<label x="121.92" y="86.36" size="1.27" layer="95"/>
<wire x1="134.62" y1="71.12" x2="134.62" y2="66.04" width="0.1524" layer="91"/>
<wire x1="119.38" y1="71.12" x2="134.62" y2="71.12" width="0.1524" layer="91"/>
<junction x="134.62" y="71.12"/>
<pinref part="SUPPLY5" gate="GND" pin="GND"/>
<label x="121.92" y="71.12" size="1.27" layer="95"/>
<pinref part="J3" gate="-4" pin="S"/>
<pinref part="J3" gate="-16" pin="S"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
