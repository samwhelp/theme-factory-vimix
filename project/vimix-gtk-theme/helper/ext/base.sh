

################################################################################
### Head: Util / Debug
##

util_debug_echo () {

	if is_debug; then
		echo "${@}" 1>&2
	fi

}

util_error_echo () {

	echo "${@}" 1>&2

}

##
### Head: Util / Debug
################################################################################


################################################################################
### Head: Base
##

##
## THE_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
##

find_dir_path () {

	if ! [ -d "$(dirname -- "${1}")" ]; then
		dirname -- "${1}"
		return 1
	fi
	echo "$(cd -- "$(dirname -- "${1}")" ; pwd)"

}

##
## THIS_BASE_DIR_PATH="$(find_dir_path "${0}")"
##


##
## $ export DEBUG_HELPER=true
##

is_debug () {

	if [ "${DEBUG_HELPER}" = "true" ]; then
		return 0
	fi

	return 1

}

is_not_debug () {

	! is_debug

}

base_var_init () {

	##
	## ## Base Path
	##

	THE_INIT_DIR_PATH="$(find_dir_path "${THE_INIT_DIR_PATH}/.")"
	THE_PLAN_DIR_PATH="$(find_dir_path "${THE_INIT_DIR_PATH}/../../.")"




	##
	## ## Main Path
	##

	THE_MAIN_DIR_NAME="helper"
	THE_MAIN_DIR_PATH="${THE_PLAN_DIR_PATH}/${THE_MAIN_DIR_NAME}"


	##
	## ## Main Path / Sub
	##

	THE_MAIN_BIN_DIR_NAME="bin"
	THE_MAIN_BIN_DIR_PATH="${THE_MAIN_DIR_PATH}/${THE_MAIN_BIN_DIR_NAME}"

	THE_MAIN_EXT_DIR_NAME="ext"
	THE_MAIN_EXT_DIR_PATH="${THE_MAIN_DIR_PATH}/${THE_MAIN_EXT_DIR_NAME}"

	THE_MAIN_MAK_DIR_NAME="mak"
	THE_MAIN_MAK_DIR_PATH="${THE_MAIN_DIR_PATH}/${THE_MAIN_MAK_DIR_NAME}"

	THE_MAIN_SYS_DIR_NAME="sys"
	THE_MAIN_SYS_DIR_PATH="${THE_MAIN_DIR_PATH}/${THE_MAIN_SYS_DIR_NAME}"

	THE_MAIN_SHARE_DIR_NAME="share"
	THE_MAIN_SHARE_DIR_PATH="${THE_MAIN_DIR_PATH}/${THE_MAIN_SHARE_DIR_NAME}"

	THE_MAIN_TMP_DIR_NAME="tmp"
	THE_MAIN_TMP_DIR_PATH="${THE_MAIN_DIR_PATH}/${THE_MAIN_TMP_DIR_NAME}"




	##
	## ## Main Path / Ext / Main
	##

	THE_MAIN_EXT_MAIN_DIR_NAME="main"
	THE_MAIN_EXT_MAIN_DIR_PATH="${THE_MAIN_EXT_DIR_PATH}/${THE_MAIN_EXT_MAIN_DIR_NAME}"


	##
	## ## Main Path / Ext / Main / Sub
	##

	THE_MAIN_EXT_MAIN_UTIL_DIR_NAME="util"
	THE_MAIN_EXT_MAIN_UTIL_DIR_PATH="${THE_MAIN_EXT_MAIN_DIR_PATH}/${THE_MAIN_EXT_MAIN_UTIL_DIR_NAME}"

	THE_MAIN_EXT_MAIN_SYS_DIR_NAME="sys"
	THE_MAIN_EXT_MAIN_SYS_DIR_PATH="${THE_MAIN_EXT_MAIN_DIR_PATH}/${THE_MAIN_EXT_MAIN_SYS_DIR_NAME}"

	THE_MAIN_EXT_MAIN_MOD_DIR_NAME="mod"
	THE_MAIN_EXT_MAIN_MOD_DIR_PATH="${THE_MAIN_EXT_MAIN_DIR_PATH}/${THE_MAIN_EXT_MAIN_MOD_DIR_NAME}"




	##
	## ## Main Path / Ext / Master
	##

	THE_MAIN_EXT_MASTER_DIR_NAME="master"
	THE_MAIN_EXT_MASTER_DIR_PATH="${THE_MAIN_EXT_DIR_PATH}/${THE_MAIN_EXT_MASTER_DIR_NAME}"


	##
	## ## Main Path / Ext / Master / Sub
	##

	THE_MAIN_EXT_MASTER_UTIL_DIR_NAME="util"
	THE_MAIN_EXT_MASTER_UTIL_DIR_PATH="${THE_MAIN_EXT_MASTER_DIR_PATH}/${THE_MAIN_EXT_MASTER_UTIL_DIR_NAME}"

	THE_MAIN_EXT_MASTER_SYS_DIR_NAME="sys"
	THE_MAIN_EXT_MASTER_SYS_DIR_PATH="${THE_MAIN_EXT_MASTER_DIR_PATH}/${THE_MAIN_EXT_MASTER_SYS_DIR_NAME}"

	THE_MAIN_EXT_MASTER_MOD_DIR_NAME="mod"
	THE_MAIN_EXT_MASTER_MOD_DIR_PATH="${THE_MAIN_EXT_MASTER_DIR_PATH}/${THE_MAIN_EXT_MASTER_MOD_DIR_NAME}"




	##
	############################################################################
	##




	##
	## ## Master Path
	##

	THE_MASTER_DIR_PATH="${THE_PLAN_DIR_PATH}"


	##
	## ## Master Path / Sub
	##

	THE_MASTER_ASSET_DIR_NAME="asset"
	THE_MASTER_ASSET_DIR_PATH="${THE_MASTER_DIR_PATH}/${THE_MASTER_ASSET_DIR_NAME}"

	THE_MASTER_TOOL_DIR_NAME="tool"
	THE_MASTER_TOOL_DIR_PATH="${THE_MASTER_DIR_PATH}/${THE_MASTER_TOOL_DIR_NAME}"

	THE_MASTER_TMP_DIR_NAME="tmp"
	THE_MASTER_TMP_DIR_PATH="${THE_MASTER_DIR_PATH}/${THE_MASTER_TMP_DIR_NAME}"




	##
	## ## Master Path / Source
	##

	THE_SOURCE_THEME_ROOT_DIR_NAME="vimix-gtk-theme"
	THE_SOURCE_THEME_ROOT_DIR_PATH="${THE_MASTER_ASSET_DIR_PATH}/${THE_SOURCE_THEME_ROOT_DIR_NAME}"


	##
	## ## Master Path / Target
	##

	THE_TARGET_THEME_ROOT_DIR_NAME="dist"
	THE_TARGET_THEME_ROOT_DIR_PATH="${THE_MASTER_TMP_DIR_PATH}/${THE_TARGET_THEME_ROOT_DIR_NAME}"


	##
	## ## Master Path / Target / Build Option
	##

	readonly THE_TARGET_THEME_BUILD_MAIN_NAME="vimix"
	readonly THE_TARGET_THEME_BUILD_COLOR_LIST=("amethyst" "beryl" "doder" "ruby" "jade" "grey")
	readonly THE_TARGET_THEME_BUILD_BRIGHT_LIST=("standard" "light" "dark")
	readonly THE_TARGET_THEME_BUILD_SIZE_LIST=("standard" "compact")

	return 0

}

