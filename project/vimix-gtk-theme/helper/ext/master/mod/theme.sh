

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

	local asset_root_dir_path="${THE_MASTER_ASSET_DIR_PATH}"

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


	if [[ "${theme_color_name}" == "standard" ]]; then
		theme_color_name=""
	fi

	if [[ "${theme_bright_name}" == "standard" ]]; then
		theme_bright_name=""
	fi

	if [[ "${theme_size_name}" == "standard" ]]; then
		theme_size_name=""
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
	## fix for [birght=standard]
	if [[ -z "${theme_bright_name}" ]]; then
		target_icon_theme_name="${real_theme_main_name}${append_theme_color_name}-Light"
	fi
	local target_cursor_theme_name="Vimix-Cursor"




	local append_else_dark
	if [[ "${theme_bright_name}" == 'dark' ]]; then
		append_else_dark="$(mod_append_theme_bright_name "dark")"
	fi


	local append_else_light
	if [[ "${theme_bright_name}" != 'dark' ]]; then
		append_else_light="$(mod_append_theme_bright_name "light")"
	fi




	local scss_compile_cmd="${OPT_SCSS_COMPILE_CMD:=${THE_SCSS_COMPILE_CMD}}"
	local scss_compile_opt="${OPT_SCSS_COMPILE_OPT:=${THE_SCSS_COMPILE_OPT}}"
	local scss_compile="${scss_compile_cmd} ${scss_compile_opt}"



	local gnome_shell_version="${OPT_GNOME_SHELL_VERSION:=${THE_GNOME_SHELL_VERSION}}"




	util_debug_echo "asset_root_dir_path=${asset_root_dir_path}"

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


	util_debug_echo "append_else_dark=${append_else_dark}"
	util_debug_echo "append_else_light=${append_else_light}"




	util_debug_echo "scss_compile_cmd=${scss_compile_cmd}"
	util_debug_echo "scss_compile_opt=${scss_compile_opt}"
	util_debug_echo "scss_compile=${scss_compile}"


	util_debug_echo "gnome_shell_version=${gnome_shell_version}"


	##################
	## Build Tweaks ##
	##################

	##
	## Build Tweaks / Option
	##


	local is_building_flat="${OPT_BUILDING_FLAT:=${THE_BUILDING_FLAT}}"
	local is_building_grey="${OPT_BUILDING_GREY:=${THE_BUILDING_GREY}}"
	local is_building_mix="${OPT_BUILDING_MIX:=${THE_BUILDING_MIX}}"
	local is_building_translucent="${OPT_BUILDING_TRANSLUCENT:=${THE_BUILDING_TRANSLUCENT}}"
	local is_building_compact="${OPT_BUILDING_COMPACT:=${THE_BUILDING_COMPACT}}"
	local is_building_accent="${OPT_BUILDING_ACCENT:=${THE_BUILDING_ACCENT}}"


	mod_build_tweaks  "${source_theme_root_dir_path}" "${target_theme_root_dir_path}" "${theme_main_name}" "${theme_color_name}" "${theme_bright_name}" "${theme_size_name}"


	local is_building_tweaks="${OPT_BUILDING_TWEAKS:=${THE_BUILDING_TWEAKS}}"

	util_debug_echo "is_building_tweaks=${is_building_tweaks}"
	util_debug_echo "is_building_flat=${is_building_flat}"
	util_debug_echo "is_building_grey=${is_building_grey}"
	util_debug_echo "is_building_mix=${is_building_mix}"
	util_debug_echo "is_building_translucent=${is_building_translucent}"
	util_debug_echo "is_building_compact=${is_building_compact}"
	util_debug_echo "is_building_accent=${is_building_accent}"




	#################
	## Build Start ##
	#################


	##
	## Remove Old Theme Dir
	##

	if [[ -d "${target_theme_dir_path}" ]]; then
		util_debug_echo
		util_debug_echo rm -rf "${target_theme_dir_path}"
		rm -rf "${target_theme_dir_path}"
	fi


	##
	## Build Theme Dir
	##

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}"
	mkdir -p "${target_theme_dir_path}"


	##
	## README.md
	##

	util_debug_echo
	util_debug_echo install -Dm644 "${asset_root_dir_path}/README.md" "${target_theme_dir_path}/README.md"
	install -Dm644 "${asset_root_dir_path}/README.md" "${target_theme_dir_path}/README.md"


	##
	## index.theme
	##

	util_debug_echo
	util_debug_echo "Create File: ${target_theme_dir_path}/index.theme"


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


	##
	## LICENSE
	##

	util_debug_echo
	util_debug_echo install -Dm644 "${source_theme_root_dir_path}/LICENSE" "${target_theme_dir_path}/LICENSE"
	install -Dm644 "${source_theme_root_dir_path}/LICENSE" "${target_theme_dir_path}/LICENSE"

	util_debug_echo
	util_debug_echo install -Dm644 "${source_theme_root_dir_path}/AUTHORS" "${target_theme_dir_path}/AUTHORS"
	install -Dm644 "${source_theme_root_dir_path}/AUTHORS" "${target_theme_dir_path}/AUTHORS"




	##
	## theme / gtk2
	##

	util_debug_echo
	util_debug_echo "### theme / gtk2"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/gtk-2.0"
	mkdir -p "${target_theme_dir_path}/gtk-2.0"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/gtk-2.0/assets"
	mkdir -p "${target_theme_dir_path}/gtk-2.0/assets"

	util_debug_echo
	util_debug_echo cp -f "${source_theme_root_dir_path}/src/gtk-2.0/common"/*.rc "${target_theme_dir_path}/gtk-2.0"
	cp -f "${source_theme_root_dir_path}/src/gtk-2.0/common"/*.rc "${target_theme_dir_path}/gtk-2.0"

	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/gtk-2.0/assets/vimix${append_theme_color_name,,}/assets${append_else_dark,,}"/. "${target_theme_dir_path}/gtk-2.0/assets"
	cp -rf "${source_theme_root_dir_path}/src/gtk-2.0/assets/vimix${append_theme_color_name,,}/assets${append_else_dark,,}"/. "${target_theme_dir_path}/gtk-2.0/assets"

	util_debug_echo
	util_debug_echo cp -f "${source_theme_root_dir_path}/src/gtk-2.0/gtkrc${append_theme_bright_name,,}${append_theme_color_name,,}" "${target_theme_dir_path}/gtk-2.0/gtkrc"
	cp -f "${source_theme_root_dir_path}/src/gtk-2.0/gtkrc${append_theme_bright_name,,}${append_theme_color_name,,}" "${target_theme_dir_path}/gtk-2.0/gtkrc"


	##
	## theme / gtk3
	##

	util_debug_echo
	util_debug_echo "### theme / gtk3"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/gtk-3.0"
	mkdir -p "${target_theme_dir_path}/gtk-3.0"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/gtk-3.0/assets"
	mkdir -p "${target_theme_dir_path}/gtk-3.0/assets"

	util_debug_echo
	util_debug_echo cp -f "${source_theme_root_dir_path}/src/gtk/assets/assets${append_theme_color_name,,}"/*.png "${target_theme_dir_path}/gtk-3.0/assets"
	cp -f "${source_theme_root_dir_path}/src/gtk/assets/assets${append_theme_color_name,,}"/*.png "${target_theme_dir_path}/gtk-3.0/assets"




	if [[ "${is_building_flat}" != "true" ]]; then
		if [[ "${is_building_grey}" == "true" ]]; then
			util_debug_echo
			util_debug_echo cp -rf "${source_theme_root_dir_path}/src/gtk/assets/window-assets-contrast"/. "${target_theme_dir_path}/gtk-3.0/assets/window-assets"
			cp -rf "${source_theme_root_dir_path}/src/gtk/assets/window-assets-contrast"/. "${target_theme_dir_path}/gtk-3.0/assets/window-assets"
		else
			util_debug_echo
			util_debug_echo cp -rf "${source_theme_root_dir_path}/src/gtk/assets/window-assets"/. "${target_theme_dir_path}/gtk-3.0/assets/window-assets"
			cp -rf "${source_theme_root_dir_path}/src/gtk/assets/window-assets"/. "${target_theme_dir_path}/gtk-3.0/assets/window-assets"
		fi
	fi




	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/gtk/assets/scalable"/. "${target_theme_dir_path}/gtk-3.0/assets/scalable"
	cp -rf "${source_theme_root_dir_path}/src/gtk/assets/scalable"/. "${target_theme_dir_path}/gtk-3.0/assets/scalable"




	if [[ "${is_building_tweaks}" == "true" ]]; then
		util_debug_echo
		util_debug_echo ${scss_compile} "${source_theme_root_dir_path}/src/gtk/3.0/gtk${append_theme_bright_name,,}.scss" "${target_theme_dir_path}/gtk-3.0/gtk.css"
		${scss_compile} "${source_theme_root_dir_path}/src/gtk/3.0/gtk${append_theme_bright_name,,}.scss" "${target_theme_dir_path}/gtk-3.0/gtk.css"

		util_debug_echo
		util_debug_echo ${scss_compile} "${source_theme_root_dir_path}/src/gtk/3.0/gtk-dark.scss" "${target_theme_dir_path}/gtk-3.0/gtk-dark.css"
		${scss_compile} "${source_theme_root_dir_path}/src/gtk/3.0/gtk-dark.scss" "${target_theme_dir_path}/gtk-3.0/gtk-dark.css"
	else
		util_debug_echo
		util_debug_echo cp -f "${source_theme_root_dir_path}/src/gtk/3.0/gtk${append_theme_bright_name,,}.css" "${target_theme_dir_path}/gtk-3.0/gtk.css"
		cp -f "${source_theme_root_dir_path}/src/gtk/3.0/gtk${append_theme_bright_name,,}.css" "${target_theme_dir_path}/gtk-3.0/gtk.css"

		util_debug_echo
		util_debug_echo cp -f "${source_theme_root_dir_path}/src/gtk/3.0/gtk-dark.css" "${target_theme_dir_path}/gtk-3.0/gtk-dark.css"
		cp -f "${source_theme_root_dir_path}/src/gtk/3.0/gtk-dark.css" "${target_theme_dir_path}/gtk-3.0/gtk-dark.css"
	fi




	util_debug_echo
	util_debug_echo cp -f "${source_theme_root_dir_path}/src/gtk/assets/thumbnails/thumbnail${append_theme_bright_name,,}${append_theme_color_name,,}.png" "${target_theme_dir_path}/gtk-3.0/thumbnail.png"
	cp -f "${source_theme_root_dir_path}/src/gtk/assets/thumbnails/thumbnail${append_theme_bright_name,,}${append_theme_color_name,,}.png" "${target_theme_dir_path}/gtk-3.0/thumbnail.png"




	##
	## theme / gtk4
	##

	util_debug_echo
	util_debug_echo "### theme / gtk4"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/gtk-4.0"
	mkdir -p "${target_theme_dir_path}/gtk-4.0"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/gtk-4.0/assets"
	mkdir -p "${target_theme_dir_path}/gtk-4.0/assets"


	util_debug_echo
	util_debug_echo cp -f "${source_theme_root_dir_path}/src/gtk/assets/assets${append_theme_color_name,,}"/*.png "${target_theme_dir_path}/gtk-4.0/assets"
	cp -f "${source_theme_root_dir_path}/src/gtk/assets/assets${append_theme_color_name,,}"/*.png "${target_theme_dir_path}/gtk-4.0/assets"




	if [[ "${is_building_flat}" != "true" ]]; then
		if [[ "${is_building_grey}" == "true" ]]; then
			util_debug_echo
			util_debug_echo cp -rf "${source_theme_root_dir_path}/src/gtk/assets/window-assets-contrast"/. "${target_theme_dir_path}/gtk-4.0/assets/window-assets"
			cp -rf "${source_theme_root_dir_path}/src/gtk/assets/window-assets-contrast"/. "${target_theme_dir_path}/gtk-4.0/assets/window-assets"
		else
			util_debug_echo
			util_debug_echo cp -rf "${source_theme_root_dir_path}/src/gtk/assets/window-assets"/. "${target_theme_dir_path}/gtk-4.0/assets/window-assets"
			cp -rf "${source_theme_root_dir_path}/src/gtk/assets/window-assets"/. "${target_theme_dir_path}/gtk-4.0/assets/window-assets"
		fi
	fi




	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/gtk/assets/scalable"/. "${target_theme_dir_path}/gtk-4.0/assets/scalable"
	cp -rf "${source_theme_root_dir_path}/src/gtk/assets/scalable"/. "${target_theme_dir_path}/gtk-4.0/assets/scalable"




	if [[ "${is_building_tweaks}" == "true" ]]; then
		util_debug_echo
		util_debug_echo ${scss_compile} "${source_theme_root_dir_path}/src/gtk/4.0/gtk${append_theme_bright_name,,}.scss" "${target_theme_dir_path}/gtk-4.0/gtk.css"
		${scss_compile} "${source_theme_root_dir_path}/src/gtk/4.0/gtk${append_theme_bright_name,,}.scss" "${target_theme_dir_path}/gtk-4.0/gtk.css"

		util_debug_echo
		util_debug_echo ${scss_compile} "${source_theme_root_dir_path}/src/gtk/4.0/gtk-dark.scss" "${target_theme_dir_path}/gtk-4.0/gtk-dark.css"
		${scss_compile} "${source_theme_root_dir_path}/src/gtk/4.0/gtk-dark.scss" "${target_theme_dir_path}/gtk-4.0/gtk-dark.css"
	else
		util_debug_echo
		util_debug_echo cp -f "${source_theme_root_dir_path}/src/gtk/4.0/gtk${append_theme_bright_name,,}.css" "${target_theme_dir_path}/gtk-4.0/gtk.css"
		cp -f "${source_theme_root_dir_path}/src/gtk/4.0/gtk${append_theme_bright_name,,}.css" "${target_theme_dir_path}/gtk-4.0/gtk.css"

		util_debug_echo
		util_debug_echo cp -f "${source_theme_root_dir_path}/src/gtk/4.0/gtk-dark.css" "${target_theme_dir_path}/gtk-4.0/gtk-dark.css"
		cp -f "${source_theme_root_dir_path}/src/gtk/4.0/gtk-dark.css" "${target_theme_dir_path}/gtk-4.0/gtk-dark.css"
	fi




	util_debug_echo
	util_debug_echo cp -f "${source_theme_root_dir_path}/src/gtk/assets/thumbnails/thumbnail${append_theme_bright_name,,}${append_theme_color_name,,}.png" "${target_theme_dir_path}/gtk-4.0/thumbnail.png"
	cp -f "${source_theme_root_dir_path}/src/gtk/assets/thumbnails/thumbnail${append_theme_bright_name,,}${append_theme_color_name,,}.png" "${target_theme_dir_path}/gtk-4.0/thumbnail.png"




	##
	## theme / gnome-shell
	##

	util_debug_echo
	util_debug_echo "### theme / gnome-shell"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/gnome-shell"
	mkdir -p "${target_theme_dir_path}/gnome-shell"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/gnome-shell/assets"
	mkdir -p "${target_theme_dir_path}/gnome-shell/assets"


	util_debug_echo
	util_debug_echo install -Dm644 "${source_theme_root_dir_path}/src/gnome-shell/pad-osd.css" "${target_theme_dir_path}/gnome-shell/pad-osd.css"
	install -Dm644 "${source_theme_root_dir_path}/src/gnome-shell/pad-osd.css" "${target_theme_dir_path}/gnome-shell/pad-osd.css"


	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/gnome-shell/common-assets"/. "${target_theme_dir_path}/gnome-shell/assets"
	cp -rf "${source_theme_root_dir_path}/src/gnome-shell/common-assets"/. "${target_theme_dir_path}/gnome-shell/assets"

	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/gnome-shell/assets${append_else_dark}"/*.svg "${target_theme_dir_path}/gnome-shell/assets"
	cp -rf "${source_theme_root_dir_path}/src/gnome-shell/assets${append_else_dark}"/*.svg "${target_theme_dir_path}/gnome-shell/assets"


	util_debug_echo
	util_debug_echo install -Dm644 "${source_theme_root_dir_path}/src/gnome-shell/color-assets/checkbox${append_theme_color_name,,}.svg" "${target_theme_dir_path}/gnome-shell/assets/checkbox.svg"
	install -Dm644 "${source_theme_root_dir_path}/src/gnome-shell/color-assets/checkbox${append_theme_color_name,,}.svg" "${target_theme_dir_path}/gnome-shell/assets/checkbox.svg"

	util_debug_echo
	util_debug_echo install -Dm644 "${source_theme_root_dir_path}/src/gnome-shell/color-assets/more-results${append_theme_color_name,,}.svg" "${target_theme_dir_path}/gnome-shell/assets/more-results.svg"
	install -Dm644 "${source_theme_root_dir_path}/src/gnome-shell/color-assets/more-results${append_theme_color_name,,}.svg" "${target_theme_dir_path}/gnome-shell/assets/more-results.svg"

	util_debug_echo
	util_debug_echo install -Dm644 "${source_theme_root_dir_path}/src/gnome-shell/color-assets/toggle-on${append_theme_color_name,,}.svg" "${target_theme_dir_path}/gnome-shell/assets/toggle-on.svg"
	install -Dm644 "${source_theme_root_dir_path}/src/gnome-shell/color-assets/toggle-on${append_theme_color_name,,}.svg" "${target_theme_dir_path}/gnome-shell/assets/toggle-on.svg"




	if [[ "${is_building_tweaks}" == "true" ]]; then
		util_debug_echo
		util_debug_echo ${scss_compile} "${source_theme_root_dir_path}/src/gnome-shell/shell-${gnome_shell_version}/gnome-shell${append_theme_bright_name,,}.scss" "${target_theme_dir_path}/gnome-shell/gnome-shell.css"
		${scss_compile} "${source_theme_root_dir_path}/src/gnome-shell/shell-${gnome_shell_version}/gnome-shell${append_theme_bright_name,,}.scss" "${target_theme_dir_path}/gnome-shell/gnome-shell.css"
	else
		util_debug_echo
		util_debug_echo install -Dm644 "${source_theme_root_dir_path}/src/gnome-shell/shell-${gnome_shell_version}/gnome-shell${append_theme_bright_name,,}.css" "${target_theme_dir_path}/gnome-shell/gnome-shell.css"
		install -Dm644 "${source_theme_root_dir_path}/src/gnome-shell/shell-${gnome_shell_version}/gnome-shell${append_theme_bright_name,,}.css" "${target_theme_dir_path}/gnome-shell/gnome-shell.css"
	fi




	util_debug_echo
	util_debug_echo ln -srf "${target_theme_dir_path}/gnome-shell/assets/no-events.svg" "${target_theme_dir_path}/gnome-shell/no-events.svg"
	ln -srf "${target_theme_dir_path}/gnome-shell/assets/no-events.svg" "${target_theme_dir_path}/gnome-shell/no-events.svg"

	util_debug_echo
	util_debug_echo ln -srf "${target_theme_dir_path}/gnome-shell/assets/process-working.svg" "${target_theme_dir_path}/gnome-shell/process-working.svg"
	ln -srf "${target_theme_dir_path}/gnome-shell/assets/process-working.svg" "${target_theme_dir_path}/gnome-shell/process-working.svg"

	util_debug_echo
	util_debug_echo ln -srf "${target_theme_dir_path}/gnome-shell/assets/no-notifications.svg" "${target_theme_dir_path}/gnome-shell/no-notifications.svg"
	ln -srf "${target_theme_dir_path}/gnome-shell/assets/no-notifications.svg" "${target_theme_dir_path}/gnome-shell/no-notifications.svg"






	##
	## theme / metacity
	##

	util_debug_echo
	util_debug_echo "### theme / metacity"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/metacity-1"
	mkdir -p "${target_theme_dir_path}/metacity-1"


	util_debug_echo
	util_debug_echo cp -f "${source_theme_root_dir_path}/src/metacity-1/assets"/*.png "${target_theme_dir_path}/metacity-1"
	cp -f "${source_theme_root_dir_path}/src/metacity-1/assets"/*.png "${target_theme_dir_path}/metacity-1"

	util_debug_echo
	util_debug_echo install -Dm644 "${source_theme_root_dir_path}/src/metacity-1/metacity-theme-3.xml" "${target_theme_dir_path}/metacity-1/metacity-theme-3.xml"
	install -Dm644 "${source_theme_root_dir_path}/src/metacity-1/metacity-theme-3.xml" "${target_theme_dir_path}/metacity-1/metacity-theme-3.xml"

	util_debug_echo
	util_debug_echo install -Dm644 "${source_theme_root_dir_path}/src/metacity-1/metacity-theme-1${append_theme_bright_name,,}${append_theme_color_name,,}.xml" "${target_theme_dir_path}/metacity-1/metacity-theme-1.xml"
	install -Dm644 "${source_theme_root_dir_path}/src/metacity-1/metacity-theme-1${append_theme_bright_name,,}${append_theme_color_name,,}.xml" "${target_theme_dir_path}/metacity-1/metacity-theme-1.xml"

	util_debug_echo
	util_debug_echo install -Dm644 "${source_theme_root_dir_path}/src/metacity-1/thumbnail${append_theme_bright_name,,}.png" "${target_theme_dir_path}/metacity-1/thumbnail.png"
	install -Dm644 "${source_theme_root_dir_path}/src/metacity-1/thumbnail${append_theme_bright_name,,}.png" "${target_theme_dir_path}/metacity-1/thumbnail.png"

	util_debug_echo
	util_debug_echo ln -srf "${target_theme_dir_path}/metacity-1/metacity-theme-1.xml" "${target_theme_dir_path}/metacity-1/metacity-theme-2.xml"
	ln -srf "${target_theme_dir_path}/metacity-1/metacity-theme-1.xml" "${target_theme_dir_path}/metacity-1/metacity-theme-2.xml"




	##
	## theme / xfwm4
	##

	util_debug_echo
	util_debug_echo "### theme / xfwm4"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/xfwm4"
	mkdir -p "${target_theme_dir_path}/xfwm4"


	util_debug_echo
	util_debug_echo install -Dm644 "${source_theme_root_dir_path}/src/xfwm4/themerc${append_theme_bright_name,,}" "${target_theme_dir_path}/xfwm4/themerc"
	install -Dm644 "${source_theme_root_dir_path}/src/xfwm4/themerc${append_theme_bright_name,,}" "${target_theme_dir_path}/xfwm4/themerc"

	if [[ "${is_building_grey}" != "true" ]]; then
		util_debug_echo
		util_debug_echo cp -rf "${source_theme_root_dir_path}/src/xfwm4/assets${append_theme_bright_name,,}${append_theme_color_name,,}"/*png "${target_theme_dir_path}/xfwm4"
		cp -rf "${source_theme_root_dir_path}/src/xfwm4/assets${append_theme_bright_name,,}${append_theme_color_name,,}"/*png "${target_theme_dir_path}/xfwm4"
	fi


	if [[ "${theme_color_name}" == "" && "${is_building_grey}" == "true" ]]; then
		util_debug_echo
		util_debug_echo cp -rf "${source_theme_root_dir_path}/src/xfwm4/assets${append_theme_bright_name,,}-contrast"/*png "${target_theme_dir_path}/xfwm4"
		cp -rf "${source_theme_root_dir_path}/src/xfwm4/assets${append_theme_bright_name,,}-contrast"/*png "${target_theme_dir_path}/xfwm4"
	fi


	##
	## theme / unity
	##

	util_debug_echo
	util_debug_echo "### theme / unity"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/unity"
	mkdir -p "${target_theme_dir_path}/unity"


	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/unity"/. "${target_theme_dir_path}/unity"
	cp -rf "${source_theme_root_dir_path}/src/unity"/. "${target_theme_dir_path}/unity"


	##
	## theme / plank
	##

	util_debug_echo
	util_debug_echo "### theme / plank"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/plank"
	mkdir -p "${target_theme_dir_path}/plank"

	util_debug_echo
	util_debug_echo cp -f "${source_theme_root_dir_path}/src/plank/dock${append_else_light,,}.theme" "${target_theme_dir_path}/plank/dock.theme"
	cp -f "${source_theme_root_dir_path}/src/plank/dock${append_else_light,,}.theme" "${target_theme_dir_path}/plank/dock.theme"



	##
	## theme / cinnamon
	##

	util_debug_echo
	util_debug_echo "### theme / cinnamon"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/cinnamon"
	mkdir -p "${target_theme_dir_path}/cinnamon"

	util_debug_echo
	util_debug_echo mkdir -p "${target_theme_dir_path}/cinnamon/assets"
	mkdir -p "${target_theme_dir_path}/cinnamon/assets"


	if [[ "${is_building_tweaks}" == "true" ]]; then
		util_debug_echo
		util_debug_echo ${scss_compile} "${source_theme_root_dir_path}/src/cinnamon/cinnamon${append_theme_bright_name,,}.scss" "${target_theme_dir_path}/cinnamon/cinnamon.css"
		${scss_compile} "${source_theme_root_dir_path}/src/cinnamon/cinnamon${append_theme_bright_name,,}.scss" "${target_theme_dir_path}/cinnamon/cinnamon.css"
	else
		util_debug_echo
		util_debug_echo install -Dm644 "${source_theme_root_dir_path}/src/cinnamon/cinnamon${append_theme_bright_name,,}.css" "${target_theme_dir_path}/cinnamon/cinnamon.css"
		install -Dm644 "${source_theme_root_dir_path}/src/cinnamon/cinnamon${append_theme_bright_name,,}.css" "${target_theme_dir_path}/cinnamon/cinnamon.css"
	fi


	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/cinnamon/assets${append_theme_color_name,,}/common-assets"/. "${target_theme_dir_path}/cinnamon/assets"
	cp -rf "${source_theme_root_dir_path}/src/cinnamon/assets${append_theme_color_name,,}/common-assets"/. "${target_theme_dir_path}/cinnamon/assets"

	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/cinnamon/assets${append_theme_color_name,,}/assets${append_else_dark}/checkbox"/*.svg "${target_theme_dir_path}/cinnamon/assets/checkbox"
	cp -rf "${source_theme_root_dir_path}/src/cinnamon/assets${append_theme_color_name,,}/assets${append_else_dark}/checkbox"/*.svg "${target_theme_dir_path}/cinnamon/assets/checkbox"

	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/cinnamon/assets${append_theme_color_name,,}/assets${append_else_dark}/menu"/*.svg "${target_theme_dir_path}/cinnamon/assets/menu"
	cp -rf "${source_theme_root_dir_path}/src/cinnamon/assets${append_theme_color_name,,}/assets${append_else_dark}/menu"/*.svg "${target_theme_dir_path}/cinnamon/assets/menu"

	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/cinnamon/assets${append_theme_color_name,,}/assets${append_else_dark}/misc"/*.svg "${target_theme_dir_path}/cinnamon/assets/misc"
	cp -rf "${source_theme_root_dir_path}/src/cinnamon/assets${append_theme_color_name,,}/assets${append_else_dark}/misc"/*.svg "${target_theme_dir_path}/cinnamon/assets/misc"

	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/cinnamon/assets${append_theme_color_name,,}/assets${append_else_dark}/switch"/*.svg "${target_theme_dir_path}/cinnamon/assets/switch"
	cp -rf "${source_theme_root_dir_path}/src/cinnamon/assets${append_theme_color_name,,}/assets${append_else_dark}/switch"/*.svg "${target_theme_dir_path}/cinnamon/assets/switch"


	util_debug_echo
	util_debug_echo cp -rf "${source_theme_root_dir_path}/src/cinnamon/thumbnail${append_else_dark}${append_theme_color_name,,}.png" "${target_theme_dir_path}/cinnamon/thumbnail.png"
	cp -rf "${source_theme_root_dir_path}/src/cinnamon/thumbnail${append_else_dark}${append_theme_color_name,,}.png" "${target_theme_dir_path}/cinnamon/thumbnail.png"





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
	local target_theme_build_size_list=${OPT_TARGET_THEME_BUILD_SIZE_LIST[@]:=${THE_TARGET_THEME_BUILD_SIZE_LIST[@]}}


	local theme_main_name="${THE_TARGET_THEME_BUILD_MAIN_NAME:=${THE_TARGET_THEME_BUILD_MAIN_NAME}}"
	local theme_color_name
	local theme_bright_name
	local theme_size_name

	for theme_color_name in ${target_theme_build_color_list[@]}; do
		for theme_bright_name in ${target_theme_build_bright_list[@]}; do
			for theme_size_name in ${target_theme_build_size_list[@]}; do
				util_error_echo
				util_error_echo "##"
				util_error_echo "##" mod_theme_build_each "${theme_main_name}" "${theme_color_name}" "${theme_bright_name}" "${theme_size_name}"
				util_error_echo "##"
				util_error_echo
				mod_theme_build_each "${theme_main_name}" "${theme_color_name}" "${theme_bright_name}" "${theme_size_name}"
			done
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

	util_debug_echo "rm -rf ${THE_MASTER_TMP_DIR_PATH}"
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
	mod_build_essential_for_sassc
}


mod_build_essential_for_sassc () {

	if is_command_exist "sassc"; then
		return 0
	fi




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## sassc needs to be installed to generate the css."
	util_debug_echo "##"
	util_debug_echo

	if is_command_exist "zypper"; then
		util_debug_echo "sudo zypper in sassc"
		sudo zypper in sassc
	elif is_command_exist "apt-get"; then
		util_debug_echo "sudo apt-get install sassc"
		sudo apt-get install sassc
	elif is_command_exist "dnf"; then
		util_debug_echo "sudo dnf install sassc"
		sudo dnf install sassc
	elif is_command_exist "dnf"; then
		util_debug_echo "sudo dnf install sassc"
		sudo dnf install sassc
	elif is_command_exist "pacman"; then
		util_debug_echo "sudo pacman -S --noconfirm --asdeps sassc"
		sudo pacman -S --noconfirm --asdeps sassc
	fi

}



##
### Tail: Master / Mod / Theme / Build / Essential
################################################################################


################################################################################
### Head: Master / Mod / Theme / Build / Tweaks
##


mod_build_tweaks () {

	local source_theme_root_dir_path="${1}"
	local target_theme_root_dir_path="${2}"

	##
	## Vimix-Ruby-Dark-Compact
	## ${main}-${color}-${bright}-${size}
	##

	local theme_main_name="${3}"
	local theme_color_name="${4}"
	local theme_bright_name="${5}"
	local theme_size_name="${6}"


	##
	## build option
	##

	local is_building_tweaks="${OPT_BUILDING_TWEAKS:=${THE_BUILDING_TWEAKS}}"
	local is_building_flat="${OPT_BUILDING_FLAT:=${THE_BUILDING_FLAT}}"
	local is_building_grey="${OPT_BUILDING_GREY:=${THE_BUILDING_GREY}}"
	local is_building_mix="${OPT_BUILDING_MIX:=${THE_BUILDING_MIX}}"
	local is_building_translucent="${OPT_BUILDING_TRANSLUCENT:=${THE_BUILDING_TRANSLUCENT}}"
	local is_building_compact="${OPT_BUILDING_COMPACT:=${THE_BUILDING_COMPACT}}"
	local is_building_accent="${OPT_BUILDING_ACCENT:=${THE_BUILDING_ACCENT}}"



	if [[ "${is_building_flat}" == "true" || "${is_building_mix}" == "true" || "${is_building_accent}" == "true" || "${is_building_compact}" == "true" || "${is_building_translucent}" == "true" ]]; then
		mod_build_tweaks_create_temp "${source_theme_root_dir_path}"
		OPT_BUILDING_TWEAKS="true"
		#THE_BUILDING_TWEAKS="true"
	fi


	if [[ "${is_building_flat}" == "true" ]]; then
		mod_build_tweaks_for_flat "${source_theme_root_dir_path}"
	fi


	if [[ "${is_building_mix}" == "true" ]]; then
		mod_build_tweaks_for_mix "${source_theme_root_dir_path}"
	fi


	if [[ "${is_building_compact}" == "true" && "${theme_size_name}" == "compact" ]]; then
		mod_build_tweaks_for_compact "${source_theme_root_dir_path}"
	fi


	if [[ "${is_building_accent}" == "true" ]]; then
		mod_build_tweaks_for_theme_color "${source_theme_root_dir_path}" "${target_theme_root_dir_path}" "${theme_main_name}" "${theme_color_name}" "${theme_bright_name}" "${theme_size_name}"
	fi


	if [[ "${is_building_translucent}" == "true" ]]; then
		mod_build_tweaks_for_translucent "${source_theme_root_dir_path}"
	fi


	return 0
}


mod_build_tweaks_create_temp () {

	local source_theme_root_dir_path="${1}"

	util_debug_echo
	util_debug_echo install -Dm644 "${source_theme_root_dir_path}/src/_sass/_tweaks.scss" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"
	install -Dm644 "${source_theme_root_dir_path}/src/_sass/_tweaks.scss" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"

}


mod_build_tweaks_for_flat () {

	local source_theme_root_dir_path="${1}"

	util_debug_echo
	util_debug_echo sed -i "/\$titlebutton:/s/default/flat/" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"
	sed -i "/\$titlebutton:/s/default/flat/" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"

}


mod_build_tweaks_for_mix () {

	local source_theme_root_dir_path="${1}"

	util_debug_echo
	util_debug_echo sed -i "/\$mixstate:/s/default/main/" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"
	sed -i "/\$mixstate:/s/default/main/" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"

}


mod_build_tweaks_for_compact () {

	local source_theme_root_dir_path="${1}"

	util_debug_echo
	util_debug_echo sed -i "/\$compact:/s/false/true/" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"
	sed -i "/\$compact:/s/false/true/" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"

}


mod_build_tweaks_for_translucent () {

	local source_theme_root_dir_path="${1}"

	util_debug_echo
	util_debug_echo sed -i "/\$translucent:/s/false/true/" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"
	sed -i "/\$translucent:/s/false/true/" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"

}


mod_build_tweaks_for_theme_color () {

	local source_theme_root_dir_path="${1}"
	local target_theme_root_dir_path="${2}"

	##
	## Vimix-Ruby-Dark-Compact
	## ${main}-${color}-${bright}-${size}
	##

	local theme_main_name="${3}"
	local theme_color_name="${4}"
	local theme_bright_name="${5}"
	local theme_size_name="${6}"


	if [[ "${theme_color_name}" == "doder" ]]; then
		return 0
	fi



	util_debug_echo
	util_debug_echo sed -i "/\$theme:/s/doder/${theme_color_name}/" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"
	sed -i "/\$theme:/s/doder/${theme_color_name}/" "${source_theme_root_dir_path}/src/_sass/_tweaks-temp.scss"

}



##
### Tail: Master / Mod / Theme / Build / Tweaks
################################################################################
