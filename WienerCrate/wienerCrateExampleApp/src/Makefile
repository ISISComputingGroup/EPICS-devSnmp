TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = wienerCrateExample

#
# Pick up the net-snmp support
#
USR_CFLAGS_Linux += `net-snmp-config --cflags`
USR_LDFLAGS_Linux += `net-snmp-config --libs`
PROD_LDLIBS_Linux += `net-snmp-config --libs`

# wienerCrateExample.dbd will be created and installed
DBD += wienerCrateExample.dbd

# wienerCrateExample.dbd will be made up from these files:
wienerCrateExample_DBD += base.dbd

# Include dbd files from all support applications:
wienerCrateExample_DBD += devSnmp.dbd

# Add all the support libraries needed by this IOC
wienerCrateExample_LIBS += devSnmp

# wienerCrateExample_registerRecordDeviceDriver.cpp derives from wienerCrateExample.dbd
wienerCrateExample_SRCS += wienerCrateExample_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
wienerCrateExample_SRCS_DEFAULT += wienerCrateExampleMain.cpp
wienerCrateExample_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#wienerCrateExample_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
wienerCrateExample_LIBS += netsnmp zlib
wienerCrateExample_LIBS += $(EPICS_BASE_IOC_LIBS)
wienerCrateExample_SYS_LIBS_WIN32 += crypt32
# following needed to find OpenSSL library that is auto-linked via #pragma in net-snmp headers
wienerCrateExample_LDFLAGS_WIN32 += -libpath:$(OPENSSL)/lib/$(EPICS_HOST_ARCH)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

