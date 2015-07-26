# TODO add BUILD_DOCS as parameter
# TODO change name of function to match what we actually do
# TODO the target name should be "doc" if there is not already one
function(AddDocTarget)
  # Configure the doxygen config file with current settings:
  configure_file(documentation-config.doxygen.in ${CMAKE_CURRENT_BINARY_DIR}/documentation-config.doxygen @ONLY)

  add_custom_target(doc${PROJECT_NAME}
      ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/documentation-config.doxygen
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
      COMMENT "Generating API documentation using doxygen" VERBATIM)

  make_directory(${CMAKE_CURRENT_BINARY_DIR}/html) # needed for install

  install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/html DESTINATION share/${PROJECT_NAME}-${VERSION_MAJOR} COMPONENT docs)
endfunction()