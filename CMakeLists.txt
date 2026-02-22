cmake_minimum_required(VERSION 3.10)
project(CMakeCacheTests)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable testing
include(cmake/testing.cmake)

# LibA
add_library(LibA LibA/Lib/A.cpp)
target_include_directories(LibA PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/LibA/Lib)

# LibA Unit Tests
add_executable(TestLibA LibA/Tests/TestA.cpp)
target_link_libraries(TestLibA PRIVATE LibA)
test_with_gtest(TestLibA)

# LibB
add_library(LibB LibB/Lib/B.cpp)
target_include_directories(LibB PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/LibB/Lib)

# LibB Unit Tests
add_executable(TestLibB LibB/Tests/TestB.cpp)
target_link_libraries(TestLibB PRIVATE LibB)
test_with_gtest(TestLibB)

# LibAB - Library that depends on LibA and LibB
add_library(LibAB LibAB/Lib/AB.cpp)
target_include_directories(LibAB PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/LibAB/Lib)
target_link_libraries(LibAB PUBLIC LibA LibB)

# LibAB Unit Tests
add_executable(TestLibAB LibAB/Tests/TestAB.cpp)
target_link_libraries(TestLibAB PRIVATE LibAB)
test_with_gtest(TestLibAB)
