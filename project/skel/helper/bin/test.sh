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

mod_test () {

	util_error_echo "mod_test"

	util_str_case_same "abcD"

	util_str_case_lower "abcD"

	util_str_case_upper "abcD"

	util_str_case_upper_fc "abcD"

	util_str_case_upper_fc_only "abcD"

	mod_main_signal_bind

	sleep 10;

}

##
### Tail: Model / Test
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	mod_test "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
