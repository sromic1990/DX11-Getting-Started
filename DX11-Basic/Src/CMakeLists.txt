cmake_minimum_required (VERSION 3.26)

# INCLUDE 3RD PARTY LIBRARIES
include("${CMAKE_SOURCE_DIR}/Libraries/FetchLibraries.cmake")

# POPULATE 3RD PARTY LIBRARIES
FetchContent_MakeAvailable(glfw)

# CREATE EXECUTABLE
file(GLOB_RECURSE SUBDIRECTORIES "${CMAKE_SOURCE_DIR}/Src/*.h" "${CMAKE_SOURCE_DIR}/Src/*.cpp")
source_group("Src" "{CMAKE_SOURCE_DIR}/Src" ${SUBDIRECTORIES})
add_executable ("Src" main.cpp ${SUBDIRECTORIES})

# INCLUDE DIRECTORIES AND LINK LIBRARIES
target_include_directories("Src" PRIVATE "${CMAKE_SOURCE_DIR}/Src")

target_link_libraries("Src" PRIVATE glfw)

# DEBUG AND RELEASE FLAGS
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
	target_compile_definitions("Src" PUBLIC DEBUG)
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
	target_compile_definitions("Src" PUBLIC RELEASE)
endif()

# MACRO DEFINITIONS
if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
	target_compile_definitions("Src" PUBLIC RUNTIME_API=__declspec\(dllexport\))
	target_compile_definitions("Src" PUBLIC FORCEINLINE=__forceinline)
else()
	message(FATAL_ERROR "Compiler not supported")
endif()