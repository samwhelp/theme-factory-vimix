

################################################################################
### Head: Master / Util / Theme / StrCase
##


util_str_case_same () {
	echo "${1}"
}


util_str_case_lower () {
	echo "${1,,}"
}


util_str_case_upper () {
	echo "${1^^}"
}


util_str_case_upper_fc () {
	echo "${1^}"
}


util_str_case_upper_fc_only () {
	local str="${1}"
	str="${str,,}"
	str="${str^}"
	echo "${str}"
}


##
### Tail: Master / Util / Theme / StrCase
################################################################################
