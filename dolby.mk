#
# Copyright (C) 2022 FlamingoOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Dolby path
DOLBY_PATH := hardware/dolby

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
   $(DOLBY_PATH)

# Enable codec support
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DOLBY_PATH)/sepolicy/vendor

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DOLBY_PATH)/dolby_framework_matrix.xml
DEVICE_MANIFEST_FILE += $(DOLBY_PATH)/vendor.dolby.hardware.dms@2.0-service.xml
    
# Configs
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/configs/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml \
    $(DOLBY_PATH)/configs/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml

# Dolby VNDK libs
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v33/arm/arch-arm-armv7-a-neon/shared/vndk-core/libstagefright_foundation.so:$(TARGET_COPY_OUT_VENDOR)/lib/libstagefright_foundation-v33.so \
    prebuilts/vndk/v33/arm64/arch-arm64-armv8-a/shared/vndk-core/libstagefright_foundation.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstagefright_foundation-v33.so

# Overlays    
PRODUCT_PACKAGES += \
    DolbyFrameworksResCommon

# Spatial Audio
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/configs/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.dynamic.head_tracker.xml \

# Spatial Audio: optimize spatializer effect
PRODUCT_PROPERTY_OVERRIDES += \
       audio.spatializer.effect.util_clamp_min=300

# Spatial Audio: declare use of spatial audio
PRODUCT_PROPERTY_OVERRIDES += \
       ro.audio.spatializer_enabled=true \
       ro.audio.headtracking_enabled=true \
       ro.audio.spatializer_transaural_enabled_default=false \
       persist.vendor.audio.spatializer.speaker_enabled=true \

# Media C2 Vendor
PRODUCT_PACKAGES += \
    libcodec2_hidl@1.0.vendor \
    libcodec2_soft_common.vendor \
    libstagefright_softomx.vendor \
    libstagefright_softomx_plugin.vendor \

# Dolby Props
PRODUCT_VENDOR_PROPERTIES += \
ro.vendor.dolby.dax.version=DAX3_3.6.0.12_r1 \
vendor.audio.dolby.ds2.enabled=true \
vendor.audio.dolby.ds2.hardbypass=false \
ro.audio.monitorRotation=true \

# Remove Packages for Dolby Support
PRODUCT_PACKAGES += \
    RemovePackagesDolby

# XiaomiDolby and daxService
PRODUCT_PACKAGES += \
    daxService \
   
# Dolby Permissions
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/proprietary/system_ext/etc/sysconfig/config-com.dolby.daxappui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.dolby.daxappui.xml \
    $(DOLBY_PATH)/proprietary/system_ext/etc/sysconfig/config-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.dolby.daxservice.xml \
    $(DOLBY_PATH)/proprietary/system_ext/etc/sysconfig/hiddenapi-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/hiddenapi-com.dolby.daxservice.xml \
    $(DOLBY_PATH)/proprietary/system_ext/etc/permissions/privapp-com.dolby.daxappui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.dolby.daxappui.xml \
    $(DOLBY_PATH)/proprietary/system_ext/etc/permissions/privapp-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.dolby.daxservice.xml \

