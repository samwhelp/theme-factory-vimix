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
### Head: Model / Prepare
##

main_prepare () {

	#util_error_echo "main_prepare"

	#mod_main_signal_bind

	mod_build_essential

	#sleep 10;

}

##
### Tail: Model / Prepare
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	main_prepare "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
