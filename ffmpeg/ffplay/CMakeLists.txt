cmake_minimum_required(VERSION 3.15)

# 获取当前文件夹名
STRING(REGEX REPLACE ".*/(.*)" "\\1" CURRENT_FOLDER ${CMAKE_CURRENT_SOURCE_DIR})

project(${CURRENT_FOLDER})

# 包含路径
include_directories(${PROJECT_NAME} ${PROJECT_SOURCE_DIR}/../include)
include_directories(${PROJECT_NAME} ${PROJECT_SOURCE_DIR}/../src)
include_directories(${PROJECT_NAME} ${PROJECT_SOURCE_DIR}/../../SDL2/include)

if(WIN32)
# 设置编译参数
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /FORCE:MULTIPLE")
if(CMAKE_CL_64)
#win64
# 分别设置了Debug版本和Release版本可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/x64)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/x64)
link_directories(${PROJECT_NAME} ${PROJECT_SOURCE_DIR}/../lib/x64)
link_directories(${PROJECT_NAME} ${PROJECT_SOURCE_DIR}/../../SDL2/lib/x64)
else()
#win32
# 分别设置了Debug版本和Release版本可执行文件的输出目录(经测试,windows环境有效)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/../bin/win32)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/../bin/win32)
link_directories(${PROJECT_NAME} ${PROJECT_SOURCE_DIR}/../lib/win32)
link_directories(${PROJECT_NAME} ${PROJECT_SOURCE_DIR}/../../SDL2/lib/win32)
endif(CMAKE_CL_64)
endif(WIN32)

# 添加源码文件到项目
add_executable(${PROJECT_NAME} 
	${PROJECT_SOURCE_DIR}/../src/fftools/ffplay.c
    ${PROJECT_SOURCE_DIR}/../src/fftools/cmdutils.c
)

if(WIN32)
#windows
target_link_libraries(${PROJECT_NAME} avformat.lib avcodec.lib avutil.lib swscale.lib swresample.lib avfilter.lib avdevice.lib postproc.lib)
#target_link_libraries(${PROJECT_NAME} SDL2.lib)
target_link_libraries(${PROJECT_NAME} SDL2-static.lib "winmm.lib" "version.lib" "Imm32.lib" "Setupapi.lib")
endif(WIN32)

set_property(TARGET ${PROJECT_NAME} PROPERTY DEBUG_POSTFIX _d)
