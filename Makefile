CMAKE=cmake

.PHONY: build clean configure test

clean:
	$(CMAKE) -E remove_directory build

configure:
	$(CMAKE) --preset ninja-clang .

test:
	$(CMAKE) --build --preset ninja-clang-relWithDebInfo --target AllTests

build:
	$(CMAKE) --build --preset ninja-clang-relWithDebInfo --target all

