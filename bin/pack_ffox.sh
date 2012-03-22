#!/bin/bash

# Change this to match your correct profile
PROFILE="3tog6gw0.default"

cd "${HOME}/.mozilla/firefox"

if test -z "$(mount | grep -F "${HOME}/.mozilla/firefox/${PROFILE}" )"
then
	    mount "${HOME}/.mozilla/firefox/${PROFILE}"
    fi

    if test -f "${PROFILE}/.unpacked"
    then
	        tar -cpf packed.tmp.tar --exclude '.unpacked' "$PROFILE" 
		    mv packed.tar packed.tar.old
		        mv packed.tmp.tar packed.tar
		else
			    tar xpf packed.tar &&\
				        touch "${PROFILE}/.unpacked"
		    fi 
