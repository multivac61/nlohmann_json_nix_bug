cmake_minimum_required(VERSION 3.15)

project(test)

option(USE_FETCH_CONTENT "Use FetchContent" OFF)

if (USE_FETCH_CONTENT)
  include(FetchContent)
  FetchContent_Declare(
      nlohmann_json
      GIT_REPOSITORY https://github.com/nlohmann/json
      GIT_TAG 8c391e04fe4195d8be862c97f38cfe10e2a3472e
      GIT_SHALLOW TRUE
  )
  FetchContent_MakeAvailable(nlohmann_json)
else ()
  find_package(nlohmann_json CONFIG REQUIRED)
endif()

add_executable(${PROJECT_NAME} test.cpp)
target_link_libraries(${PROJECT_NAME} PUBLIC nlohmann_json::nlohmann_json)

install(TARGETS ${PROJECT_NAME})
