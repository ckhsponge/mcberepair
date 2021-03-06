include(RunMCBERepair)

set(test_db "${RunMCBERepair_BINARY_DIR}/TestWorld")

extract_world("${test_db}"
    "${RunMCBERepair_SOURCE_DIR}/../minecraftWorlds/TestWorld01.mcworld")

run_mcberepair(NoArgs listkeys)
run_mcberepair(OneArg listkeys "${test_db}")

run_mcberepair(BadCommand listkeys noexist)

run_mcberepair(Help help listkeys)

file(REMOVE_RECURSE "${test_db}")
