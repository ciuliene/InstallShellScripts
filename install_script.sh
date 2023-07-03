ERROR="\033[31m"
TITLE="\033[36m"
INFO="\033[37m"
SUCCESS="\033[32m"
SCRIPT="\033[32m"
INSTALL_SCRIPT="\033[35m"
COMMENT="\033[90m"
RESET="\033[0m"

usage() {
    echo "\nOptions:"
    echo "${INSTALL_SCRIPT}install_script$TITLE  <sh_file_name>$COMMENT       # The name of the sh file to install"
    echo "${INSTALL_SCRIPT}install_script$TITLE  <script_name> $SUCCESS-u$COMMENT     # The name of the script to uninstall"
    echo "${INSTALL_SCRIPT}install_script$TITLE  $SUCCESS-l$COMMENT                   # Print the list of all installed scripts"
    echo "$RESET"
}

echo "$TITLE"
echo "  ___ _   _ ____ _____  _    _     _       ____   ____ ____  ___ ____ _____ "
echo " |_ _| \ | / ___|_   _|/ \  | |   | |     / ___| / ___|  _ \|_ _|  _ \_   _|"
echo "  | ||  \| \___ \ | | / _ \ | |   | |     \___ \| |   | |_) || || |_) || |  "
echo "  | || |\  |___) || |/ ___ \| |___| |___   ___) | |___|  _ < | ||  __/ | |  "
echo " |___|_| \_|____/ |_/_/   \_\_____|_____| |____/ \____|_| \_\___|_|    |_|  "
echo "$RESET"

if [ "$1" = "-h" ]; then
    usage
    exit 0
fi

if [ "$1" = "-l" ]; then
    echo "Installed scripts:\n"
    cat ~/.zshrc | grep alias | cut -d' ' -f2 | cut -d'=' -f1 | sed 's/^/- /'
    exit 0
fi

if [ -z "$1" ]; then
    echo "$ERROR Missing file name$RESET"
    usage
    exit -1
fi

fileName=$1

if [ "$2" = "-u" ]; then
    echo "$INFO Removing script file called $SCRIPT$fileName$INFO from /usr/local/bin folder...$RESET"
    rm -f /usr/local/bin/${fileName}.sh

    scriptName=${fileName%.*}
    echo "$INFO Removing alias for $SCRIPT$fileName$INFO...$RESET"
    sed -i.bak "/alias $scriptName=$fileName/d" ~/.zshrc

    echo
    echo "$SUCCESS Script uninstalled!$RESET"
    echo "$INFO The script $SCRIPT$fileName$INFO has been uninstalled, and the alias has been removed.$RESET"
    exit 0
fi

if [ ! -f $(pwd)/$fileName ]
then
    echo "$ERROR File not found$RESET"
    usage
    exit -2
fi

IFS="." read -ra ADDR <<< "$fileName"
scriptName=${ADDR[0]} 
                                                                        

echo "$INFO Adding script file called $SCRIPT$fileName$INFO to /usr/local/bin folder...$RESET"

# Add the script to the Bin folder
cp $fileName /usr/local/bin

echo "$INFO Changing permissions for $SCRIPT$fileName$INFO...$RESET"

# Change file permission
chmod +x /usr/local/bin/$fileName

echo "$INFO Creating alias for $SCRIPT$fileName$INFO...$RESET"

if grep -q "alias $scriptName=$fileName" ~/.zshrc; then
    echo "Alias already created."
else
    # Adds the alias
    echo "alias $scriptName=$fileName" >> ~/.zshrc
fi


echo "$INFO Source...$RESET"

# Perform the Source command
source ~/.zshrc

echo
echo "$SUCCESS Done!$RESET"
echo "$INFO You can now launch your script by simply running $SCRIPT$scriptName$INFO. $RESET"

# Load new shell
zsh -l