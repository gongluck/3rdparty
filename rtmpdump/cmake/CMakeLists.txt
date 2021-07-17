cmake_minimum_required(VERSION 3.15)

# 获取当前文件夹名
STRING(REGEX REPLACE ".*/(.*)" "\\1" CURRENT_FOLDER ${CMAKE_CURRENT_SOURCE_DIR})

project(${CURRENT_FOLDER})

add_definitions(-DRTMPDUMP_VERSION="2.4")
add_definitions(-DNO_CRYPTO)
add_definitions(-Doff_t=long)

################################################################################

set(subject librtmp)

# 包含路径
include_directories(${subject} ${PROJECT_SOURCE_DIR}/../src/librtmp)

if(WIN32)
if(CMAKE_CL_64)
#win64
# 设置版本库文件的输出目录(经测试,windows环境有效)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../lib/x64)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../lib/x64)
else()
#win32
# 设置版本库文件的输出目录(经测试,windows环境有效)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../lib/win32)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../lib/win32)
endif(CMAKE_CL_64)
endif(WIN32)

# 添加源码文件到项目
aux_source_directory(${PROJECT_SOURCE_DIR}/../src/librtmp SRCS)
add_library(${subject} STATIC ${SRCS})

if(WIN32)
target_link_libraries(${subject})
endif(WIN32)

set_property(TARGET ${subject} PROPERTY DEBUG_POSTFIX _d)

################################################################################

set(subject rtmpdump)

# 包含路径
include_directories(${subject} ${PROJECT_SOURCE_DIR}/)
include_directories(${subject} ${PROJECT_SOURCE_DIR}/../src/)

if(WIN32)
if(CMAKE_CL_64)
#win64
# 设置可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/x64)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/x64)
else()
#win32
# 设置可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/win32)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/win32)
endif(CMAKE_CL_64)
endif(WIN32)

# 添加源码文件到项目
add_executable(${subject}
${PROJECT_SOURCE_DIR}/../src/rtmpdump.c
${PROJECT_SOURCE_DIR}/../cmake/getopt.c
)

if(WIN32)
target_link_libraries(${subject} librtmp "WS2_32" "winmm")
endif(WIN32)

set_property(TARGET ${subject} PROPERTY DEBUG_POSTFIX _d)

################################################################################

set(subject rtmpsrv)

# 包含路径
include_directories(${subject} ${PROJECT_SOURCE_DIR}/)
include_directories(${subject} ${PROJECT_SOURCE_DIR}/../src/)

if(WIN32)
if(CMAKE_CL_64)
#win64
# 设置可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/x64)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/x64)
else()
#win32
# 设置可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/win32)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/win32)
endif(CMAKE_CL_64)
endif(WIN32)

# 添加源码文件到项目
add_executable(${subject}
${PROJECT_SOURCE_DIR}/../src/rtmpsrv.c
${PROJECT_SOURCE_DIR}/../src/thread.c
${PROJECT_SOURCE_DIR}/../cmake/getopt.c
)

if(WIN32)
target_link_libraries(${subject} librtmp "WS2_32" "winmm")
endif(WIN32)

set_property(TARGET ${subject} PROPERTY DEBUG_POSTFIX _d)

################################################################################

set(subject rtmpsuck)

# 包含路径
include_directories(${subject} ${PROJECT_SOURCE_DIR}/)
include_directories(${subject} ${PROJECT_SOURCE_DIR}/../src/)

if(WIN32)
if(CMAKE_CL_64)
#win64
# 设置可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/x64)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/x64)
else()
#win32
# 设置可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/win32)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/win32)
endif(CMAKE_CL_64)
endif(WIN32)

# 添加源码文件到项目
aux_source_directory(${PROJECT_SOURCE_DIR}/../src/librtmp LIBRTMP)
add_executable(${subject}
${PROJECT_SOURCE_DIR}/../src/rtmpsuck.c
${PROJECT_SOURCE_DIR}/../src/thread.c
${PROJECT_SOURCE_DIR}/../cmake/getopt.c
)

if(WIN32)
target_link_libraries(${subject} librtmp "WS2_32" "winmm")
endif(WIN32)

set_property(TARGET ${subject} PROPERTY DEBUG_POSTFIX _d)
