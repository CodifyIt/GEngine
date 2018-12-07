#pragma once

#ifdef GE_PLATFORM_WINDOWS

extern GEngine::Application* GEngine::CreateApplication();

int main(int argc, char** argv) {

	GEngine::Log::Init();
	GEngine::Log::GetCoreLogger()->warn("This is a warning");
	GEngine::Log::GetClientLogger()->info("This is the app");
	auto app = GEngine::CreateApplication();
	app->Run();
	delete app;
	return 0;
}
#else
	#error WINDOWS PLATFORM SUPPORTED
#endif