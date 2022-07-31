# find the BLAS++ include path
find_path(BLASPP_INCLUDE_DIR blas.hh
  NAMES blas.hh
  HINTS ${BLASPP_DIR} $ENV{BLASPP_DIR} ${CMAKE_PREFIX_PATH}
  PATH_SUFFIXES include
  NO_DEFAULT_PATH
  DOC "Directory with BLASPP header"
)

# find the main BLAS++ library
find_library(BLASPP_LIBRARIES
  NAMES blaspp
  HINTS ${BLASPP_DIR} $ENV{BLASPP_DIR} ${CMAKE_PREFIX_PATH}
  PATH_SUFFIXES lib lib64
  NO_DEFAULT_PATH
  DOC "The BLAS++ library."
)

find_package_handle_standard_args(BLASPP
  REQUIRED_VARS
    BLASPP_LIBRARIES
    BLASPP_INCLUDE_DIR
  VERSION_VAR
    BLASPP_VERSION
)

# Create target for BLAS++
if(BLASPP_FOUND)

  if(NOT TARGET XSDK::BLASPP)
    add_library(XSDK::BLASPP INTERFACE IMPORTED)
  endif()
  
  message(STATUS "Created XSDK::BLASPP target")
  message(STATUS "   INTERFACE_INCLUDE_DIRECTORIES: ${BLASPP_INCLUDE_DIR}")
  message(STATUS "   INTERFACE_LINK_LIBRARIES: ${BLASPP_LIBRARIES}")

  set_target_properties(XSDK::BLASPP PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${BLASPP_INCLUDE_DIR}"
      INTERFACE_LINK_LIBRARIES "${BLASPP_LIBRARIES}")
endif()