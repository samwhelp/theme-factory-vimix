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
### Head: Option / root-install
##

option_root_install () {


	return 0

}

##
### Tail: Option / root-install
################################################################################


################################################################################
### Head: Main / root-install
##

main_root_install () {

	util_error_echo "main_root_install"

	option_root_install

	#mod_root_install

	return 0

}

##
### Tail: Main / root-install
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	main_root_install "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
