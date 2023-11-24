#!/usr/bin/env bash


################################################################################
### Head: Note
##

##
## ## Link
##
## * https://github.com/samwhelp/skel-project-plan/blob/master/develop/sh/project-helper/basic/helper/bin/test.sh
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
### Head: Model / Test
##

main_test () {

	util_error_echo "main_test"



	main_test_theme_build_each



	mod_main_signal_bind

	sleep 10;

}


main_test_theme_build_each () {


	mod_theme_build_core "${THE_SOURCE_THEME_ROOT_DIR_PATH}" "${THE_TARGET_THEME_ROOT_DIR_PATH}" "vimix" "ruby" "dark" "compact"


}


main_test_mod_fix_theme () {

	mod_fix_theme_main_name "abcD"

	mod_fix_theme_bright_name "abcD"

	mod_fix_theme_color_name "abcD"

	mod_fix_theme_size_name "abcD"

}

main_test_sys_name_case () {

	sys_name_case_std "abcD"

}

main_test_util_str_case () {

	util_str_case_same "abcD"

	util_str_case_lower "abcD"

	util_str_case_upper "abcD"

	util_str_case_upper_fc "abcD"

	util_str_case_upper_fc_only "abcD"

}

##
### Tail: Model / Test
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	main_test "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
