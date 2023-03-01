ERROR="\033[31m"
TITLE="\033[36m"
INFO="\033[37m"
SUCCESS="\033[32m"
SCRIPT="\033[32m"
RESET="\033[0m"

if [ -z "$1" ]; then
    echo "$ERROR Missing file name$RESET"
    exit -1
fi


fileName=$1

if [ ! -f $(pwd)/$fileName ]
then
    echo "$ERROR File not found$RESET"
    exit -2
fi

IFS="." read -ra ADDR <<< "$fileName"
scriptName=${ADDR[0]} 

echo "$TITLE  ___ _   _ ____ _____  _    _     _       ____   ____ ____  ___ ____ _____ "
echo "$TITLE |_ _| \ | / ___|_   _|/ \  | |   | |     / ___| / ___|  _ \|_ _|  _ \_   _|"
echo "$TITLE  | ||  \| \___ \ | | / _ \ | |   | |     \___ \| |   | |_) || || |_) || |  "
echo "$TITLE  | || |\  |___) || |/ ___ \| |___| |___   ___) | |___|  _ < | ||  __/ | |  "
echo "$TITLE |___|_| \_|____/ |_/_/   \_\_____|_____| |____/ \____|_| \_\___|_|    |_|  "
                                                                        

echo "$INFO Adding script file called $SCRIPT$fileName$INFO to /usr/local/bin folder...$RESET"

# Add the script to the Bin folder
cp $fileName /usr/local/bin

echo "$INFO Changing perissions for $SCRIPT$fileName$INFO...$RESET"

# Change file permission
chmod +x /usr/local/bin/$fileName

echo "$INFO Creating alias for $SCRIPT$fileName$INFO...$RESET"

# Adds the alias
echo "alias $scriptName=$fileName" >> ~/.zshrc

echo "$INFO Source...$RESET"

# Perform the Source command
source ~/.zshrc

echo
echo "$SUCCESS Done!$RESET"
echo "$INFO You can now launch your script by simply running $SCRIPT$scriptName$INFO. $RESET"
echo "$INFO Remember to restart the terminal.$RESET"




