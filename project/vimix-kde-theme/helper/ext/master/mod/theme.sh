

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
	local target_overlay_dir_path="${target_theme_root_dir_path}/overlay"

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





	local source_global_theme_root_dir_path="${source_theme_root_dir_path}/plasma/look-and-feel"
	local target_global_theme_root_dir_path="${target_overlay_dir_path}/usr/share/plasma/look-and-feel"

	local source_plasma_theme_root_dir_path="${source_theme_root_dir_path}/plasma/desktoptheme"
	local target_plasma_theme_root_dir_path="${target_overlay_dir_path}/usr/share/plasma/desktoptheme"

	local source_aurorae_theme_root_dir_path="${source_theme_root_dir_path}/aurorae"
	local target_aurorae_theme_root_dir_path="${target_overlay_dir_path}/usr/share/aurorae/themes"

	local source_color_scheme_root_dir_path="${source_theme_root_dir_path}/color-schemes"
	local target_color_scheme_root_dir_path="${target_overlay_dir_path}/usr/share/color-schemes"

	local source_kvantum_theme_root_dir_path="${source_theme_root_dir_path}/Kvantum"
	local target_kvantum_theme_root_dir_path="${target_overlay_dir_path}/usr/share/Kvantum"

	local source_wallpaper_root_dir_path="${source_theme_root_dir_path}/wallpaper"
	local target_wallpaper_root_dir_path="${target_overlay_dir_path}/usr/share/wallpapers"




	util_debug_echo "asset_root_dir_path=${asset_root_dir_path}"

	util_debug_echo "source_theme_root_dir_path=${source_theme_root_dir_path}"
	util_debug_echo "target_theme_root_dir_path=${target_theme_root_dir_path}"


	util_debug_echo "source_theme_dir_path=${source_theme_root_dir_path}"
	util_debug_echo "target_overlay_dir_path=${target_overlay_dir_path}"


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




	util_debug_echo "source_global_theme_root_dir_path=${source_global_theme_root_dir_path}"
	util_debug_echo "target_global_theme_root_dir_path=${target_global_theme_root_dir_path}"

	util_debug_echo "source_plasma_theme_root_dir_path=${source_plasma_theme_root_dir_path}"
	util_debug_echo "target_plasma_theme_root_dir_path=${target_plasma_theme_root_dir_path}"

	util_debug_echo "source_aurorae_theme_root_dir_path=${source_aurorae_theme_root_dir_path}"
	util_debug_echo "target_aurorae_theme_root_dir_path=${target_aurorae_theme_root_dir_path}"

	util_debug_echo "source_color_scheme_root_dir_path=${source_color_scheme_root_dir_path}"
	util_debug_echo "target_color_scheme_root_dir_path=${target_color_scheme_root_dir_path}"

	util_debug_echo "source_kvantum_theme_root_dir_path=${source_kvantum_theme_root_dir_path}"
	util_debug_echo "target_kvantum_theme_root_dir_path=${target_kvantum_theme_root_dir_path}"

	util_debug_echo "source_wallpaper_root_dir_path=${source_wallpaper_root_dir_path}"
	util_debug_echo "target_wallpaper_root_dir_path=${target_wallpaper_root_dir_path}"



	#################
	## Build Start ##
	#################


	##
	## global_theme
	##

	util_debug_echo
	util_debug_echo mkdir -p "${target_global_theme_root_dir_path}"
	mkdir -p "${target_global_theme_root_dir_path}"

	local source_global_theme_dir_path="${source_global_theme_root_dir_path}/com.github.vinceliuice.${real_theme_main_name}${append_theme_bright_name}${append_theme_color_name}"
	local target_global_theme_dir_path="${target_global_theme_root_dir_path}/com.github.vinceliuice.${real_theme_main_name}${append_theme_bright_name}${append_theme_color_name}"

	if [[ -d "${source_global_theme_dir_path}" ]]; then
		util_debug_echo
		util_debug_echo cp -rf "${source_global_theme_dir_path}"/. "${target_global_theme_dir_path}"
		cp -rf "${source_global_theme_dir_path}"/. "${target_global_theme_dir_path}"
	fi




	##
	## plasma_theme
	##

	util_debug_echo
	util_debug_echo mkdir -p "${target_plasma_theme_root_dir_path}"
	mkdir -p "${target_plasma_theme_root_dir_path}"

	local source_plasma_theme_dir_path="${source_plasma_theme_root_dir_path}/${real_theme_main_name}${append_theme_bright_name}"
	local target_plasma_theme_dir_path="${target_plasma_theme_root_dir_path}/${real_theme_main_name}${append_theme_bright_name}"

	if [[ -d "${source_plasma_theme_dir_path}" ]]; then
		util_debug_echo
		util_debug_echo cp -rf "${source_plasma_theme_dir_path}"/. "${target_plasma_theme_dir_path}"
		cp -rf "${source_plasma_theme_dir_path}"/. "${target_plasma_theme_dir_path}"
	fi

	if [[ "${append_theme_bright_name}" != "" ]]; then
		util_debug_echo
		util_debug_echo cp -rf "${source_plasma_theme_root_dir_path}/${real_theme_main_name}"/. "${target_plasma_theme_dir_path}"
		cp -rf "${source_plasma_theme_root_dir_path}/${real_theme_main_name}"/. "${target_plasma_theme_dir_path}"

		## Replace Name
		##Name=Vimix-Dark
		##sed -i 's/^Name=.*/Name=Vimix-Dark/g' "${target_plasma_theme_dir_path}/metadata.desktop"

		local key="Name"
		local val="${real_theme_main_name}${append_theme_bright_name}"

		##local pattern="s/^${key}.*/${key}=\"${val}\"/g"
		local pattern="s/^${key}.*/${key}=${val}/g"

		util_debug_echo
		util_debug_echo sed -i "${pattern}" "${target_plasma_theme_dir_path}/metadata.desktop"
		sed -i "${pattern}" "${target_plasma_theme_dir_path}/metadata.desktop"

	fi




	##
	## aurorae_theme
	##

	util_debug_echo
	util_debug_echo mkdir -p "${target_aurorae_theme_root_dir_path}"
	mkdir -p "${target_aurorae_theme_root_dir_path}"

	if [[ "${real_theme_bright_name,,}" != "light" ]]; then
		local source_aurorae_theme_dir_path="${source_aurorae_theme_root_dir_path}/${real_theme_main_name}${append_theme_color_name}"
		local target_aurorae_theme_dir_path="${target_aurorae_theme_root_dir_path}/${real_theme_main_name}${append_theme_color_name}"
	else
		local source_aurorae_theme_dir_path="${source_aurorae_theme_root_dir_path}/${real_theme_main_name}-Light"
		local target_aurorae_theme_dir_path="${target_aurorae_theme_root_dir_path}/${real_theme_main_name}-Light"
	fi

	util_debug_echo
	util_debug_echo cp -rf "${source_aurorae_theme_dir_path}"/. "${target_aurorae_theme_dir_path}"
	cp -rf "${source_aurorae_theme_dir_path}"/. "${target_aurorae_theme_dir_path}"




	##
	## color_scheme
	##

	util_debug_echo
	util_debug_echo mkdir -p "${target_color_scheme_root_dir_path}"
	mkdir -p "${target_color_scheme_root_dir_path}"

	local source_color_scheme_dir_path="${source_color_scheme_root_dir_path}/${real_theme_main_name}${real_theme_bright_name}${real_theme_color_name}.colors"
	local target_color_scheme_dir_path="${target_color_scheme_root_dir_path}/${real_theme_main_name}${real_theme_bright_name}${real_theme_color_name}.colors"

	util_debug_echo
	util_debug_echo install -Dm644 "${source_color_scheme_dir_path}" "${target_color_scheme_dir_path}"
	install -Dm644 "${source_color_scheme_dir_path}" "${target_color_scheme_dir_path}"




	##
	## kvantum_theme
	##

	util_debug_echo
	util_debug_echo mkdir -p "${target_kvantum_theme_root_dir_path}"
	mkdir -p "${target_kvantum_theme_root_dir_path}"

	util_debug_echo
	util_debug_echo cp -rf "${source_kvantum_theme_root_dir_path}"/* "${target_kvantum_theme_root_dir_path}"
	cp -rf "${source_kvantum_theme_root_dir_path}"/* "${target_kvantum_theme_root_dir_path}"


	if [[ "${real_theme_color_name,,}" == "amethyst" ]]; then
		util_debug_echo
		util_debug_echo cp -rf "${source_kvantum_theme_root_dir_path}/VimixRuby"/. "${target_kvantum_theme_root_dir_path}/VimixAmethyst"
		cp -rf "${source_kvantum_theme_root_dir_path}/VimixRuby"/. "${target_kvantum_theme_root_dir_path}/VimixAmethyst"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixRuby.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixAmethyst.kvconfig"
		mv "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixRuby.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixAmethyst.kvconfig"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixRubyDark.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixAmethystDark.kvconfig"
		mv "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixRubyDark.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixAmethystDark.kvconfig"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixRuby.svg" "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixAmethyst.svg"
		mv "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixRuby.svg" "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixAmethyst.svg"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixRubyDark.svg" "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixAmethystDark.svg"
		mv "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixRubyDark.svg" "${target_kvantum_theme_root_dir_path}/VimixAmethyst/VimixAmethystDark.svg"

		util_debug_echo
		util_debug_echo sed -i "s/#f0544c/#ab47bc/g" "${target_kvantum_theme_root_dir_path}/VimixAmethyst"/*
		sed -i "s/#f0544c/#ab47bc/g" "${target_kvantum_theme_root_dir_path}/VimixAmethyst"/*
	fi


	if [[ "${real_theme_color_name,,}" == "beryl" ]]; then
		util_debug_echo
		util_debug_echo cp -rf "${source_kvantum_theme_root_dir_path}/VimixDoder"/. "${target_kvantum_theme_root_dir_path}/VimixBeryl"
		cp -rf "${source_kvantum_theme_root_dir_path}/VimixDoder"/. "${target_kvantum_theme_root_dir_path}/VimixBeryl"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixDoder.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixBeryl.kvconfig"
		mv "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixDoder.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixBeryl.kvconfig"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixDoderDark.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixBerylDark.kvconfig"
		mv "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixDoderDark.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixBerylDark.kvconfig"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixDoder.svg" "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixBeryl.svg"
		mv "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixDoder.svg" "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixBeryl.svg"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixDoderDark.svg" "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixBerylDark.svg"
		mv "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixDoderDark.svg" "${target_kvantum_theme_root_dir_path}/VimixBeryl/VimixBerylDark.svg"

		util_debug_echo
		util_debug_echo sed -i "s/#f0544c/#ab47bc/g" "${target_kvantum_theme_root_dir_path}/VimixBeryl"/*
		sed -i "s/#4285f4/#2eb398/g" "${target_kvantum_theme_root_dir_path}/VimixBeryl"/*
	fi


	if [[ "${real_theme_color_name,,}" == "jade" ]]; then
		util_debug_echo
		util_debug_echo cp -rf "${source_kvantum_theme_root_dir_path}/VimixRuby"/. "${target_kvantum_theme_root_dir_path}/VimixJade"
		cp -rf "${source_kvantum_theme_root_dir_path}/VimixRuby"/. "${target_kvantum_theme_root_dir_path}/VimixJade"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixJade/VimixRuby.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixJade/VimixJade.kvconfig"
		mv "${target_kvantum_theme_root_dir_path}/VimixJade/VimixRuby.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixJade/VimixJade.kvconfig"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixJade/VimixRubyDark.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixJade/VimixJadeDark.kvconfig"
		mv "${target_kvantum_theme_root_dir_path}/VimixJade/VimixRubyDark.kvconfig" "${target_kvantum_theme_root_dir_path}/VimixJade/VimixJadeDark.kvconfig"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixJade/VimixRuby.svg" "${target_kvantum_theme_root_dir_path}/VimixJade/VimixJade.svg"
		mv "${target_kvantum_theme_root_dir_path}/VimixJade/VimixRuby.svg" "${target_kvantum_theme_root_dir_path}/VimixJade/VimixJade.svg"

		util_debug_echo
		util_debug_echo mv "${target_kvantum_theme_root_dir_path}/VimixJade/VimixRubyDark.svg" "${target_kvantum_theme_root_dir_path}/VimixJade/VimixJadeDark.svg"
		mv "${target_kvantum_theme_root_dir_path}/VimixJade/VimixRubyDark.svg" "${target_kvantum_theme_root_dir_path}/VimixJade/VimixJadeDark.svg"

		util_debug_echo
		util_debug_echo sed -i "s/#f0544c/#86BE43/g" "${target_kvantum_theme_root_dir_path}/VimixJade"/*
		sed -i "s/#f0544c/#86BE43/g" "${target_kvantum_theme_root_dir_path}/VimixJade"/*
	fi


	##
	## wallpaper
	##

	util_debug_echo
	util_debug_echo mkdir -p "${target_wallpaper_root_dir_path}"
	mkdir -p "${target_wallpaper_root_dir_path}"

	util_debug_echo
	util_debug_echo cp -rf "${source_wallpaper_root_dir_path}"/Vimix* "${target_wallpaper_root_dir_path}"
	cp -rf "${source_wallpaper_root_dir_path}"/Vimix* "${target_wallpaper_root_dir_path}"



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

	local target_theme_root_dir_path="${OPT_TARGET_THEME_ROOT_DIR_PATH:=${THE_TARGET_THEME_ROOT_DIR_PATH}}"

	if [[ -d "${target_theme_root_dir_path}" ]]; then
		util_debug_echo
		util_debug_echo rm -rf "${target_theme_root_dir_path}"
		rm -rf "${target_theme_root_dir_path}"
	fi




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
	util_debug_echo "mod_build_essential: **Do Nothing**"
}


##
### Tail: Master / Mod / Theme / Build / Essential
################################################################################
