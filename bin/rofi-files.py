#!/usr/bin/env python3

import os
import subprocess as sub
import re
from itertools import chain

# home directory
HOME = os.environ['HOME']

# OPTIONS ========================================

# folder to exclude
EXCLUDE_DIR = [ 'Musica', 'Telefono']

# history file
hist_file = f'{HOME}/.cache/rofi-file.cache'

# command for fd
fd_command = [
    '/usr/bin/fd',              # use `fd` instead of `find`
    '-a',                       # absolute path
    '-t', 'f',                  # only files
    '-L',                       # follow symlinks
    '--one-file-system',        # ignore remote folders
    f'--base-directory={HOME}'  # search in the home directory
]

# rofi command
rofi_command = [
    '/usr/bin/rofi',
    '-l', '12',         # number of lines to show
    '-sep', '\t',       # separator for the different items
    '-eh', '2',         # how many line for item to show
    '-dmenu',           # dmenu style
    '-i',               # case insensitive
    '-markup-rows',     # use markup
    '-p', 'file',       # prompt text
    '-normal-window',   # display rofi as a normale windows (plays well with wayland)
    '-format', 'i'      # return the index of the chosen item
]

# ===============================================


# exclude the specified folders
fd_command += chain.from_iterable(['-E', excluded] for excluded in EXCLUDE_DIR)

# run the command and then splits the output lines
fd_output = sub.run(fd_command, capture_output=True, text=True).stdout.splitlines()

# read history file
with open(hist_file, 'r') as hfile:
    history = [ line.strip('\n') for line in hfile ]

# concate
filelist = history + list(filter(lambda x: x not in history, fd_output))

# format the output of `fd`
formatted_filelist = []
for file in filelist:
    line = file.replace(HOME, '~')
    line = re.sub(
                    r'(.+)/([^/]+)$',
                    r'\2\n<small><i>\1</i></small>',
                    line
                )
    formatted_filelist.append(line)
    formatted_filelist.append('\t')

# execute rofi

with sub.Popen( rofi_command, stdin=sub.PIPE, stdout=sub.PIPE, stderr=sub.DEVNULL, text=True) as rofi:
    chosen = rofi.communicate(input=''.join(formatted_filelist))[0]

# print(filelist[int(chosen.strip('\n'))])

# TODO: check if the selected file exist
# TODO: update history file
# TODO: open the selected file
