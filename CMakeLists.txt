cmake_minimum_required(VERSION "3.28")

project("cpackexample" VERSION 0.1.0)

FIND_PACKAGE(deal.II 9.5 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

# Uses the FindBoost module of CMake
find_package(Boost 1.83 COMPONENTS filesystem REQUIRED)

find_package(yaml-cpp 0.6 REQUIRED)

add_library(cpackexamplelib filesystem/filesystem.cpp fem/fem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)
add_executable("${PROJECT_NAME}" main.cpp)

target_link_libraries("${PROJECT_NAME}" cpackexamplelib)
target_link_libraries(cpackexamplelib Boost::filesystem ${YAML_CPP_LIBRARIES})

DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
DEAL_II_SETUP_TARGET(cpackexamplelib)

# Install targets
include(GNUInstallDirs)

# Install executable to bin/
install(TARGETS "${PROJECT_NAME}"
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# Install library to lib/
install(TARGETS cpackexamplelib
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

# Install header files to include/cpackexamplelib/
install(FILES
    fem/fem.hpp
    filesystem/filesystem.hpp
    flatset/flatset.hpp
    yamlParser/yamlParser.hpp
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
)

# Include CPack configuration
include(cmake/CPackConfig.cmake)
