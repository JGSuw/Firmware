include(posix/px4_impl_posix)

set(USE_TOOLCHAIN Toolchain-arm-linux-gnueabihf)

function(px4_get_config)

	px4_parse_function_args(
		NAME px4_set_config_modules
		ONE_VALUE OUT_MODULES
		REQUIRED OUT_MODULES
		ARGN ${ARGN})

	set(config_module_list
		drivers/device
		drivers/boards/sitl
		drivers/led

		systemcmds/param
		systemcmds/ver

		modules/mavlink

		modules/systemlib
		modules/uORB
		modules/sensors
		modules/dataman
		modules/sdlog2
		modules/simulator
		modules/commander

		lib/mathlib
		lib/mathlib/math/filter
		lib/geo
		lib/geo_lookup
		lib/conversion

		platforms/posix/px4_layer
		platforms/posix/work_queue
		modules/muorb/krait
		)

	set(${OUT_MODULES} ${config_module_list} PARENT_SCOPE)

endfunction()
