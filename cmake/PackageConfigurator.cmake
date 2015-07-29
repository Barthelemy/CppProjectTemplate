# Create package-config files :
#  - <projectname>ConfigVersion.cmake
#  - <projectname>Config.cmake
# They are installed in lib/cmake/<projectname>.
#
# Required variables :
#  - VERSION
#  - PROJECT_NAME
#

# Include needed for 'write_basic_package_version_file'
include(CMakePackageConfigHelpers)

write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/cmake/${PROJECT_NAME}ConfigVersion.cmake"
  VERSION ${VERSION}
  COMPATIBILITY AnyNewerVersion
)

configure_file(cmake/${PROJECT_NAME}Config.cmake
  "${CMAKE_CURRENT_BINARY_DIR}/cmake/${PROJECT_NAME}Config.cmake"
  COPYONLY
)

set(ConfigPackageLocation lib/cmake/${PROJECT_NAME})

install(
  EXPORT ${PROJECT_NAME}Targets
  DESTINATION ${ConfigPackageLocation}
)

install(
  FILES
    cmake/${PROJECT_NAME}Config.cmake
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/${PROJECT_NAME}ConfigVersion.cmake"
  DESTINATION ${ConfigPackageLocation}
  COMPONENT devel
)