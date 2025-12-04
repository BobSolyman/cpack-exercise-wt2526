# CPack Configuration for cpackexample
# This module configures the packaging process for tar.gz and deb packages

# General CPack settings
set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_VERSION "${PROJECT_VERSION}")
set(CPACK_PACKAGE_VERSION_MAJOR "${PROJECT_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${PROJECT_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${PROJECT_VERSION_PATCH}")

# Package metadata
set(CPACK_PACKAGE_VENDOR "BobSolyman")
set(CPACK_PACKAGE_CONTACT "Shehabeldin Solyman <shehabsolyman134@gmail.com>")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CPack Example - CMake packaging demo")
set(CPACK_PACKAGE_DESCRIPTION "CMake and CPack packaging example with deal.II, Boost, and yaml-cpp.")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/BobSolyman/cpack-exercise-wt2526")

# Debian-specific maintainer (must have Name <email> format)
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Shehabeldin Solyman <shehabsolyman134@gmail.com>")

# License and documentation
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_SOURCE_DIR}/README.md")

# Strip binaries to reduce size
set(CPACK_STRIP_FILES TRUE)

# Only generate TGZ and DEB packages
set(CPACK_GENERATOR "TGZ;DEB")

# ============================================================================
# Debian Package Configuration
# ============================================================================

# Use Debian naming convention: <PackageName>_<VersionNumber>-<DebianRevisionNumber>_<DebianArchitecture>.deb
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)

# Package architecture
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")

# Section for the package (optional categorization)
set(CPACK_DEBIAN_PACKAGE_SECTION "devel")

# Priority of the package
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")

# Dependencies - these packages must be installed for cpackexample to work
# Using shlibdeps to auto-detect shared library dependencies
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)

# Explicitly specify some dependencies that might not be auto-detected
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libboost-filesystem1.83.0, libdeal.ii-dev")

# Include CPack module
include(CPack)
