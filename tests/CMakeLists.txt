# Copyright (c) 2020 Reed A. Cartwright <reed@cartwright.ht>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

macro(add_RunMCBERepair_test test)
  set(TEST_ARGS ${ARGN})
  set(test_dir "Run${test}")
  add_test(NAME Run.${test} COMMAND ${CMAKE_COMMAND}
    -DCMAKE_MODULE_PATH=${CMAKE_CURRENT_SOURCE_DIR}
    -DRunMCBERepair_SOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}/${test_dir}
    -DRunMCBERepair_BINARY_DIR=${CMAKE_CURRENT_BINARY_DIR}/${test_dir}
    -DRunMCBERepair_EXE=$<TARGET_FILE:mcberepair>
    ${TEST_ARGS}
    -P "${CMAKE_CURRENT_SOURCE_DIR}/${test_dir}/RunTest.cmake"
    )
endmacro()

add_RunMCBERepair_test(Main)
add_RunMCBERepair_test(Version)
add_RunMCBERepair_test(Help)
add_RunMCBERepair_test(ListKeys)
add_RunMCBERepair_test(RmKeys)
add_RunMCBERepair_test(DumpKey)
add_RunMCBERepair_test(WriteKey)
add_RunMCBERepair_test(Repair)
add_RunMCBERepair_test(Copyall)
