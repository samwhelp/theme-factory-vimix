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
### Head: Main
##

__main__ () {

cat << EOF

Usage:

	$ make [action]

Example:

	$ make
	$ make help

	$ make prepare


Debug:
	$ export DEBUG_HELPER=true

EOF

}

__main__ "${@}"

##
### Tail: Main
################################################################################
