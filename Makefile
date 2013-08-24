#xst -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -ifn "/home/cstratton/proj/fpgatest/top.xst" -ofn "/home/cstratton/proj/fpgatest/top.syr" 
#xst -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -ifn "/home/cstratton/proj/fpgatest/top.xst" -ofn "/home/cstratton/proj/fpgatest/top.syr" 
#xst -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -ifn "/home/cstratton/proj/fpgatest/top.xst" -ofn "/home/cstratton/proj/fpgatest/top.syr" 
#ngdbuild -ise "fpgatest.ise" -intstyle ise -dd _ngo -nt timestamp -i -p xc3s100e-vq100-4 top.ngc top.ngd  
#map -ise "fpgatest.ise" -intstyle ise -p xc3s100e-vq100-4 -cm area -ir off -pr off -c 100 -o top_map.ncd top.ngd top.pcf 
#par -ise "fpgatest.ise" -w -intstyle ise -ol std -t 1 top_map.ncd top.ncd top.pcf 
#trce -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -v 3 -s 4 -fastpaths -xml top.twx top.ncd -o top.twr top.pcf 
#ngdbuild -ise "fpgatest.ise" -intstyle ise -dd _ngo -nt timestamp -i -p xc3s100e-vq100-4 top.ngc top.ngd  
#ngdbuild -ise "fpgatest.ise" -intstyle ise -dd _ngo -nt timestamp -i -p xc3s100e-vq100-4 top.ngc top.ngd  
#ngdbuild -ise "fpgatest.ise" -intstyle ise -dd _ngo -nt timestamp -i -p xc3s100e-vq100-4 top.ngc top.ngd  
#xst -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -ifn "/home/cstratton/proj/fpgatest/top.xst" -ofn "/home/cstratton/proj/fpgatest/top.syr" 
#ngdbuild -ise "fpgatest.ise" -intstyle ise -dd _ngo -nt timestamp -i -p xc3s100e-vq100-4 top.ngc top.ngd  
#map -ise "fpgatest.ise" -intstyle ise -p xc3s100e-vq100-4 -cm area -ir off -pr off -c 100 -o top_map.ncd top.ngd top.pcf 
#par -ise "fpgatest.ise" -w -intstyle ise -ol std -t 1 top_map.ncd top.ncd top.pcf 
#trce -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -v 3 -s 4 -fastpaths -xml top.twx top.ncd -o top.twr top.pcf -ucf top.ucf 
#bitgen -ise "fpgatest.ise" -intstyle ise -f top.ut top.ncd 
#bitgen -ise "fpgatest.ise" -intstyle ise -f top.ut top.ncd 
#xst -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -ifn "/home/cstratton/proj/fpgatest/top.xst" -ofn "/home/cstratton/proj/fpgatest/top.syr" 
#xst -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -ifn "/home/cstratton/proj/fpgatest/top.xst" -ofn "/home/cstratton/proj/fpgatest/top.syr" 
#xst -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -ifn "/home/cstratton/proj/fpgatest/top.xst" -ofn "/home/cstratton/proj/fpgatest/top.syr" 
#xst -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -ifn "/home/cstratton/proj/fpgatest/top.xst" -ofn "/home/cstratton/proj/fpgatest/top.syr" 
XILINX = /opt/Xilinx/11.1/ISE
XILBIN = $(XILINX)/bin/lin64
DESIGN = fpgatest
PROJDIR=/home/cstratton/proj/fpga2
XISE = $(PROJDIR)/$(DESIGN).xise
ISE = $(DESIGN).ise
TOP = top
SRCS = top.v
UCF = top.ucf
XST = $(PROJDIR)/$(TOP).xst
PRJ = $(PROJDIR)/$(TOP).prj
LSO = $(PROJDIR)/$(TOP).lso
#SYN = $(PROJDRI)/$(TOP).syn
UT = $(TOP).ut
NEEDS = $(SRCS) $(XISE) $(UCF) $(XST) $(PRJ) $(LSO) $(UT) #Makefile

all: bit

