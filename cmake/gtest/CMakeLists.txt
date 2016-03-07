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
project(test_myproject)

##################
# Compiler stuff #
################## 

# Enable C++14
add_definitions(-std=c++14)

################
# Dependencies #
################

find_package(GTest REQUIRED)

####################
# Include / Source #
####################

# Define include dir
include_directories(
	${CMAKE_SOURCE_DIR}/../include
	${GTEST_INCLUDE_DIR}
)

# Define source files
set(SOURCES
	test.cpp
)

##############
# Executable #
##############

add_executable(test_myproject ${SOURCES})

###########
# Linking #
###########

target_link_libraries(test_myproject ${GTEST_BOTH_LIBRARIES} pthread)

