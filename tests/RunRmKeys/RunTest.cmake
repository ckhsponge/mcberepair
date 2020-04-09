include(RunMCBERepair)

set(test_db "${RunMCBERepair_BINARY_DIR}/TestWorld")

extract_world("${test_db}"
    "${RunMCBERepair_SOURCE_DIR}/../minecraftWorlds/TestWorld01.mcworld")

run_mcberepair(NoArgs rmkeys)
run_mcberepair(OneArg rmkeys "${test_db}")
run_mcberepair(OneArgPostTest listkeys "${test_db}")

run_mcberepair(MultiArgs rmkeys "${test_db}"
    "@31:-10:0:54" "@31:-10:0:118" "AutonomousEntities")
run_mcberepair(MultiArgsPostTest listkeys "${test_db}")

file(REMOVE_RECURSE "${test_db}")