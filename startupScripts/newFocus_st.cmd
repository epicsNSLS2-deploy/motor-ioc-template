#!_/newFocus

< unique.cmd
errlogInit(20000)

< envPaths

dbLoadDatabase "$(MOTOR)/modules/motorNewFocus/iocs/newFocusIOC/dbd/newFocus.dbd"
newFocus_registerRecordDeviceDriver pdbbase

## motorUtil (allstop & alldone)
dbLoadRecords("$(MOTOR)/db/motorUtil.db", "P=$(PREFIX)")

# Setup IP port for 8743 
drvAsynIPPortConfigure("$(PORT)", "$(MC_CONNECT)")
asynOctetSetInputEos("$(PORT)",0,"\r\n")
asynOctetSetOutputEos("$(PORT)",0,"\r")

#db asyn debug traces
asynSetTraceMask("$(PORT)",-1,0x1)
asynSetTraceIOMask("$(PORT)",-1,0x1)


# New Focus Picomotor Network Controller (model 87xx) configuration parameters:  
#     (1) IP asyn port name (string)
#     (2) Controller asyn port name (string)	
#     (3) Number of axes
#     (4) Moving poll period (ms)
#     (5) Idle poll period (ms)
nf874xCreateController("$(CONTROLLER_PORT)", "$(PORT)", 2, 200, 1000)

## Load record instances
dbLoadTemplate("newfocus.asyn.motor.substitutions")

dbLoadRecords("${ASYN}/db/asynRecord.db", "P=$(MC_PREFIX),R=Asyn,PORT=$(PORT),ADDR=,OMAX=80,IMAX=80")

set_requestfile_path("$(MOTOR)/motorApp/Db")

## autosave/restore machinery
#save_restoreSet_Debug(0)
#save_restoreSet_IncompleteSetsOk(1)
#save_restoreSet_DatedBackupFiles(1)

#set_savefile_path("${TOP}/as","/save")
#set_requestfile_path("${TOP}/as","/req")

#set_pass0_restoreFile("info_positions.sav")
#set_pass0_restoreFile("info_settings.sav")
#set_pass1_restoreFile("info_settings.sav")

iocInit()

## more autosave/restore machinery
#cd ${TOP}/as/req
#makeAutosaveFiles()
#create_monitor_set("info_positions.req", 5 , "")
#create_monitor_set("info_settings.req", 15 , "")

cd ${TOP}
dbl > ./records.dbl
