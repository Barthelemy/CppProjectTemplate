# @author  Barthélémy von Haller

include(FindDoxygen)

# Add an option for the user to enable or not the documentation generation every time we compile.
# Either set it on the command line or use ccmake. It is an advanced option.
option(BUILD_DOCS "Build doxygen documentation when building all" OFF)
mark_as_advanced(BUILD_DOCS)

if(NOT DOXYGEN_DOT_FOUND) 
  message(WARNING "Graphviz doesn't seem to be installed. Doxygen will not be able to generate graphs. Consider installing this package.")
endif(NOT DOXYGEN_DOT_FOUND) 

if(DOXYGEN_FOUND)
  # Configure the doxygen config file with current settings:
  configure_file(documentation-config.doxygen.in
                 ${CMAKE_CURRENT_BINARY_DIR}/documentation-config.doxygen @ONLY)
  add_custom_target(doc ALL
    ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/documentation-config.doxygen
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "Generating API documentation using doxygen" VERBATIM)

  # exclude target from the default "all" target
  if(NOT BUILD_DOCS)
    set_target_properties(doc PROPERTIES EXCLUDE_FROM_ALL 1 EXCLUDE_FROM_DEFAULT_BUILD 1)
  endif(NOT BUILD_DOCS)

  make_directory(${CMAKE_CURRENT_BINARY_DIR}/html) # needed for install:
  install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/html
          DESTINATION share/${PROJECT_NAME}-${VERSION_MAJOR} COMPONENT docs)
endif(DOXYGEN_FOUND)
