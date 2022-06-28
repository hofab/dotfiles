function ctemplate --description 'Create .c/.h-files for a new "module"'
    if count $argv > /dev/null
        if [ (count $argv) -gt 2 ]
            echo "Too many arguments. \$ctemplate <MODULE_NAME>"
        else
            # we should check if the file exists - but I am to lazy right now
            # create and write h-file
            touch $argv.h
            set UPPER_ARGV (echo $argv | string upper)

            echo "/**
 * @file $argv.h
 * @copyright Copyright 2022 Kepler Communications Inc.
 * @ingroup <DUMMY>
 *
 * @note Assumptions:
 */
#pragma once

#ifdef __cplusplus
extern ""C"" {
#endif

// <CODE>

#ifdef __cplusplus
}
#endif
">$argv.h
            # create and write c-file
            touch $argv.c
            echo "/**
 * @file $argv.c
 * @copyright Copyright 2022 Kepler Communications Inc.
 * @brief <DUMMY>
 */

#include "\"$argv.h\""">$argv.c
            end
        else
            echo "No module name given as argument"
        end
        # set ticket_name (git rev-parse --abbrev-ref HEAD | string split '/' | string match -r "^.*[0-9]")
        # commandline -r 'git commit -m "'$ticket_name': '
end