# Dolby Proprietary blobs
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/proprietary/system/lib/vendor.dolby.hardware.dms@2.0.so:$(TARGET_COPY_OUT_SYSTEM)/lib/vendor.dolby.hardware.dms@2.0.so \
    $(DOLBY_PATH)/proprietary/system/lib64/vendor.dolby.hardware.dms@2.0.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/vendor.dolby.hardware.dms@2.0.so \
    $(DOLBY_PATH)/proprietary/vendor/bin/hw/vendor.dolby.hardware.dms@2.0-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.dolby.hardware.dms@2.0-service \
    $(DOLBY_PATH)/proprietary/vendor/etc/init/vendor.dolby.hardware.dms@2.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolby.hardware.dms@2.0-service.rc \
    $(DOLBY_PATH)/proprietary/vendor/lib/libdapparamstorage.so:$(TARGET_COPY_OUT_VENDOR)/lib/libdapparamstorage.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/libdeccfg.so:$(TARGET_COPY_OUT_VENDOR)/lib/libdeccfg.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/libstagefright_soft_ac4dec.so:$(TARGET_COPY_OUT_VENDOR)/lib/libstagefright_soft_ac4dec.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/libstagefright_soft_ddpdec.so:$(TARGET_COPY_OUT_VENDOR)/lib/libstagefright_soft_ddpdec.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/libstagefrightdolby.so:$(TARGET_COPY_OUT_VENDOR)/lib/libstagefrightdolby.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/soundfx/libhwdap.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libhwdap.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/soundfx/libswgamedap.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libswgamedap.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/soundfx/libswvqe.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libswvqe.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/vendor.dolby.hardware.dms@2.0.so:$(TARGET_COPY_OUT_VENDOR)/lib/vendor.dolby.hardware.dms@2.0.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/libdapparamstorage.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdapparamstorage.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/libdeccfg.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdeccfg.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/libdlbdsservice.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdlbdsservice.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/libstagefright_soft_ac4dec.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstagefright_soft_ac4dec.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/libstagefright_soft_ddpdec.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstagefright_soft_ddpdec.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/libstagefrightdolby.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstagefrightdolby.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/soundfx/libhwdap.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libhwdap.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/soundfx/libswgamedap.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libswgamedap.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/soundfx/libswvqe.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libswvqe.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/vendor.dolby.hardware.dms@2.0-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.dolby.hardware.dms@2.0-impl.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/vendor.dolby.hardware.dms@2.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.dolby.hardware.dms@2.0.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/soundfx/libswdap.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libswdap.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/soundfx/libswdap.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libswdap.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/libdlbpreg.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdlbpreg.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/soundfx/libdlbvol.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libdlbvol.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/soundfx/libdlbvol.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libdlbvol.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/libdlbpreg.so:$(TARGET_COPY_OUT_VENDOR)/lib/libdlbpreg.so \
    $(DOLBY_PATH)/proprietary/vendor/lib/soundfx/libspatialaudio.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libspatialaudio.so \
    $(DOLBY_PATH)/proprietary/vendor/lib64/soundfx/libspatialaudio.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libspatialaudio.so \

# LDAC/LHDC Proprietary Blobs
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/ldac/system/system/lib/libldacBT_abr.so:$(TARGET_COPY_OUT_SYSTEM)/system/lib/libldacBT_abr.so \
    $(DOLBY_PATH)/ldac/system/system/lib/libldacBT_enc.so:$(TARGET_COPY_OUT_SYSTEM)/system/lib/libldacBT_enc.so \
    $(DOLBY_PATH)/ldac/system/system/lib64/libldacBT_abr.so:$(TARGET_COPY_OUT_SYSTEM)/system/lib64/libldacBT_abr.so \
    $(DOLBY_PATH)/ldac/system/system/lib64/libldacBT_enc.so:$(TARGET_COPY_OUT_SYSTEM)/system/lib64/libldacBT_enc.so \
    $(DOLBY_PATH)/ldac/system_ext/lib/liblhdc.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib/liblhdc.so \
    $(DOLBY_PATH)/ldac/system_ext/lib/liblhdcBT_enc.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib/liblhdcBT_enc.so \
    $(DOLBY_PATH)/ldac/system_ext/lib/liblhdcv5.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib/liblhdcv5.so \
    $(DOLBY_PATH)/ldac/system_ext/lib/liblhdcv5BT_enc.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib/liblhdcv5BT_enc.so \
    $(DOLBY_PATH)/ldac/system_ext/lib64/liblhdc.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/liblhdc.so \
    $(DOLBY_PATH)/ldac/system_ext/lib64/liblhdcBT_enc.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/liblhdcBT_enc.so \
    $(DOLBY_PATH)/ldac/system_ext/lib64/liblhdcv5.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/liblhdcv5.so \
    $(DOLBY_PATH)/ldac/system_ext/lib64/liblhdcv5BT_enc.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/liblhdcv5BT_enc.so \
