# *****************************************************************************
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc.,
# 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
# Module authors:
#   Alexander Lenz <alexander.lenz@frm2.tum.de>
#
# *****************************************************************************

#######################
# General cmake stuff #
#######################

# Define minimum cmake version
cmake_minimum_required(VERSION 2.8)

#################
# Project stuff #
#################

# Define project name
project(myproject)

# Define version
set(VERSION_MAJOR 0)
set(VERSION_MINOR 1)
set(VERSION_PATCH 0)
set(VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")

#################
# Package stuff #
#################
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "")
set(CPACK_PACKAGE_VENDOR "My Name <my.name@my.domain>")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/COPYING")
set(CPACK_PACKAGE_VERSION_MAJOR "${VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${VERSION_PATCH}")
set(CPACK_PACKAGE_VERSION "${VERSION}")

include(CPack)

##################
# Compiler stuff #
################## 

# Enable C++14
add_definitions(-std=c++14 -DINSTALL_PREFIX="${CMAKE_INSTALL_PREFIX}")

message(STATUS "${CMAKE_INSTALL_PREFIX}")

# Debugging flag
option(ENABLE_DEBUG "Enable debugging" OFF)

if(ENABLE_DEBUG)
	add_definitions(-g -O0 -Wall)
endif(ENABLE_DEBUG)

########################
# Lib/Pkg dependencies #
########################

# Find requirements
#find_package(PkgName REQUIRED)

#######################
# Source/Header files #
#######################

# Define include dir
include_directories(
	${CMAKE_SOURCE_DIR}/include
)

# Define source files
set(SOURCES
	src/main.cpp
)

set(HEADERS
	include/Const.h
)

###################
# Compile targets #
###################

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Define binary target
add_executable(mybinary ${SOURCES})


###########
# Linking #
###########

# Define link dir
link_directories(
	/usr/local/lib
)

# Define linked libs
target_link_libraries(mybinary
	mymightylib
)


