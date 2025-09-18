cmake_minimum_required(3.22.0)

project(test2)
set(CMAKE_CXX_STANDARD 17)
add_libraries(test2 SHARED src/test.cpp src/main.cpp)
target_include_directories(test2 PRIVATE include)

install(TARGETS test2 ARCHIVE DESTINATION 
                lib LIBRARY DESTINATION 
                lib RUNTIME DESTINATION bin
                )
install(DIRECTORY include/ DESTINATION include) 
include(CPack)