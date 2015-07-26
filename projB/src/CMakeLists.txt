# @author  Barthélémy von Haller
set(LIB_HEADERS
  "${CMAKE_CURRENT_BINARY_DIR}/../include/projB/Version.h"
  World.h
)

set(LIB_SOURCES
  Version.cxx
  World.cxx
)

set(APP_HEADERS
)

set(APP_SOURCES
  main.cxx
)

# Define two variables in order not to repeat ourselves.
set(LIBRARY_NAME projB)

# Define the library
add_library(${LIBRARY_NAME} SHARED ${LIB_SOURCES})

# Set the build version. It will be used in the name of the lib, with corresponding
# symlinks created. SOVERSION could also be specified for api version. 
set_target_properties(${LIBRARY_NAME} PROPERTIES
  VERSION ${VERSION}  # ${VERSION} was defined in the main CMakeLists.
  FRAMEWORK TRUE
  PUBLIC_HEADER "${LIB_HEADERS}" # specify the public headers
)

# This is a make target, so you can do a "make projBrunner"
set(APPLICATION_NAME projBrunner)
add_executable(${APPLICATION_NAME} ${APP_SOURCES})

# Links the target exe (projBrunner) against the library (libprojB) and other required libraries
target_link_libraries(${APPLICATION_NAME} ${LIBRARY_NAME} ${Boost_PROGRAM_OPTIONS_LIBRARY})

# Says how and where to install software
install(TARGETS ${LIBRARY_NAME} ${APPLICATION_NAME}
  ARCHIVE DESTINATION lib COMPONENT libs   # static lib
  RUNTIME DESTINATION bin COMPONENT libs  # binaries
  LIBRARY DESTINATION lib COMPONENT libs  # shared lib
  PUBLIC_HEADER DESTINATION include/projB COMPONENT dev   # headers (note the different component -> different package)
  FRAMEWORK DESTINATION bin COMPONENT libs # for mac
)

