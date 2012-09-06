LOCAL_PATH := $(call my-dir)
RK_RECOVERYIMAGE_CFG := device/mediacom/mp850i/recoveryimg.cfg

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_INS}"Made boot image: $@"${CL_RST}

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo "----- Making crc recovery image ------"
	rkcrc -k $(recovery_ramdisk) $@_slim
	@echo "----- Making recovery image with kernel ------"
	abootimg --create $@ -f $(RK_RECOVERYIMAGE_CFG) -k $(recovery_kernel) -r $(recovery_ramdisk)
  @echo -e ${CL_INS}"Made recovery image: $@"${CL_RST}
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
