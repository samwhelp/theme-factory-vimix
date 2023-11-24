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
### Head: Option / dist-install
##

option_dist_install () {


	return 0

}

##
### Tail: Option / dist-install
################################################################################


################################################################################
### Head: Main / dist-install
##

main_dist_install () {

	util_error_echo "main_dist_install"

	option_dist_install

	#mod_dist_install

	return 0

}

##
### Tail: Main / dist-install
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	main_dist_install "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
