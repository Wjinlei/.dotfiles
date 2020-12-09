if [[ "$(uname)" == "Darwin" ]]; then
    export AUTOJUMP_ERROR_PATH=~/Library/autojump-go/errors.log
    local old_file=~/Library/autojump/autojump.txt
    local new_file=$HOME/.autojump-go.txt
    if [[ -f "${old_file}" && ! -f "${new_file}" ]]; then
        cat "${old_file}" | sed "s/	/,/g" "${old_file}" > "${new_file}"
    fi
elif [[ -n "${XDG_DATA_HOME}" ]]; then
    export AUTOJUMP_ERROR_PATH="${XDG_DATA_HOME}/autojump-go/errors.log"
else
    export AUTOJUMP_ERROR_PATH=~/.local/share/autojump-go/errors.log
fi

if [[ ! -d ${AUTOJUMP_ERROR_PATH:h} ]]; then
    mkdir -p ${AUTOJUMP_ERROR_PATH:h}
fi

# change pwd hook
autojump_chpwd() {
    if [[ -f "${AUTOJUMP_ERROR_PATH}" ]]; then
        autojump-go --add "$(pwd)" >/dev/null 2>>${AUTOJUMP_ERROR_PATH} &!
    else
        autojump-go --add "$(pwd)" >/dev/null &!
    fi
}

typeset -gaU chpwd_functions
chpwd_functions+=autojump_chpwd


j() {
    if [[ ${1} == - || ${1} == $HOME* || ${1} == /* || ${1} == ..* ]]; then
        cd ${@}
        return
    fi

    setopt localoptions noautonamedirs
    if [[ ${1} != --* ]]; then
        local output="$(autojump-go ${@})"
        if  [[ -d "${output}" ]]; then
            if [ -t 1 ]; then  # if stdout is a terminal, use colors
                    echo -e "\\033[31m${output}\\033[0m"
            else
                    echo -e "${output}"
            fi
            cd "${output}"
        fi
        return
    fi
    echo "autojump-go: directory '${@}' not found"
    echo "\n"
    echo "Try \`autojump-go --help\` for more information."
    false
}


# jump to child directory (subdirectory of current path)
jc() {
    if [[ ${1} == -* ]] && [[ ${1} != "--" ]]; then
        autojump-go ${@}
        return
    else
        j $(pwd) ${@}
    fi
}


# open autojump-go results in file browser
jo() {
    if [[ ${1} == -* ]] && [[ ${1} != "--" ]]; then
        autojump-go ${@}
        return
    fi

    setopt localoptions noautonamedirs
    local output="$(autojump-go ${@})"
    if [[ -d "${output}" ]]; then
        case ${OSTYPE} in
            linux*)
                xdg-open "${output}"
                ;;
            darwin*)
                open "${output}"
                ;;
            cygwin)
                cygstart "" $(cygpath -w -a ${output})
                ;;
            *)
                echo "Unknown operating system: ${OSTYPE}" 1>&2
                ;;
        esac
    else
        echo "autojump-go: directory '${@}' not found"
        echo "\n${output}\n"
        echo "Try \`autojump-go --help\` for more information."
        false
    fi
}


# open autojump-go results (child directory) in file browser
jco() {
    if [[ ${1} == -* ]] && [[ ${1} != "--" ]]; then
        autojump-go ${@}
        return
    else
        jo $(pwd) ${@}
    fi
}
