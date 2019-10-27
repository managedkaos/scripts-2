# KEY GENERATOR
#
# Use this function to generate multiple keys in one shot.
# Creates an OpenSSH key and the corresonding public key.
# If puttygen is installed, a Putty key will be created as well.
#
# Installation: Add the function to your .bashrc or .profile
#
# Usage:
#
# To make one random, throwaway key, just run the function:
#
#   keygen
#
#   creates:
#       keygen_1572219348.key
#       keygen_1572219348.ppk
#       keygen_1572219348.pub
#
# To make multiple, named keys, add the names as arguments to the function:
#
#   keygen fred wilma pebbles dino
#
#   creates:
#       dino.key
#       dino.ppk
#       dino.pub
#       fred.key
#       fred.ppk
#       fred.pub
#       pebbles.key
#       pebbles.ppk
#       pebbles.pub
#       wilma.key
#       wilma.ppk
#       wilma.pub

function keygen() {
    if  [ $# -eq  0 ];
    then
        keys="keygen_$(date +%s)"
    else
        keys=$@
    fi
    for keyname in $keys;
    do
        /usr/bin/ssh-keygen -C "${keyname}" -N "" -f ./${keyname}.key
        mv ./${keyname}.key.pub ./${keyname}.pub

        if [[ -f /usr/local/bin/puttygen ]];
        then
            /usr/local/bin/puttygen ./${keyname}.key -o ./${keyname}.ppk
        fi

        chmod -fv 400 ./${keyname}.{key,pub,ppk}
    done
}
