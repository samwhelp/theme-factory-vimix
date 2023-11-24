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
### Head: Option / user-install
##

option_user_install () {


	return 0

}

##
### Tail: Option / user-install
################################################################################


################################################################################
### Head: Main / user-install
##

main_user_install () {

	util_error_echo "main_user_install"

	option_user_install

	#mod_user_install

	return 0

}

##
### Tail: Main / user-install
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	main_user_install "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
