ifeq ($(strip $(TARGET_BOARD_PLATFORM_GPU)), mali400)
ifeq ($(strip $(BOARD_USE_LCDC_COMPOSER)),true)
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcdc_composer=1

ifeq ($(strip $(GRAPHIC_MEMORY_PROVIDER)), dma_buf)
PRODUCT_COPY_FILES += \
    device/rockchip/common/gpu/libMali-400MP/libGLES_mali.so:system/lib/egl/libGLES_mali.so \
    device/rockchip/common/gpu/libMali-400MP/libGLES_mali.so:obj/lib/libGLES_mali.so
else
PRODUCT_COPY_FILES += \
    device/rockchip/common/gpu/libMali-400MP/dedicated/libMali.so:system/lib/libMali.so \
    device/rockchip/common/gpu/libMali-400MP/dedicated/libMali.so:obj/lib/libMali.so \
    device/rockchip/common/gpu/libMali-400MP/dedicated/libUMP.so:system/lib/libUMP.so \
    device/rockchip/common/gpu/libMali-400MP/dedicated/libUMP.so:obj/lib/libUMP.so \
    device/rockchip/common/gpu/libMali-400MP/dedicated/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
    device/rockchip/common/gpu/libMali-400MP/dedicated/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
    device/rockchip/common/gpu/libMali-400MP/dedicated/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so
endif

PRODUCT_COPY_FILES += \
    device/rockchip/common/gpu/libMali-400MP/dedicated/mali.ko.3.0.36+:system/lib/modules/mali.ko.3.0.36+ \
    device/rockchip/common/gpu/libMali-400MP/dedicated/mali.ko:system/lib/modules/mali.ko \
    device/rockchip/common/gpu/libMali-400MP/dedicated/ump.ko.3.0.36+:system/lib/modules/ump.ko.3.0.36+ \
    device/rockchip/common/gpu/libMali-400MP/dedicated/ump.ko:system/lib/modules/ump.ko

PRODUCT_COPY_FILES += \
    device/rockchip/common/gpu/gpu_performance/dedicated/performance_info.xml:system/etc/performance_info.xml

else
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcdc_composer=0
ifeq ($(strip $(GRAPHIC_MEMORY_PROVIDER)), dma_buf)
PRODUCT_COPY_FILES += \
    device/rockchip/common/gpu/libMali-400MP/libGLES_mali.so:system/lib/egl/libGLES_mali.so \
    device/rockchip/common/gpu/libMali-400MP/libGLES_mali.so:obj/lib/libGLES_mali.so

PRODUCT_COPY_FILES += \
    device/rockchip/common/gpu/libMali-400MP/rk3036/mali.ko.3.0.36+:system/lib/modules/mali.ko.3.0.36+ \
    device/rockchip/common/gpu/libMali-400MP/rk3036/mali.ko:system/lib/modules/mali.ko

else
PRODUCT_COPY_FILES += \
    device/rockchip/common/gpu/libMali-400MP/libMali.so:system/lib/libMali.so \
    device/rockchip/common/gpu/libMali-400MP/libMali.so:obj/lib/libMali.so \
    device/rockchip/common/gpu/libMali-400MP/libUMP.so:system/lib/libUMP.so \
    device/rockchip/common/gpu/libMali-400MP/libUMP.so:obj/lib/libUMP.so \
    device/rockchip/common/gpu/libMali-400MP/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
    device/rockchip/common/gpu/libMali-400MP/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
    device/rockchip/common/gpu/libMali-400MP/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so

ifeq ($(strip $(TARGET_BOARD_PLATFORM)), rk2928)
PRODUCT_COPY_FILES += \
    device/rockchip/common/gpu/libMali-400MP/rk2928/mali.ko:system/lib/modules/mali.ko \
    device/rockchip/common/gpu/libMali-400MP/rk2928/ump.ko:system/lib/modules/ump.ko \
else
PRODUCT_COPY_FILES += \
    device/rockchip/common/gpu/libMali-400MP/osmem/mali.ko.3.0.36+:system/lib/modules/mali.ko.3.0.36+ \
    device/rockchip/common/gpu/libMali-400MP/osmem/mali.ko:system/lib/modules/mali.ko \
    device/rockchip/common/gpu/libMali-400MP/osmem/ump.ko.3.0.36+:system/lib/modules/ump.ko.3.0.36+ \
    device/rockchip/common/gpu/libMali-400MP/osmem/ump.ko:system/lib/modules/ump.ko
endif
endif

PRODUCT_COPY_FILES += \
    device/rockchip/common/gpu/gpu_performance/performance_info.xml:system/etc/performance_info.xml
endif

PRODUCT_PROPERTY_OVERRIDES += debug.hwui.render_dirty_regions=false

PRODUCT_COPY_FILES += \
    device/rockchip/common/gpu/gpu_performance/packages-compat.xml:system/etc/packages-compat.xml \
    device/rockchip/common/gpu/gpu_performance/packages-composer.xml:system/etc/packages-composer.xml \
    device/rockchip/common/gpu/gpu_performance/performance:system/bin/performance \
    device/rockchip/common/gpu/gpu_performance/libperformance_runtime.so:system/lib/libperformance_runtime.so \
    device/rockchip/common/gpu/gpu_performance/gpu.$(TARGET_BOARD_HARDWARE).so:system/lib/hw/gpu.$(TARGET_BOARD_HARDWARE).so

endif
