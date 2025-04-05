set shell := ["powershell.exe", "-c"]
set dotenv-load

compile:
	if (test-path build) { remove-item -recurse build }
	new-item -itemtype directory build

	conan install . --build=missing -s build_type=Debug
	
	cmake -S . -B build -D CMAKE_TOOLCHAIN_FILE='build/generators/conan_toolchain.cmake'
	cmake --build build --config Debug

run:
	./build/Debug/GamePhysics.exe