

################################################################################
### Head: Master / Mod / Theme / StrCase
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
### Tail: Master / Mod / Theme / StrCase
################################################################################


################################################################################
### Head: Master / Mod / Theme / Build
##


mod_theme_build_core () {
	local theme_source_dir_path="${1}"
	local theme_target_dir_path="${2}"
	return 0
}


mod_theme_build_each () {

	local theme_source_dir_path="${OPT_THEME_SOURCE_DIR_PATH}"
	local theme_target_dir_path="${OPT_THEME_TARGET_DIR_PATH}"

	return 0
}


##
### Tail: Master / Mod / Theme / Build
################################################################################
