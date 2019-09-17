#!../../bin/linux-x86_64/motorSim

< unique.cmd
errlogInit(20000)
< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "$(MOTOR)/modules/motorMotorSim/iocs/motorSimIOC/dbd/motorSim.dbd"
motorSim_registerRecordDeviceDriver pdbbase

dbLoadTemplate("motor.substitutions")

# Create simulated motors: ( start card , start axis , low limit, high limit, home posn, # cards, # axes to setup)
motorSimCreate( 0, 0, -32000, 32000, 0, 1, 4 )
# Setup the Asyn layer (portname, low-level driver drvet name, card, number of axes on card)
drvAsynMotorConfigure("$(PORT)", "motorSim", 0, 4)


## motorUtil (allstop & alldone)
dbLoadRecords("$(MOTOR)/db/motorUtil.db", "P=$(PREFIX)")

##

iocInit

## motorUtil (allstop & alldone)
motorUtilInit("$(PREFIX)")

# Boot complete