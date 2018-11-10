#pragma once

namespace GEngine {

	class _declspec(dllexport) Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

	};

	Application* CreateApplication();
}

