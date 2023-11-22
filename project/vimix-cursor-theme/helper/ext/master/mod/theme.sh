

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


	##
	## Vimix-Ruby-Dark-Compact
	##

	local theme_main_name="${3}"
	local theme_color_name="${4}"
	local theme_bright_name="${5}"
	local theme_size_name="${6}"

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
	local target_icon_theme_name="${target_theme_name}"
	local target_cursor_theme_name="${target_theme_name}"


	util_debug_echo "source_theme_root_dir_path=${source_theme_root_dir_path}"
	util_debug_echo "target_theme_root_dir_path=${target_theme_root_dir_path}"

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
	## Build Theme Dir
	##

	mkdir -p "${target_theme_dir_path}"

	##
	## index.theme
	##

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
	##

	local theme_main_name="${1}"
	local theme_color_name="${2}"
	local theme_bright_name="${3}"
	local theme_size_name="${4}"

	local source_theme_root_dir_path="${OPT_THEME_SOURCE_ROOT_DIR_PATH}"
	local target_theme_root_dir_path="${OPT_THEME_TARGET_ROOT_DIR_PATH}"



	mod_theme_build_core "${source_theme_root_dir_path}" "${target_theme_root_dir_path}" "${theme_main_name}" "${theme_bright_name}" "${theme_color_name}" "${theme_size_name}"

	return 0
}


##
### Tail: Master / Mod / Theme / Build
################################################################################
