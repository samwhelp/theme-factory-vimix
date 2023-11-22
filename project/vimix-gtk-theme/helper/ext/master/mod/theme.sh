

################################################################################
### Head: Master / Mod / Theme / NameCase
##


mod_fix_theme_main_name () {
	sys_name_case_std "${1}"
}


mod_fix_theme_bright_name () {
	sys_name_case_std "${1}"
}


mod_fix_theme_color_name () {
	sys_name_case_std "${1}"
}


mod_fix_theme_size_name () {
	sys_name_case_std "${1}"
}


##
### Tail: Master / Mod / Theme / NameCase
################################################################################


################################################################################
### Head: Master / Mod / Theme / NameAppend
##


mod_append_theme_bright_name () {
	sys_name_append_std "${1}"
}


mod_append_theme_color_name () {
	sys_name_append_std "${1}"
}


mod_append_theme_size_name () {
	sys_name_append_std "${1}"
}


##
### Tail: Master / Mod / Theme / NameAppend
################################################################################




################################################################################
### Head: Master / Mod / Theme / Build
##


mod_theme_build_core () {

	local theme_source_root_dir_path="${1}"
	local theme_target_root_dir_path="${2}"

	local theme_main_name="${3}"
	local theme_bright_name="${4}"
	local theme_color_name="${5}"
	local theme_size_name="${6}"

	local real_theme_main_name="$(mod_fix_theme_main_name "${theme_main_name}")"
	local real_theme_bright_name="$(mod_fix_theme_bright_name "${theme_bright_name}")"
	local real_theme_color_name="$(mod_fix_theme_color_name "${theme_color_name}")"
	local real_theme_size_name="$(mod_fix_theme_size_name "${theme_size_name}")"

	local append_theme_bright_name="$(mod_append_theme_bright_name "${real_theme_bright_name}")"
	local append_theme_color_name="$(mod_append_theme_color_name "${real_theme_color_name}")"
	local append_theme_size_name="$(mod_append_theme_size_name "${real_theme_size_name}")"


	local theme_name="${real_theme_main_name}${append_theme_bright_name}${append_theme_color_name}${append_theme_size_name}"


	util_debug_echo "theme_source_root_dir_path=${theme_source_root_dir_path}"
	util_debug_echo "theme_target_root_dir_path=${theme_target_root_dir_path}"

	util_debug_echo "theme_main_name=${theme_main_name}"
	util_debug_echo "theme_bright_name=${theme_bright_name}"
	util_debug_echo "theme_color_name=${theme_color_name}"
	util_debug_echo "theme_size_name=${theme_size_name}"

	util_debug_echo "real_theme_main_name=${real_theme_main_name}"
	util_debug_echo "real_theme_bright_name=${real_theme_bright_name}"
	util_debug_echo "real_theme_color_name=${real_theme_color_name}"
	util_debug_echo "real_theme_size_name=${real_theme_size_name}"

	util_debug_echo "append_theme_bright_name=${append_theme_bright_name}"
	util_debug_echo "append_theme_color_name=${append_theme_color_name}"
	util_debug_echo "append_theme_size_name=${append_theme_size_name}"

	util_debug_echo "theme_name=${theme_name}"


	return 0
}


mod_theme_build_each () {

	local theme_main_name="${1}"
	local theme_bright_name="${2}"
	local theme_color_name="${3}"
	local theme_size_name="${4}"

	local theme_source_root_dir_path="${OPT_THEME_SOURCE_ROOT_DIR_PATH}"
	local theme_target_root_dir_path="${OPT_THEME_TARGET_ROOT_DIR_PATH}"



	mod_theme_build_core "${theme_source_root_dir_path}" "${theme_target_root_dir_path}" "${theme_main_name}" "${theme_bright_name}" "${theme_color_name}" "${theme_size_name}"

	return 0
}


##
### Tail: Master / Mod / Theme / Build
################################################################################