base_var_dump () {

	is_not_debug && return 0

	util_debug_echo
	util_debug_echo "################################################################################"
	util_debug_echo "### Head: var_dump"
	util_debug_echo "##"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Note"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "##"
	util_debug_echo "## **Hide This Info**"
	util_debug_echo "##"
	util_debug_echo "## \$ export DEBUG_HELPER=false"
	util_debug_echo "##"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Base Path"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "THE_BASE_DIR_PATH=${THE_BASE_DIR_PATH}"
	util_debug_echo "THE_INIT_DIR_PATH=${THE_INIT_DIR_PATH}"
	util_debug_echo "THE_PLAN_DIR_PATH=${THE_PLAN_DIR_PATH}"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "THE_MAIN_DIR_NAME=${THE_MAIN_DIR_NAME}"
	util_debug_echo "THE_MAIN_DIR_PATH=${THE_MAIN_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "THE_MAIN_BIN_DIR_NAME=${THE_MAIN_BIN_DIR_NAME}"
	util_debug_echo "THE_MAIN_BIN_DIR_PATH=${THE_MAIN_BIN_DIR_PATH}"
	util_debug_echo

	util_debug_echo "THE_MAIN_EXT_DIR_NAME=${THE_MAIN_EXT_DIR_NAME}"
	util_debug_echo "THE_MAIN_EXT_DIR_PATH=${THE_MAIN_EXT_DIR_PATH}"
	util_debug_echo

	util_debug_echo "THE_MAIN_MAK_DIR_NAME=${THE_MAIN_MAK_DIR_NAME}"
	util_debug_echo "THE_MAIN_MAK_DIR_PATH=${THE_MAIN_MAK_DIR_PATH}"
	util_debug_echo

	util_debug_echo "THE_MAIN_SYS_DIR_NAME=${THE_MAIN_SYS_DIR_NAME}"
	util_debug_echo "THE_MAIN_SYS_DIR_PATH=${THE_MAIN_SYS_DIR_PATH}"
	util_debug_echo

	util_debug_echo "THE_MAIN_SHARE_DIR_NAME=${THE_MAIN_SHARE_DIR_NAME}"
	util_debug_echo "THE_MAIN_SHARE_DIR_PATH=${THE_MAIN_SHARE_DIR_PATH}"
	util_debug_echo

	util_debug_echo "THE_MAIN_TMP_DIR_NAME=${THE_MAIN_TMP_DIR_NAME}"
	util_debug_echo "THE_MAIN_TMP_DIR_PATH=${THE_MAIN_TMP_DIR_PATH}"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path / Ext / Main"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "THE_MAIN_EXT_MAIN_DIR_NAME=${THE_MAIN_EXT_MAIN_DIR_NAME}"
	util_debug_echo "THE_MAIN_EXT_MAIN_DIR_PATH=${THE_MAIN_EXT_MAIN_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path / Ext / Main / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "THE_MAIN_EXT_MAIN_UTIL_DIR_NAME=${THE_MAIN_EXT_MAIN_UTIL_DIR_NAME}"
	util_debug_echo "THE_MAIN_EXT_MAIN_UTIL_DIR_PATH=${THE_MAIN_EXT_MAIN_UTIL_DIR_PATH}"
	util_debug_echo

	util_debug_echo "THE_MAIN_EXT_MAIN_SYS_DIR_NAME=${THE_MAIN_EXT_MAIN_SYS_DIR_NAME}"
	util_debug_echo "THE_MAIN_EXT_MAIN_SYS_DIR_PATH=${THE_MAIN_EXT_MAIN_SYS_DIR_PATH}"
	util_debug_echo

	util_debug_echo "THE_MAIN_EXT_MAIN_MOD_DIR_NAME=${THE_MAIN_EXT_MAIN_MOD_DIR_NAME}"
	util_debug_echo "THE_MAIN_EXT_MAIN_MOD_DIR_PATH=${THE_MAIN_EXT_MAIN_MOD_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path / Ext / Master"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "THE_MAIN_EXT_MASTER_DIR_NAME=${THE_MAIN_EXT_MASTER_DIR_NAME}"
	util_debug_echo "THE_MAIN_EXT_MASTER_DIR_PATH=${THE_MAIN_EXT_MASTER_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path / Ext / Master / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "THE_MAIN_EXT_MASTER_UTIL_DIR_NAME=${THE_MAIN_EXT_MASTER_UTIL_DIR_NAME}"
	util_debug_echo "THE_MAIN_EXT_MASTER_UTIL_DIR_PATH=${THE_MAIN_EXT_MASTER_UTIL_DIR_PATH}"
	util_debug_echo

	util_debug_echo "THE_MAIN_EXT_MASTER_SYS_DIR_NAME=${THE_MAIN_EXT_MASTER_SYS_DIR_NAME}"
	util_debug_echo "THE_MAIN_EXT_MASTER_SYS_DIR_PATH=${THE_MAIN_EXT_MASTER_SYS_DIR_PATH}"
	util_debug_echo

	util_debug_echo "THE_MAIN_EXT_MASTER_MOD_DIR_NAME=${THE_MAIN_EXT_MASTER_MOD_DIR_NAME}"
	util_debug_echo "THE_MAIN_EXT_MASTER_MOD_DIR_PATH=${THE_MAIN_EXT_MASTER_MOD_DIR_PATH}"
	util_debug_echo




	##
	############################################################################
	##




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## ## Master Path"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "THE_MASTER_DIR_PATH=${THE_MASTER_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "THE_MASTER_ASSET_DIR_NAME=${THE_MASTER_ASSET_DIR_NAME}"
	util_debug_echo "THE_MASTER_ASSET_DIR_PATH=${THE_MASTER_ASSET_DIR_PATH}"
	util_debug_echo

	util_debug_echo "THE_MASTER_TOOL_DIR_NAME=${THE_MASTER_TOOL_DIR_NAME}"
	util_debug_echo "THE_MASTER_TOOL_DIR_PATH=${THE_MASTER_TOOL_DIR_PATH}"
	util_debug_echo

	util_debug_echo "THE_MASTER_TMP_DIR_NAME=${THE_MASTER_TMP_DIR_NAME}"
	util_debug_echo "THE_MASTER_TMP_DIR_PATH=${THE_MASTER_TMP_DIR_PATH}"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Source"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "THE_SOURCE_THEME_ROOT_DIR_NAME=${THE_SOURCE_THEME_ROOT_DIR_NAME}"
	util_debug_echo "THE_SOURCE_THEME_ROOT_DIR_PATH=${THE_SOURCE_THEME_ROOT_DIR_PATH}"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Target"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "THE_TARGET_THEME_ROOT_DIR_NAME=${THE_TARGET_THEME_ROOT_DIR_NAME}"
	util_debug_echo "THE_TARGET_THEME_ROOT_DIR_PATH=${THE_TARGET_THEME_ROOT_DIR_PATH}"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Target / Build Option"
	util_debug_echo "##"
	util_debug_echo


	util_debug_echo "THE_TARGET_THEME_BUILD_MAIN_NAME=${THE_TARGET_THEME_BUILD_MAIN_NAME}"
	util_debug_echo "THE_TARGET_THEME_BUILD_COLOR_LIST=${THE_TARGET_THEME_BUILD_COLOR_LIST[@]}"
	util_debug_echo "THE_TARGET_THEME_BUILD_BRIGHT_LIST=${THE_TARGET_THEME_BUILD_BRIGHT_LIST[@]}"
	util_debug_echo "THE_TARGET_THEME_BUILD_SIZE_LIST=${THE_TARGET_THEME_BUILD_SIZE_LIST[@]}"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "### Tail: var_dump"
	util_debug_echo "################################################################################"
	util_debug_echo


	util_debug_echo
	util_debug_echo
	util_debug_echo


	return 0

}

##
### Tail: Base
################################################################################
