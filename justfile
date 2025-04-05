set shell := ["powershell.exe", "-c"]
set dotenv-load

compile:
	if (test-path build) { remove-item -recurse build }
	new-item -itemtype directory build
	cmake -S . -B build
	cmake --build build --config Debug 

run:
	./build/Debug/GamePhysics.exe