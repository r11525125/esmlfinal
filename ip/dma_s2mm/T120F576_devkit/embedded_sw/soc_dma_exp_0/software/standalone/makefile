SUBDIRS := 	dhrystone \
		blinkAndEcho \
		bootloader \
		EfxApb3Example \
		EfxAxi4Example \
		i2cDemo \
		readFlash \
		spiDemo \
		memTest \
		timerAndGpioInterruptDemo \
		userInterruptDemo \
		uartInterruptDemo \
		writeFlash 

all:
	for dir in $(SUBDIRS); do \
		(cd $$dir; ${MAKE} all); \
	done

clean:
	for dir in $(SUBDIRS); do \
		(cd $$dir; ${MAKE} clean); \
	done

.PHONY: all $(SUBDIRS)