clean: 	
	rm -rf $(DESIGN)_xdb
	rm -rf _ngo
	rm -rf xst
	rm -f *.twr *.bgn *.bld *.drc *.map *.mrp *.ncd *.ngm
	rm -f *.xrpt *.ncd *.ngc *.ngc *.ngr 
	rm -rf $(TOP)_pad.csv $(TOP)_pad.txt *.par $(TOP).pcf
	rm -rf *.ptwx $(TOP)_summary.xml *.syr *.syn 
	rm -rf *.twx *.unroutes $(TOP)_usage.xml *.xpi

$(TOP).syr: $(NEEDS) $(SRCS)
#xst -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -ifn "/home/cstratton/proj/fpgatest/top.xst" -ofn "/home/cstratton/proj/fpgatest/top.syr" 

	rm -rf xst
	mkdir xst
	mkdir xst/projnav.tmp
	$(XILBIN)/xst -ise $(PROJDIR)/$(ISE) -intstyle ise -ifn $(XST) -ofn $(PROJDIR)/$(TOP).syr 

#ngdbuild -ise "fpgatest.ise" -intstyle ise -dd _ngo -nt timestamp -i -p xc3s100e-vq100-4 top.ngc top.ngd  
#ngdbuild -ise "fpgatest.ise" -intstyle ise -dd _ngo -nt timestamp -i -p xc3s100e-vq100-4 top.ngc top.ngd  
#ngdbuild -ise fpgatest.xise -intstyle ise -dd _ngo -nt timestamp -i -p xc3s100e-vq100-4 top.ngc top.ngd

$(TOP).ngd:	$(TOP).syr $(NEEDS)
#	$(XILBIN)/ngdbuild -ise $(XISE) -intstyle ise -dd _ngo -nt timestamp -i -p xc3s100e-vq100-4 $(PROJDIR)/$(TOP).ngc $(PROJDIR)/$(TOP).ngd 
	$(XILBIN)/ngdbuild -ise $(ISE) -intstyle ise -dd _ngo -nt timestamp -i -p xc3s100e-vq100-4 $(TOP).ngc $(TOP).ngd 

$(TOP).ngc: $(TOP).ngd

#map -ise "fpgatest.ise" -intstyle ise -p xc3s100e-vq100-4 -cm area -ir off -pr off -c 100 -o top_map.ncd top.ngd top.pcf 
$(TOP)_map.ncd: $(TOP).ngd $(NEEDS)
	$(XILBIN)/map -ise $(ISE) -intstyle ise -p xc3s100e-vq100-4 -cm area -ir off -pr off -c 100 -o $(TOP)_map.ncd $(TOP).ngd $(TOP).pcf 

#par -ise "fpgatest.ise" -w -intstyle ise -ol std -t 1 top_map.ncd top.ncd top.pcf 
#par -ise fpgatest.ise -w -intstyle ise -ol std -t 1 top_map.ncd top.ncd top.pcf
$(TOP).pcf: $(TOP)_map.ncd $(NEEDS)
	$(XILBIN)/par -ise $(ISE) -w -intstyle ise -ol std -t 1 $(TOP)_map.ncd $(TOP).ncd $(TOP).pcf

$(TOP).ncd: $(TOP).pcf

#trce -ise "/home/cstratton/proj/fpgatest/fpgatest.ise" -intstyle ise -v 3 -s 4 -fastpaths -xml top.twx top.ncd -o top.twr top.pcf -ucf top.ucf 
$(TOP).twr: $(TOP).ncd $(NEEDS)
	$(XILBIN)/trce -ise $(PROJDIR)/$(ISE) -intstyle ise -v 3 -s 4 -fastpaths -xml $(TOP).twx $(TOP).ncd -o $(TOP).twr $(TOP).pcf -ucf $(UCF)

#bitgen -ise "fpgatest.ise" -intstyle ise -f top.ut top.ncd 
bit:	$(TOP).twr $(NEEDS) $(UT)
	$(XILBIN)/bitgen -ise $(ISE) -intstyle ise -f $(TOP).ut $(TOP).ncd

