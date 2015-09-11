include(nuttx/px4_impl_nuttx)

set(CMAKE_TOOLCHAIN_FILE cmake/toolchains/Toolchain-arm-none-eabi.cmake)

set(config_module_list

	#
	# Board support modules
	#
	drivers/device
	drivers/stm32
	drivers/stm32/adc
	drivers/stm32/tone_alarm
	drivers/led
	drivers/px4fmu
	drivers/px4io
	drivers/boards/px4fmu-v2
	drivers/rgbled
	drivers/mpu6000
	drivers/mpu9250
	drivers/lsm303d
	drivers/l3gd20
	drivers/hmc5883
	drivers/ms5611
	drivers/mb12xx
	drivers/sf0x
	drivers/ll40ls
	drivers/trone
	drivers/gps
	drivers/pwm_out_sim
	drivers/hott
	drivers/hott/hott_telemetry
	drivers/hott/hott_sensors
	drivers/blinkm
	drivers/airspeed
	drivers/ets_airspeed
	drivers/meas_airspeed
	drivers/frsky_telemetry
	modules/sensors
	drivers/mkblctrl
	drivers/px4flow
	drivers/oreoled
	drivers/gimbal
	drivers/pwm_input
	drivers/camera_trigger

	#
	# System commands
	#
	systemcmds/bl_update
	systemcmds/mixer
	systemcmds/param
	systemcmds/perf
	systemcmds/pwm
	systemcmds/esc_calib
	systemcmds/reboot
	systemcmds/top
	systemcmds/config
	systemcmds/nshterm
	systemcmds/mtd
	systemcmds/dumpfile
	systemcmds/ver

	#
	# Logging
	#
	modules/sdlog2

	#
	# Library modules
	#
	modules/systemlib
	modules/systemlib/mixer
	modules/controllib
	modules/uORB
	modules/dataman

	#
	# Libraries
	#
	#lib/mathlib/CMSIS
	lib/mathlib
	lib/mathlib/math/filter
	lib/ecl
	lib/external_lgpl
	lib/geo
	lib/geo_lookup
	lib/conversion
	lib/launchdetection
	platforms/nuttx

	# had to add for cmake, not sure why wasn't in original config
	platforms/common 
	platforms/nuttx/px4_layer

	#
	# Demo apps
	#
	#examples/math_demo
	# Tutorial code from
	# https://px4.io/dev/px4_simple_app
	examples/px4_simple_app

	# Tutorial code from
	# https://px4.io/dev/daemon
	examples/px4_daemon_app

	# Tutorial code from
	# https://px4.io/dev/debug_values
	examples/px4_mavlink_debug

	# Tutorial code from
	# https://px4.io/dev/example_fixedwing_control
	examples/fixedwing_control

	# Hardware test
	examples/hwtest
)

set(config_firmware_options
	PARAM_XML # generate param xml
	)

set(config_extra_builtin_cmds
	serdis_main
	sercon_main
	)

add_custom_target(sercon)
set_target_properties(sercon PROPERTIES
	MAIN "sercon" STACK "2048")

add_custom_target(serdis)
set_target_properties(serdis PROPERTIES
	MAIN "serdis" STACK "2048")