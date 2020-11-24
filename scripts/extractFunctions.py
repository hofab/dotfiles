#!/usr/bin/env python3

import argparse
import subprocess
import sh
import sys

parser = argparse.ArgumentParser(description='''Testing''')
# clean this up!
parser.add_argument("filename", help='Filename you want to extract the functions from.')

def check_environment():
    for prog_name in ['ctags']:
        if sh.which(prog_name) is None:
            sys.exit('Could not find \'{}\' in PATH! I need it!'.format(prog_name))

def extractFunctionsWithCtags(filename):

    ctags_output = subprocess.run(['ctags', '-x', '--c-kinds=fp', filename],
                                  stdout=subprocess.PIPE,
                                  stderr=subprocess.DEVNULL,
                                  universal_newlines=True)

    lines = ctags_output.stdout.split('\n')
    for line in lines:
        split_line = line.split(' ')
        split_line = list(filter(None,split_line))
        output = split_line[4:]
        print(' '.join(output))



def main():
    print(" -- VERSION 0.1 -- ")
    args = parser.parse_args()

    # check if we are in right directory and have .clang-tidy and .clang-format file
    # if we find the file we need to check what version of the file we have
    # if there is no file replace it
    check_environment()

    extractFunctionsWithCtags(args.filename)
    print(args.filename)

    # does not check if files are in the sw_pn
    # files that are not included in the sw+pn will be run without the appropriate defines
    return retcode


if __name__ == '__main__':
    retcode = False

    try:
        retcode = main()
    except KeyboardInterrupt:
        print('\nAborting')
    sys.exit(retcode)
