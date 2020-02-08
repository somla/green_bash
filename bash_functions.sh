function upper {
    echo "$@" | tr [a-záéíóöőúüű] [A-ZÁÉÍÓÖŐÚÜŰ]
}

function lower {
    echo "$@" | tr [A-ZÁÉÍÓÖŐÚÜŰ] [a-záéíóöőúüű]
}

function send_error {
    local msg=$1;
    local n=`date "+%H:%M:%S"`
    echo -e "\e[31m[error]\e[0m[$n] $msg";
    notify-send "[error][$n]" $msg
}

function send_info {
    local msg=$1;
    local n=`date "+%H:%M:%S"`
    echo -e "\e[01;32m[info ]\e[0m[$n] $msg";
    notify-send "[info ][$n]" $msg
}