cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

# Gazebo (due to bugs with the boost > @1.85 library required to pull last supported version)
set(Boost_LIBRARY_DIR "/opt/homebrew/opt/boost@1.85/lib")
set(Boost_INCLUDE_DIR "/opt/homebrew/opt/boost@1.85/include")
find_package(Boost 1.85.0 REQUIRED COMPONENTS system filesystem thread)
include_directories(${Boost_INCLUDE_DIR})
include_directories(${Boost_LIBRARY_DIR})
find_package(gazebo REQUIRED)
include_directories(${GAZEBO_INCLUDE_DIRS})
link_directories(${GAZEBO_LIBRARY_DIRS})
list(APPEND CMAKE_CXX_FLAGS "${GAZEBO_CXX_FLAGS}")

# Link
add_library(simpleworld SHARED scripts/simpleworld.cpp)
target_link_libraries(simpleworld ${GAZEBO_LIBRARIES} ${Boost_LIBRARIES})