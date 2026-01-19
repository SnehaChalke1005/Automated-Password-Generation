

#!/bin/bash

# Root privileges.
echo
if [[ $UID -eq 0 ]]
then
  echo "WELCOME!!!"
else
  echo "YOU ARE NOT ROOT!!!"
  exit 1
fi

echo

if [[ "$#" -lt 1 ]]
then
  echo "With $0 supply your USER_NAME [COMMENT]."
  echo "YOU CAN ALSO ADD SOME COMMENTS RELATED TO YOU ACCOUNT PLEASE ADD A COMMENT IN...'COMMENT'...IN THIS FORMAT(OPTIONAL)."
  exit 1
fi


USER_NAME="$1"

COMMENT="$2"

PASSWORD="$RANDOM$(date +%s%N | sha256sum | head -c9)"

SPECIAL_CHARACTER="$(echo '#$%^&*()' | fold -w1 | shuf | head -c1)"

PASS=$PASSWORD$SPECIAL_CHARACTER

useradd -c "$COMMENT" -m $USER_NAME

if [[ $? -ne 0 ]]
then 
  echo "THE ACCOUNT WAS NOT CREATED DUE TO SOME ISSUE...PLEASE TRY AGAIN \n SORRY FOR THE INCONVENIENCE. "
  exit 1
fi

echo $PASS | passwd --stdin $USER_NAME

if [[ $? -ne 0 ]]
then 
  echo "YOUR PASSWORD WAS NOT ASSIGNED! PLEASE TRY AGAIN."
  exit 1
fi

# DISPLAY

echo
echo "USER_NAME: $USER_NAME" 
echo
echo "PASSWORD: $PASSWORD" 
echo

cat /etc/passwd | tail -n1

exit 0
