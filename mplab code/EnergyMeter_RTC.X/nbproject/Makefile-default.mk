#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/EnergyMeter_RTC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/EnergyMeter_RTC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=energymeter_lcd_rtc.c DS13071.c I2C.c LCD.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/energymeter_lcd_rtc.p1 ${OBJECTDIR}/DS13071.p1 ${OBJECTDIR}/I2C.p1 ${OBJECTDIR}/LCD.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/energymeter_lcd_rtc.p1.d ${OBJECTDIR}/DS13071.p1.d ${OBJECTDIR}/I2C.p1.d ${OBJECTDIR}/LCD.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/energymeter_lcd_rtc.p1 ${OBJECTDIR}/DS13071.p1 ${OBJECTDIR}/I2C.p1 ${OBJECTDIR}/LCD.p1

# Source Files
SOURCEFILES=energymeter_lcd_rtc.c DS13071.c I2C.c LCD.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/EnergyMeter_RTC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16F877A
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/energymeter_lcd_rtc.p1: energymeter_lcd_rtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	${MP_CC} --pass1 energymeter_lcd_rtc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,-speed,+space,-debug,9 -D__DEBUG   --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@${MP_CC} --scandep  energymeter_lcd_rtc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --opt=default,+asm,-asmfile,-speed,+space,-debug,9 -D__DEBUG   --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@echo ${OBJECTDIR}/energymeter_lcd_rtc.p1: > ${OBJECTDIR}/energymeter_lcd_rtc.p1.d
	@cat ${OBJECTDIR}/energymeter_lcd_rtc.dep >> ${OBJECTDIR}/energymeter_lcd_rtc.p1.d
	@${FIXDEPS} "${OBJECTDIR}/energymeter_lcd_rtc.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DS13071.p1: DS13071.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	${MP_CC} --pass1 DS13071.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,-speed,+space,-debug,9 -D__DEBUG   --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@${MP_CC} --scandep  DS13071.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --opt=default,+asm,-asmfile,-speed,+space,-debug,9 -D__DEBUG   --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@echo ${OBJECTDIR}/DS13071.p1: > ${OBJECTDIR}/DS13071.p1.d
	@cat ${OBJECTDIR}/DS13071.dep >> ${OBJECTDIR}/DS13071.p1.d
	@${FIXDEPS} "${OBJECTDIR}/DS13071.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/I2C.p1: I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	${MP_CC} --pass1 I2C.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,-speed,+space,-debug,9 -D__DEBUG   --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@${MP_CC} --scandep  I2C.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --opt=default,+asm,-asmfile,-speed,+space,-debug,9 -D__DEBUG   --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@echo ${OBJECTDIR}/I2C.p1: > ${OBJECTDIR}/I2C.p1.d
	@cat ${OBJECTDIR}/I2C.dep >> ${OBJECTDIR}/I2C.p1.d
	@${FIXDEPS} "${OBJECTDIR}/I2C.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/LCD.p1: LCD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	${MP_CC} --pass1 LCD.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,-speed,+space,-debug,9 -D__DEBUG   --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@${MP_CC} --scandep  LCD.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --opt=default,+asm,-asmfile,-speed,+space,-debug,9 -D__DEBUG   --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@echo ${OBJECTDIR}/LCD.p1: > ${OBJECTDIR}/LCD.p1.d
	@cat ${OBJECTDIR}/LCD.dep >> ${OBJECTDIR}/LCD.p1.d
	@${FIXDEPS} "${OBJECTDIR}/LCD.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/energymeter_lcd_rtc.p1: energymeter_lcd_rtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	${MP_CC} --pass1 energymeter_lcd_rtc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,-speed,+space,-debug,9  --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@${MP_CC} --scandep  energymeter_lcd_rtc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --opt=default,+asm,-asmfile,-speed,+space,-debug,9  --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@echo ${OBJECTDIR}/energymeter_lcd_rtc.p1: > ${OBJECTDIR}/energymeter_lcd_rtc.p1.d
	@cat ${OBJECTDIR}/energymeter_lcd_rtc.dep >> ${OBJECTDIR}/energymeter_lcd_rtc.p1.d
	@${FIXDEPS} "${OBJECTDIR}/energymeter_lcd_rtc.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DS13071.p1: DS13071.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	${MP_CC} --pass1 DS13071.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,-speed,+space,-debug,9  --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@${MP_CC} --scandep  DS13071.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --opt=default,+asm,-asmfile,-speed,+space,-debug,9  --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@echo ${OBJECTDIR}/DS13071.p1: > ${OBJECTDIR}/DS13071.p1.d
	@cat ${OBJECTDIR}/DS13071.dep >> ${OBJECTDIR}/DS13071.p1.d
	@${FIXDEPS} "${OBJECTDIR}/DS13071.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/I2C.p1: I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	${MP_CC} --pass1 I2C.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,-speed,+space,-debug,9  --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@${MP_CC} --scandep  I2C.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --opt=default,+asm,-asmfile,-speed,+space,-debug,9  --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@echo ${OBJECTDIR}/I2C.p1: > ${OBJECTDIR}/I2C.p1.d
	@cat ${OBJECTDIR}/I2C.dep >> ${OBJECTDIR}/I2C.p1.d
	@${FIXDEPS} "${OBJECTDIR}/I2C.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/LCD.p1: LCD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	${MP_CC} --pass1 LCD.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,-speed,+space,-debug,9  --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@${MP_CC} --scandep  LCD.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 -I"../1_Sem_program" -I"." --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --opt=default,+asm,-asmfile,-speed,+space,-debug,9  --double=24 --float=24 --addrqual=ignore --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	@echo ${OBJECTDIR}/LCD.p1: > ${OBJECTDIR}/LCD.p1.d
	@cat ${OBJECTDIR}/LCD.dep >> ${OBJECTDIR}/LCD.p1.d
	@${FIXDEPS} "${OBJECTDIR}/LCD.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/EnergyMeter_RTC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) -odist/${CND_CONF}/${IMAGE_TYPE}/EnergyMeter_RTC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  -mdist/${CND_CONF}/${IMAGE_TYPE}/EnergyMeter_RTC.X.${IMAGE_TYPE}.map --summary=default,-psect,-class,+mem,-hex --chip=$(MP_PROCESSOR_OPTION) -P --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,-speed,+space,-debug,9 -D__DEBUG  -N31 -I"../1_Sem_program" -I"." --warn=0  --double=24 --float=24 --addrqual=ignore --mode=pro --output=default,-inhx032 -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s" ${OBJECTFILES_QUOTED_IF_SPACED}  
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/EnergyMeter_RTC.X.${IMAGE_TYPE}.hex
else
dist/${CND_CONF}/${IMAGE_TYPE}/EnergyMeter_RTC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) -odist/${CND_CONF}/${IMAGE_TYPE}/EnergyMeter_RTC.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -mdist/${CND_CONF}/${IMAGE_TYPE}/EnergyMeter_RTC.X.${IMAGE_TYPE}.map --summary=default,-psect,-class,+mem,-hex --chip=$(MP_PROCESSOR_OPTION) -P --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,-speed,+space,-debug,9 -N31 -I"../1_Sem_program" -I"." --warn=0  --double=24 --float=24 --addrqual=ignore --mode=pro --output=default,-inhx032 -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s" ${OBJECTFILES_QUOTED_IF_SPACED}  
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
