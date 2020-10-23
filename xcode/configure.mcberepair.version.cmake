# Configuration script for building '/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/mcberepair.version' from '/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/mcberepair.version.in'
set(mcberepair_SEMVER_MAJOR "0")
set(mcberepair_SEMVER_MINOR "2")
set(mcberepair_SEMVER_PATCH "0")
set(mcberepair_SEMVER_PRERELEASE "prerelease")
set(mcberepair_SEMVER_METADATA "")
set(mcberepair_SEMVER_VERSION "")
set(mcberepair_SEMVER_INTEGER "20000")

include("/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/gitmeta.version")

string(JOIN "." mcberepair_SEMVER_METADATA ${GITMETA_METADATA} ${mcberepair_SEMVER_METADATA})

string(JOIN "." mcberepair_SEMVER_VERSION
  ${mcberepair_SEMVER_MAJOR} ${mcberepair_SEMVER_MINOR} ${mcberepair_SEMVER_PATCH})
string(JOIN "-" mcberepair_SEMVER_VERSION
  ${mcberepair_SEMVER_VERSION} ${mcberepair_SEMVER_PRERELEASE})
string(JOIN "+" mcberepair_SEMVER_VERSION
  ${mcberepair_SEMVER_VERSION} ${mcberepair_SEMVER_METADATA})

message(STATUS "mcberepair Version: ${mcberepair_SEMVER_VERSION}")
  configure_file("/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/mcberepair.version.in" "/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/mcberepair.version.temp" @ONLY)
configure_file("/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/mcberepair.version.temp" "/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/mcberepair.version" COPYONLY)
