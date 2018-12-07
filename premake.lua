workspace "GEngine"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

OUTPUTDIR = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "GEngine"
    location "GEngine"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. OUTPUTDIR .. "/%{prj.name}")
    objdir ("bin-int/" .. OUTPUTDIR .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    include
    {
        "%{prj.name}/vendor/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "GE_PLATFORM_WINDOWS",
            "GE_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. OUTPUTDIR .. "/Sandbox")
        }
    
    filter "configurations:Debug"
    {
        define "GE_DEBUG"
        symbols "On"
    }

    filter "configurations:Release"
    {
        define "GE_RELEASE"
        optimize "On"
    }

    filter "configurations:Dist"
    {
        define "GE_DIST"
        optimize "On"
    }
