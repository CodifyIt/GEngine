#include <GEngine.h>

class Sandbox : public GEngine::Application {
public:
	Sandbox() {

	}

	~Sandbox() {

	}
};

GEngine::Application* GEngine::CreateApplication() {
	return new Sandbox();
	//It starts the sandbox app to test the GEngine testing
}