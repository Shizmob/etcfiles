# /etc/profile: login shell setup

if [ -e /etc/profile.env ] ; then
	. /etc/profile.env
fi

export EDITOR=${EDITOR:-/bin/nano}
export PAGER=${PAGER:-/usr/bin/less}

umask 077

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${PATH}"

if [ -n "${BASH_VERSION}" ] && [ -f /etc/bash/bashrc ] ; then
	. /etc/bash/bashrc
else
	PS1='\u@\h \w \$ '
fi

for sh in /etc/profile.d/*.sh ; do
	[ -f "$sh" ] && [ -r "$sh" ] && . "$sh"
done
unset sh
