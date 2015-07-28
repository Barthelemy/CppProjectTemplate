# @author  Barthélémy von Haller

# Produce the final Version.h using template Version.h.in and substituting variables.
# We don't want to polute our source tree with it, thus putting it in binary tree.
configure_file("Version.h.in" "${CMAKE_CURRENT_BINARY_DIR}/Version.h" @ONLY)
