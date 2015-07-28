# @author  Barthélémy von Haller

# General CPack configuration 
# Info: http://www.itk.org/Wiki/CMake:Component_Install_With_CPack
# _____________________________________________________________________________

set(CPACK_PACKAGE_NAME "ProjB")

if(APPLE)
  set(CPACK_PACKAGE_VENDOR "Organisation") # PackageMaker doesn't like http://
else()
  set(CPACK_PACKAGE_VENDOR "http://example.com") # deb lintian insists on URL
endif()

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Example project")
set(CPACK_PACKAGE_CONTACT "Person name <name@example.com>")
set(CPACK_PACKAGE_VERSION ${VERSION})
set(CPACK_PACKAGE_VERSION_MAJOR ${VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${VERSION_PATCH})
set(CPACK_RPM_PACKAGE_DEBUG 0)

# Select package generator
if(MSVC)
  set(CPACK_GENERATOR "NSIS")
endif(MSVC)

if(APPLE)
  set(CPACK_GENERATOR "PackageMaker")
  set(CPACK_SET_DESTDIR ON)
endif(APPLE)

if (${CMAKE_SYSTEM_NAME} MATCHES Linux)
  find_program(RPM_EXE rpmbuild)
  if(${RPM_EXE} MATCHES RPM_EXE-NOTFOUND)
    set(CPACK_GENERATOR "TGZ;DEB")
  else()
    set(CPACK_GENERATOR "TGZ;DEB;RPM")
  endif()
endif(${CMAKE_SYSTEM_NAME} MATCHES Linux)

# Components (Disabled)
# _____________________________________________________________________________

set(CPACK_COMPONENTS_ALL_IN_ONE_PACKAGE 1)

# Debian specific configuration (minimum)
# _____________________________________________________________________________

set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${CPACK_PACKAGE_CONTACT}")
SET(CPACK_DEBIAN_PACKAGE_DEPENDS "libc6 (>= 2.3.1-6), libboost-test-dev")
SET(CPACK_DEBIAN_PACKAGE_CONFLICTS "Hello0-apps")

# RPM specific configuration (minimum)
# _____________________________________________________________________________
set(CPACK_RPM_PACKAGE_LICENSE "Proprietary")
set(CPACK_RPM_PACKAGE_GROUP "Development/Libraries")
set(CPACK_RPM_PACKAGE_VERSION ${VERSION})
set(CPACK_RPM_COMPONENT_INSTALL ON)   # necessary even if CPACK_COMPONENT_INSTALL set to ON. A bug in my opinion.


# OS X PackageMaker
# _____________________________________________________________________________
set(CPACK_OSX_PACKAGE_VERSION "10.5")

include (InstallRequiredSystemLibraries)
include (CPack)
