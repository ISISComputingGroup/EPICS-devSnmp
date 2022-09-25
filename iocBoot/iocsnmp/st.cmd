
# executable path is below...
# ../../bin/linux-x86/snmp

< envPaths
cd "${TOP}"
epicsEnvSet("MIBDIRS", "+$(TOP)/mibs")
epicsEnvSet("W", "WIENER-CRATE-MIB::")

dbLoadDatabase("dbd/snmp.dbd")
snmp_registerRecordDeviceDriver(pdbbase)

devSnmpSetSnmpVersion(130.246.53.29,SNMP_VERSION_1)
devSnmpSetSnmpVersion(130.246.39.191,SNMP_VERSION_1)
dbLoadRecords("db/moxa.db","DEV=TestChan,HOST=130.246.53.29,HOST2=130.246.39.191,CHAN=u300,GROUP=0")

cd "${TOP}/iocBoot/${IOC}"
iocInit()
