# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "/Volumes/Half/Users/ckh/dev/bedrockblocks2;/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode")
set(CPACK_CMAKE_GENERATOR "Xcode")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "/usr/local/Cellar/cmake/3.18.4/share/cmake/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "mcberepair built using CMake")
set(CPACK_GENERATOR "TGZ")
set(CPACK_INSTALL_CMAKE_PROJECTS "/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode;mcberepair;ALL;/")
set(CPACK_INSTALL_PREFIX "/usr/local")
set(CPACK_MODULE_PATH "/Volumes/Half/Users/ckh/dev/bedrockblocks2/modules")
set(CPACK_NSIS_DISPLAY_NAME "mcberepair 0.2.0-prerelease")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "mcberepair 0.2.0-prerelease")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OSX_SYSROOT "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk")
set(CPACK_OUTPUT_CONFIG_FILE "/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/CPackConfig.cmake")
set(CPACK_PACKAGE_CHECKSUM "SHA256")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/usr/local/Cellar/cmake/3.18.4/share/cmake/Templates/CPack.GenericDescription.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Commandline tools for Minecraft: Bedrock Edition.")
set(CPACK_PACKAGE_FILE_NAME "mcberepair-0.2.0-prerelease-Darwin")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/reedacartwright/mcberepair/")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "mcberepair 0.2.0-prerelease")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "mcberepair 0.2.0-prerelease")
set(CPACK_PACKAGE_NAME "mcberepair")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "Reed A. Cartwright, PhD")
set(CPACK_PACKAGE_VERSION "0.2.0-prerelease")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "2")
set(CPACK_RESOURCE_FILE_LICENSE "/Volumes/Half/Users/ckh/dev/bedrockblocks2/LICENSE")
set(CPACK_RESOURCE_FILE_README "/Volumes/Half/Users/ckh/dev/bedrockblocks2/README.md")
set(CPACK_RESOURCE_FILE_WELCOME "/usr/local/Cellar/cmake/3.18.4/share/cmake/Templates/CPack.GenericWelcome.txt")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "TGZ")
set(CPACK_SOURCE_IGNORE_FILES "/\\.git/;/\\.gitattributes$;/\\.gitmodules$;/\\.github/;/\\.gitignore$;/\\.hooks-config$;/\\build/.+;/\\.circleci/;/\\.clang-format$;/\\.clang-tidy$;/\\.codecov.yml$;\\.swp$;\\.#;/#;~$")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/CPackSourceConfig.cmake")
set(CPACK_SYSTEM_NAME "Darwin")
set(CPACK_TOPLEVEL_TAG "Darwin")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/Volumes/Half/Users/ckh/dev/bedrockblocks2/xcode/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
