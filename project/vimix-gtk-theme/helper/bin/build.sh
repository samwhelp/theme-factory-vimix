#!/usr/bin/env bash


################################################################################
### Head: Note
##

##
## ## Link
##
## * https://github.com/samwhelp/skel-project-plan/blob/master/develop/sh/project-helper/basic/helper/bin/prepare.sh
##

##
### Tail: Note
################################################################################


################################################################################
### Head: Init
##

THE_BASE_DIR_PATH="$(cd -- "$(dirname -- "${0}")" ; pwd)"
THE_INIT_DIR_PATH="${THE_BASE_DIR_PATH}/../ext"
. "${THE_INIT_DIR_PATH}/init.sh"

##
### Tail: Init
################################################################################


################################################################################
### Head: Option / Build
##

option_build () {


	##
	## Option for mod_theme_build_each
	##

	OPT_SOURCE_THEME_ROOT_DIR_PATH="${OPT_SOURCE_THEME_ROOT_DIR_PATH:=${THE_SOURCE_THEME_ROOT_DIR_PATH}}"
	OPT_TARGET_THEME_ROOT_DIR_PATH="${OPT_TARGET_THEME_ROOT_DIR_PATH:=${THE_TARGET_THEME_ROOT_DIR_PATH}}"


	OPT_BUILDING_TWEAKS="${OPT_BUILDING_TWEAKS:=${THE_BUILDING_TWEAKS}}"
	OPT_BUILDING_FLAT="${OPT_BUILDING_FLAT:=${THE_BUILDING_FLAT}}"
	OPT_BUILDING_GREY="${OPT_BUILDING_GREY:=${THE_BUILDING_GREY}}"
	OPT_BUILDING_MIX="${OPT_BUILDING_MIX:=${THE_BUILDING_MIX}}"
	OPT_BUILDING_TRANSLUCENT="${OPT_BUILDING_TRANSLUCENT:=${THE_BUILDING_TRANSLUCENT}}"


	OPT_GNOME_SHELL_VERSION="${OPT_GNOME_SHELL_VERSION:=${THE_GNOME_SHELL_VERSION}}"


	##
	## Option for mod_theme_build_all
	##

	OPT_TARGET_THEME_BUILD_MAIN_NAME="${OPT_TARGET_THEME_BUILD_MAIN_NAME:=${THE_TARGET_THEME_BUILD_MAIN_NAME}}"
	OPT_TARGET_THEME_BUILD_COLOR_LIST=${THE_TARGET_THEME_BUILD_COLOR_LIST[@]}
	OPT_TARGET_THEME_BUILD_BRIGHT_LIST=${THE_TARGET_THEME_BUILD_BRIGHT_LIST[@]}
	OPT_TARGET_THEME_BUILD_SIZE_LIST=${THE_TARGET_THEME_BUILD_SIZE_LIST[@]}


	return 0

}

##
### Tail: Option / Build
################################################################################


################################################################################
### Head: Main / Build
##

main_build () {

	util_error_echo "main_build"

	option_build

	##mod_theme_build_each "vimix" "ruby" "dark" "compact"

	mod_theme_build_all

	return 0

}

##
### Tail: Main / Build
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	main_build "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
