# Configuration script for building '/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/version.h' from '/Volumes/Half/Users/ckh/dev/bedrockblocks2/version.h.in'
set(mcberepair_SEMVER_VERSION "")
set(mcberepair_SEMVER_INTEGER "")
set(mcberepair_SEMVER_MAJOR "")
set(mcberepair_SEMVER_MINOR "")
set(mcberepair_SEMVER_PATCH "")

include("/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/mcberepair.version")

configure_file("/Volumes/Half/Users/ckh/dev/bedrockblocks2/version.h.in" "/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/version.h.temp" @ONLY)
configure_file("/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/version.h.temp" "/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/version.h" COPYONLY)
