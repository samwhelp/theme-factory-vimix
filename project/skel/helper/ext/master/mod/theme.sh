

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

	local source_theme_root_dir_path="${1}"
	local target_theme_root_dir_path="${2}"


	local source_theme_dir_path="${source_theme_root_dir_path}"


	##
	## Vimix-Ruby-Dark-Compact
	## ${main}-${color}-${bright}-${size}
	##

	local theme_main_name="${3}"
	local theme_color_name="${4}"
	local theme_bright_name="${5}"
	local theme_size_name="${6}"


	if [ "${theme_color_name}" = "standard" ]; then
		theme_color_name=""
	fi


	local real_theme_main_name="$(mod_fix_theme_main_name "${theme_main_name}")"
	local real_theme_bright_name="$(mod_fix_theme_bright_name "${theme_bright_name}")"
	local real_theme_color_name="$(mod_fix_theme_color_name "${theme_color_name}")"
	local real_theme_size_name="$(mod_fix_theme_size_name "${theme_size_name}")"

	local append_theme_bright_name="$(mod_append_theme_bright_name "${real_theme_bright_name}")"
	local append_theme_color_name="$(mod_append_theme_color_name "${real_theme_color_name}")"
	local append_theme_size_name="$(mod_append_theme_size_name "${real_theme_size_name}")"


	local real_theme_name="${real_theme_main_name}${append_theme_color_name}${append_theme_bright_name}${append_theme_size_name}"


	local target_theme_dir_name="${real_theme_name}"
	local target_theme_dir_path="${target_theme_root_dir_path}/${target_theme_dir_name}"


	local target_theme_name="${real_theme_name}"
	local target_gtk_theme_name="${target_theme_name}"
	local target_metacity_theme_name="${target_theme_name}"
	local target_icon_theme_name="${real_theme_main_name}${append_theme_color_name}${append_theme_bright_name}"
	local target_cursor_theme_name="Vimix-Cursor"


	util_debug_echo "source_theme_root_dir_path=${source_theme_root_dir_path}"
	util_debug_echo "target_theme_root_dir_path=${target_theme_root_dir_path}"


	util_debug_echo "source_theme_dir_path=${source_theme_root_dir_path}"


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

	util_debug_echo "real_theme_name=${real_theme_name}"


	util_debug_echo "target_theme_dir_name=${target_theme_dir_name}"
	util_debug_echo "target_theme_dir_path=${target_theme_dir_path}"


	util_debug_echo "target_theme_name=${target_theme_name}"
	util_debug_echo "target_gtk_theme_name=${target_gtk_theme_name}"
	util_debug_echo "target_metacity_theme_name=${target_metacity_theme_name}"
	util_debug_echo "target_icon_theme_name=${target_icon_theme_name}"
	util_debug_echo "target_cursor_theme_name=${target_cursor_theme_name}"



	#################
	## Build Start ##
	#################

	##
	## Remove Old Theme Dir
	##

	if [ -d "${target_theme_dir_path}" ]; then
		util_error_echo
		util_error_echo rm -rf "${target_theme_dir_path}"
		rm -rf "${target_theme_dir_path}"
	fi

	##
	## Build Theme Dir
	##

	util_error_echo
	util_error_echo mkdir -p "${target_theme_dir_path}"
	mkdir -p "${target_theme_dir_path}"

	##
	## index.theme
	##


	util_error_echo
	util_error_echo "Create File: ${target_theme_dir_path}/index.theme"


cat > "${target_theme_dir_path}/index.theme" << __EOF__
[Desktop Entry]
Type=X-GNOME-Metatheme
Name=${target_theme_name}
Comment=Clean Gtk+ theme based on Material Design
Encoding=UTF-8

[X-GNOME-Metatheme]
GtkTheme=${target_gtk_theme_name}
MetacityTheme=${target_metacity_theme_name}
IconTheme=${target_icon_theme_name}
CursorTheme=${target_cursor_theme_name}
ButtonLayout=menu:minimize,maximize,close
__EOF__

	return 0
}


mod_theme_build_each () {

	##
	## Vimix-Ruby-Dark-Compact
	## ${main}-${color}-${bright}-${size}
	##

	local theme_main_name="${1}"
	local theme_color_name="${2}"
	local theme_bright_name="${3}"
	local theme_size_name="${4}"

	local source_theme_root_dir_path="${OPT_SOURCE_THEME_ROOT_DIR_PATH:=${THE_SOURCE_THEME_ROOT_DIR_PATH}}"
	local target_theme_root_dir_path="${OPT_TARGET_THEME_ROOT_DIR_PATH:=${THE_TARGET_THEME_ROOT_DIR_PATH}}"


	mod_theme_build_core "${source_theme_root_dir_path}" "${target_theme_root_dir_path}" "${theme_main_name}" "${theme_color_name}" "${theme_bright_name}" "${theme_size_name}"

	return 0
}


mod_theme_build_all () {

	local target_theme_build_color_list=${OPT_TARGET_THEME_BUILD_COLOR_LIST[@]:=${THE_TARGET_THEME_BUILD_COLOR_LIST[@]}}
	local target_theme_build_bright_list=${OPT_TARGET_THEME_BUILD_BRIGHT_LIST[@]:=${THE_TARGET_THEME_BUILD_BRIGHT_LIST[@]}}


	local theme_main_name="${THE_TARGET_THEME_BUILD_MAIN_NAME:=${THE_TARGET_THEME_BUILD_MAIN_NAME}}"
	local theme_color_name
	local theme_bright_name

	for theme_color_name in ${target_theme_build_color_list[@]}; do
		for theme_bright_name in ${target_theme_build_bright_list[@]}; do
			util_error_echo
			util_error_echo "##"
			util_error_echo "##" mod_theme_build_each "${theme_main_name}" "${theme_color_name}" "${theme_bright_name}"
			util_error_echo "##"
			util_error_echo
			mod_theme_build_each "${theme_main_name}" "${theme_color_name}" "${theme_bright_name}"
		done
	done

	return 0
}

##
### Tail: Master / Mod / Theme / Build
################################################################################




################################################################################
### Head: Master / Mod / Tmp / Clean
##


mod_tmp_clean () {

	util_error_echo "rm -rf ${THE_MASTER_TMP_DIR_PATH}"
	rm -rf "${THE_MASTER_TMP_DIR_PATH}"

	return 0
}


##
### Tail: Master / Mod / Tmp / Clean
################################################################################


################################################################################
### Head: Master / Mod / Theme / Build / Essential
##


mod_build_essential () {
	util_error_echo "mod_build_essential: **Do Nothing**"
}


##
### Tail: Master / Mod / Theme / Build / Essential
################################################################################
