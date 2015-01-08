#!/bin/bash
set -e

if [ ! "$GMAIL1" ]; then
	echo >&2 'error: missing GMAIL environment variable'
	echo >&2 '  try running again with -e GMAIL=your-email@gmail.com'
	echo >&2 '    optionally, you can also specify -e GMAIL_PASS'
	echo >&2 '    and also -e GMAIL_NAME="Your Name"'
	echo >&2 '      if not specified, both default to the value of GMAIL'
	exit 1
fi

if [ ! "$GMAIL1_NAME" ]; then
	GMAIL_NAME="$GMAIL1"
fi

sed -i "s/%GMAIL1_LOGIN%/$GMAIL1/g" "$HOME/.mutt/muttrc"
sed -i "s/%GMAIL1_NAME%/$GMAIL1_NAME/g" "$HOME/.mutt/muttrc"
sed -i "s/%GMAIL1_PASS%/$GMAIL1_PASS/g" "$HOME/.mutt/muttrc"

sed -i "s/%GMAIL2_LOGIN%/$GMAIL2/g" "$HOME/.mutt/muttrc"
sed -i "s/%GMAIL2_NAME%/$GMAIL2_NAME/g" "$HOME/.mutt/muttrc"
sed -i "s/%GMAIL2_PASS%/$GMAIL2_PASS/g" "$HOME/.mutt/muttrc"

if [ -d "$HOME/.gnupg" ]; then
	{
		echo
		echo 'source /usr/share/doc/mutt/examples/gpg.rc'
		echo 'set pgp_use_gpg_agent = yes'
		if [ "$GPG_ID" ]; then
			echo "set pgp_sign_as = $GPG_ID"
		fi
		echo 'set crypt_replysign = yes'
		echo 'set crypt_replysignencrypted = yes'
		echo 'set crypt_verify_sig = yes'
	} >> "$HOME/.muttrc"
fi

if [ -e "$HOME/.muttrc.local" ]; then
	echo "source $HOME/.muttrc.local" >> "$HOME/.mutt/muttrc"
fi

exec "$@"
