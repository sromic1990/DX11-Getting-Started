cmake_minimum_required (VERSION 3.26)

include(FetchContent)

# GLFW LIBRARY
FetchContent_Declare(
	glfw
	GIT_REPOSITORY https://github.com/glfw/glfw
	GIT_TAG 3.4
)