project "GLFW"
    kind "StaticLib"

    language "C"
    staticruntime "on"
    
    targetdir "../../lib/%{cfg.buildcfg}"

	files {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }
    

    -- WINDOWS   ----------------------------------------------------
	filter "system:windows"
        buildoptions { "-std=c11", "-lgdi32" }
        systemversion "10.0.18362.0"
        
        files {
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

		defines { 
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
		}
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"


    -- APPLE   ----------------------------------------------------
    filter "system:macosx"
        buildoptions { "-std=c11", "-lgdi32" }
        staticruntime "On"

        files {
            "src/cocoa_init.m",
            "src/cocoa_joystick.m",
            "src/cocoa_monitor.m",
            "src/cocoa_window.m",
            "src/nsgl_context.m",
            "src/egl_context.c",
            "src/osmesa_context.c",
            "src/cocoa_time.c",
            "src/posix_thread.c"
        }

        defines { 
            "_GLFW_COCOA",
            "_CRT_SECURE_NO_WARNINGS"
        }


    filter "configurations:Debug"
            runtime "Debug"
            symbols "on"

    filter "configurations:Release"
            runtime "Release"
            optimize "on"

    filter {}