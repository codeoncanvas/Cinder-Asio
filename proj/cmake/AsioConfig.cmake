if( NOT TARGET Asio )
    get_filename_component( ASIO_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../src" ABSOLUTE )

    FILE(GLOB ASIO_SOURCES ${ASIO_SOURCE_PATH}/*.cpp)

    add_library( Asio ${ASIO_SOURCES} )
    target_include_directories( Asio PUBLIC "${ASIO_SOURCE_PATH}" )

    # If Cinder included from this block:

    target_include_directories( Asio SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )

    if( NOT TARGET cinder )
        include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
        find_package( cinder REQUIRED PATHS
                "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
                "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
    endif()

    target_link_libraries( Asio PRIVATE cinder )
endif()
