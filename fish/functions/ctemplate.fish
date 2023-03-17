function ctemplate --description 'Create .cc/.h-files for a new "module"'
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
 * @copyright Copyright 2023 Space Flight Laboratories
 * @ingroup <DUMMY>
 */
#pragma once

">$argv.h
            # create and write c-file
            touch $argv.cc
            echo "/**
 * @file $argv.cc
 * @copyright Copyright 2023 Space Flight Laboratories
 * @brief <DUMMY>
 */

#include "\"$argv.h\""">$argv.cc
            end
        else
            echo "No module name given as argument"
        end
        # set ticket_name (git rev-parse --abbrev-ref HEAD | string split '/' | string match -r "^.*[0-9]")
        # commandline -r 'git commit -m "'$ticket_name': '
end
