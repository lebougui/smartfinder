# Usage

```
./smartfinder.sh 
At least -e or -t option must be set

Usage : ./smartfinder.sh -e <expression> -t <file type> [-f <folder>] [-v] [-h]

Search a file in a path (-t is mandatory).
Search an expression in several files in a path (-e is mandatory).

OPTIONS :
        -h      displays this help
        -v      runs this script in verbose mode
        -f      folder in which the search have to be performed
        -e      the expression to search
        -t      the type of files to take into account (.doc, .txt, .xml, ...)

        Examples : 
        #./smartfinder.sh  -t xml
        #./smartfinder.sh -v -e "my pattern"
        #./smartfinder.sh -v -f /home/my_folder -e "my pattern" -t "xml" 

    
-e Version       : ./smartfinder.sh v0.1 - 2012/14/03      
-e Maintainer(s) : Lebougui 

```

# Tests

```
./smartfinder.sh -t so -f /lib 
/lib/x86_64-linux-gnu/libc-2.23.so
/lib/x86_64-linux-gnu/ld-2.23.so
/lib/x86_64-linux-gnu/security/pam_rootok.so
/lib/x86_64-linux-gnu/security/pam_tally2.so
/lib/x86_64-linux-gnu/security/pam_debug.so
/lib/x86_64-linux-gnu/security/pam_succeed_if.so
/lib/x86_64-linux-gnu/security/pam_exec.so
/lib/x86_64-linux-gnu/security/pam_wheel.so
...
```
