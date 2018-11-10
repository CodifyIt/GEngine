#pragma once

#ifdef GE_PLATFORM_WINDOWS
	#ifdef GE_BUILD_DLL
		#define GENGINE_API _declspec(dllexport)
	#else
		#define	GENGINE_API _declspec(dllimport)
	#endif
#else
	#error WINDOWS PLATFORM SUPPORTED
#endif