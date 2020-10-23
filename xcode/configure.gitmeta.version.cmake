# Configuration script for building '/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/gitmeta.version' from '/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/gitmeta.version.in'
set(GITMETA_HASH "")
set(GITMETA_HASH_SHORT "")
set(GITMETA_DIRTY "")
set(GITMETA_DIRTY_STR "")
set(GITMETA_METADATA "")

if (IS_DIRECTORY "/Volumes/Half/Users/ckh/dev/bedrockblocks2/.git")
  set(GITMETA_BUILT_FROM_GIT TRUE)
  execute_process(
    COMMAND           "/usr/bin/git"
                      rev-parse
                      HEAD
    WORKING_DIRECTORY "/Volumes/Half/Users/ckh/dev/bedrockblocks2"
    RESULT_VARIABLE   git_return
    OUTPUT_VARIABLE   GITMETA_HASH)
  execute_process(
    COMMAND           "/usr/bin/git"
                      rev-parse
                      --short
                      HEAD
    WORKING_DIRECTORY "/Volumes/Half/Users/ckh/dev/bedrockblocks2"
    RESULT_VARIABLE   git_return
    OUTPUT_VARIABLE   GITMETA_HASH_SHORT)
  execute_process(
    COMMAND           "/usr/bin/git"
                      diff
                      --no-ext-diff
                      --quiet
                      --exit-code
    WORKING_DIRECTORY "/Volumes/Half/Users/ckh/dev/bedrockblocks2"
    RESULT_VARIABLE   git_return)
  if(git_return)
    set(GITMETA_DIRTY 1)
  endif()
  string(STRIP "${GITMETA_HASH}" GITMETA_HASH)
  string(STRIP "${GITMETA_HASH_SHORT}" GITMETA_HASH_SHORT)
endif()

  if(GITMETA_DIRTY)
    set(GITMETA_DIRTY_STR "dirty")
  endif()
  string(JOIN "-" GITMETA_METADATA "g${GITMETA_HASH_SHORT}" ${GITMETA_DIRTY_STR})
  #message(STATUS "Git Metadata: ${GITMETA_METADATA}")
configure_file("/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/gitmeta.version.in" "/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/gitmeta.version.temp" @ONLY)
configure_file("/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/gitmeta.version.temp" "/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/gitmeta.version" COPYONLY)
