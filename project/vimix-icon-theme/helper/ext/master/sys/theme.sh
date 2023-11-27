

################################################################################
### Head: Master / Sys / Theme / NameCase
##


sys_name_case_std () {
	util_str_case_upper_fc "${1}"
}


##
### Tail: Master / Sys / Theme / NameCase
################################################################################




################################################################################
### Head: Master / Sys / Theme / NameAppend
##


sys_name_append_std () {

	local name="${1}"
	local append_sign="-"

	if ! [ -z "${name}" ]; then

		name="${append_sign}${name}"

	fi

	echo "${name}"
}


##
### Tail: Master / Sys / Theme / NameAppend
################################################################################




################################################################################
### Head: Master / Sys / Theme / IconCache
##


sys_icon_cache_update () {

	local icon_theme_dir_path="${1}"

	gtk-update-icon-cache "${icon_theme_dir_path}"

}


##
### Tail: Master / Sys / Theme / IconCache
################################################################################
