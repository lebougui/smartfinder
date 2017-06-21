#!/bin/sh

#################################################################################
#
# AUTHOR        : Lebougui
# DATE          : 2012/14/03
# DESCRIPTION   : v 0.1 -  Search a file or an expression in files
#
#################################################################################
VERSION="v0.1 - 2012/14/03      "
MAINTAINERS="Lebougui"

GREP="grep"
FIND="find"
PWD="pwd"

TRUE=1
FALSE=0

VERBOSE=$FALSE

# display this script help
help()
{
cat << EOF

Usage : $0 -e <expression> -t <file type> [-f <folder>] [-v] [-h]

Search a file in a path (-t is mandatory).
Search an expression in several files in a path (-e is mandatory).

OPTIONS :
        -h      displays this help
        -v      runs this script in verbose mode
        -f      folder in which the search have to be performed
        -e      the expression to search
        -t      the type of files to take into account (.doc, .txt, .xml, ...)

        Examples : 
        #$0  -t xml
        #$0 -v -e "my pattern"
        #$0 -v -f /home/my_folder -e "my pattern" -t "xml" 

    
EOF

version

}


# display this script version
version()
{
    echo -e "Version       : $0 $VERSION" 
    echo -e "Maintainer(s) : $MAINTAINERS \n"
}


while getopts "hve:f:t:" param; do

   case $param in 
       f) ROOT_FOLDER=$OPTARG
       ;;

       e) PATTERN=$OPTARG
       ;;

       t) FILE_TYPE=\""*.$OPTARG"\"
       ;;

       v) VERBOSE=$TRUE
       ;;

       h) help
          exit 0
       ;;

       *) echo "Invalid option"
          help
          exit 1
       ;;
   esac

done

shift $(($OPTIND -1 ))


#Checkings
if [ -z "$ROOT_FOLDER" ] 
then
    ROOT_FOLDER=$($PWD)
fi

if [ -z "$PATTERN" ] && [ -z "$FILE_TYPE" ]
then
    echo "At least -e or -t option must be set"
    help
    exit 1
fi


if [ "$VERBOSE" = "$TRUE" ] 
then
    echo -e "folder in which the research will be performed is [$ROOT_FOLDER]"

    if [ ! -z "$PATTERN" ]
    then
        echo -e "expression to search is [$PATTERN]"
    fi

    if [ ! -z "$FILE_TYPE" ]
    then
        echo -e "file to take into account [$FILE_TYPE]"
    fi

fi

COMMAND="$FIND $ROOT_FOLDER"

if [ ! -z "$FILE_TYPE" ]
then
    COMMAND="$COMMAND -name $FILE_TYPE" 
fi

if [ ! -z "$PATTERN" ]
then
    COMMAND="$COMMAND | xargs $GREP -ri $PATTERN --color" 
fi

if [ "$VERBOSE" = "$TRUE" ] 
then
    echo $COMMAND
fi

eval $COMMAND

exit 0
