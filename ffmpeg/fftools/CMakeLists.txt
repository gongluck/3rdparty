cmake_minimum_required(VERSION 3.15)

# 获取当前文件夹名
STRING(REGEX REPLACE ".*/(.*)" "\\1" CURRENT_FOLDER ${CMAKE_CURRENT_SOURCE_DIR})

project(${CURRENT_FOLDER})

################################################################################

set(subject ffmpeg)

# 包含路径
include_directories(${subject} ${PROJECT_SOURCE_DIR}/../../ffmpeg/src/)

if(WIN32)
include_directories(${subject} ${PROJECT_SOURCE_DIR}/../../ffmpeg/src/compat/atomics/win32)
if(CMAKE_CL_64)
#win64
# 分别设置了Debug版本和Release版本可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/x64)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/x64)
link_directories(${subject} ${PROJECT_SOURCE_DIR}/../../ffmpeg/lib/windows/x64)
else()
#win32
# 分别设置了Debug版本和Release版本可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/win32)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/win32)
link_directories(${subject} ${PROJECT_SOURCE_DIR}/../lib/windows/win32)
endif(CMAKE_CL_64)
endif(WIN32)

# 添加源码文件到项目
add_executable(${subject} 
${PROJECT_SOURCE_DIR}/cmdutils.h
${PROJECT_SOURCE_DIR}/cmdutils.c
${PROJECT_SOURCE_DIR}/ffmpeg.h
${PROJECT_SOURCE_DIR}/ffmpeg.c
${PROJECT_SOURCE_DIR}/ffmpeg_filter.c
${PROJECT_SOURCE_DIR}/ffmpeg_hw.c
${PROJECT_SOURCE_DIR}/ffmpeg_opt.c
#${PROJECT_SOURCE_DIR}/ffmpeg_qsv.c
#${PROJECT_SOURCE_DIR}/ffmpeg_videotoolbox.c
)

if(WIN32)
#windows
#链接ffmpeg静态库
target_link_libraries(${subject} avformat avcodec avutil swscale swresample avfilter avdevice postproc)
target_link_libraries(${subject} Ws2_32 Secur32 Mfuuid Mfplat Strmiids Bcrypt Shlwapi Vfw32)
endif(WIN32)

set_property(TARGET ${subject} PROPERTY DEBUG_POSTFIX _d)

################################################################################

set(subject ffprobe)

if(WIN32)
if(CMAKE_CL_64)
#win64
# 分别设置了Debug版本和Release版本可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/x64)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/x64)
link_directories(${subject} ${PROJECT_SOURCE_DIR}/../../ffmpeg/lib/windows/x64)
else()
#win32
# 分别设置了Debug版本和Release版本可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/win32)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/win32)
link_directories(${subject} ${PROJECT_SOURCE_DIR}/../lib/windows/win32)
endif(CMAKE_CL_64)
endif(WIN32)

# 添加源码文件到项目
add_executable(${subject}
${PROJECT_SOURCE_DIR}/cmdutils.h
${PROJECT_SOURCE_DIR}/cmdutils.c
${PROJECT_SOURCE_DIR}/ffprobe.c
)

if(WIN32)
#windows
#链接ffmpeg静态库
target_link_libraries(${subject} avformat avcodec avutil swscale swresample avfilter avdevice postproc)
target_link_libraries(${subject} Ws2_32 Secur32 Mfuuid Mfplat Strmiids Bcrypt Shlwapi Vfw32)
endif(WIN32)

set_property(TARGET ${subject} PROPERTY DEBUG_POSTFIX _d)

################################################################################

set(subject ffplay)

# 包含路径
include_directories(${subject} ${PROJECT_SOURCE_DIR}/../../ffmpeg/include)
include_directories(${subject} ${PROJECT_SOURCE_DIR}/../../SDL2/include)

if(WIN32)
# 设置编译参数
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /FORCE:MULTIPLE")
if(CMAKE_CL_64)
#win64
# 分别设置了Debug版本和Release版本可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/x64)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/x64)
link_directories(${subject} ${PROJECT_SOURCE_DIR}/../../ffmpeg/lib/windows/x64)
link_directories(${subject} ${PROJECT_SOURCE_DIR}/../../SDL2/lib/windows/x64)
else()
#win32
# 分别设置了Debug版本和Release版本可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/win32)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/win32)
link_directories(${subject} ${PROJECT_SOURCE_DIR}/../..ffmpeg/lib/windows/win32)
link_directories(${subject} ${PROJECT_SOURCE_DIR}/../../SDL2/lib/windows/win32)
endif(CMAKE_CL_64)
endif(WIN32)

# 添加源码文件到项目
add_executable(${subject}
${PROJECT_SOURCE_DIR}/cmdutils.h
${PROJECT_SOURCE_DIR}/cmdutils.c
${PROJECT_SOURCE_DIR}/ffplay.c
)

if(WIN32)
#windows
#链接ffmpeg静态库
target_link_libraries(${subject} avformat avcodec avutil swscale swresample avfilter avdevice postproc)
target_link_libraries(${subject} Ws2_32 Secur32 Mfuuid Mfplat Strmiids Bcrypt Shlwapi Vfw32)
#链接SDL静态库
target_link_libraries(${subject} SDL2 winmm version Imm32 Setupapi)
endif(WIN32)

set_property(TARGET ${subject} PROPERTY DEBUG_POSTFIX _d)
