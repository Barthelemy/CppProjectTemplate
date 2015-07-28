function(PrepareDocTarget)

  # Configure the doxygen config file with current settings:
  configure_file(documentation-config.doxygen.in ${CMAKE_CURRENT_BINARY_DIR}/documentation-config.doxygen @ONLY)

  # Set the name of the target : "doc" if it doesn't already exist and "doc<projectname>" if it does.
  # This way we make sure to have a single "doc" target. Either it is the one of the top directory or
  # it is the one of the subproject that we are compiling alone.
  set(DOC_TARGET_NAME "doc")
  if(TARGET doc)
    set(DOC_TARGET_NAME "doc${PROJECT_NAME}")
  endif()

  add_custom_target(${DOC_TARGET_NAME} ${TARGET_ALL}
      ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/documentation-config.doxygen
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
      COMMENT "Generating API documentation using doxygen" VERBATIM)

  make_directory(${CMAKE_CURRENT_BINARY_DIR}/html) # needed for install

  install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/html DESTINATION share/${PROJECT_NAME}-${VERSION_MAJOR} COMPONENT doc)

endfunction()