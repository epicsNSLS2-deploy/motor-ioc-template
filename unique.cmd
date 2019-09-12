# ###############################################################
#                                                               #
#  File containing Unique IOC parameters                        #
#  Based on motor-ioc-template, autopopulated by initMotorIOCs  #
#  https://github.com/epicsNSLS2-deploy                         #
#                                                               #
# ###############################################################


# Set this to the folder for support.
# Two supported formats: 
# base and support in one directory
# base inside support (ex. base, asyn, areaDetector, etc. all in same dir)
epicsEnvSet("SUPPORT_DIR", "/epics/epics_motor/support")

# Maintainer
epicsEnvSet("ENGINEER", "KGofron")

# IOC Information
epicsEnvSet("IOC", "pico97")

epicsEnvSet("PORT",   "P0")
epicsEnvSet("CONTROLLER_PORT", "M0")

epicsEnvSet("MC",   "MC:37")
epicsEnvSet("CT",   "XF:10IDC-CT")
epicsEnvSet("PREFIX", "XF:10IDC-OP{IOC:MC37}")
epicsEnvSet("MC_PREFIX", "$(CT){$(MC)}")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",  "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST", "10.10.0.255")

# Identify which connection camera IOC uses
epicsEnvSet("MC_CONNECT", "10.10.2.97:23")

# PV and IOC Name configs
epicsEnvSet("HOSTNAME", "xf10idb-ioc1")
epicsEnvSet("IOCNAME", "pico97")
