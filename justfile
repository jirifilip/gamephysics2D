set shell := ["powershell.exe", "-c"]
set dotenv-load

compile:
	if (test-path build) { remove-item -recurse build }
	new-item -itemtype directory build

	conan install . --output-folder=build --build=missing -s build_type=Debug -s compiler.cppstd=17
	
	cmake -S . -B build --preset conan-default
	cmake --build build --config Debug

run: compile
	./build/Debug/GamePhysics.exe