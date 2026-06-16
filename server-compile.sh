
# server-compile.sh
#
# MIT License
#
# Copyright (C) 2025 Stefanos "Steven" Tsakiris
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#!/bin/bash

NAME="server-compile.sh";
true=1;
false=0;

function main(){
	[ $true        ] && { local name="${NAME%-compile.sh}";                                     } || :;
	[ $true        ] && { local mainName="$name";                                               } || :;
	[ $true        ] && { local executableName="$name";                                         } || :;
	[ $true        ] && { local folder="/tmp/$name";                                            } || :;
	[ $true        ] && {                                     local n="dreiton-core";           } || :;
	[ $true        ] && { local l1="/tmp/$n/output/lib$n.so";                                   } || :;
	[ $true        ] && { local libraries="$l1";                                                } || :;
	[ $true        ] && { local parameters=();                                                  } || :;
	[ $true        ] && { cd "${BASH_SOURCE%/*}";                                               } || :;
	[ ! -f "$NAME" ] && { printf "$NAME: could not find $NAME directory\n" 1>&2;      return 1; } || :;
	[ $true        ] && { parameters+=(header-folder "headers");                                } || :;
	[ $true        ] && { parameters+=(source-folder "source");                                 } || :;
	[ $true        ] && { parameters+=(debug-folder "$folder/debug");                           } || :;
	[ $true        ] && { parameters+=(output-folder "$folder/output");                         } || :;
	[ $true        ] && { parameters+=(record-folder "$folder/record");                         } || :;
	[ $true        ] && { parameters+=(defines "");                                             } || :;
	[ $true        ] && { parameters+=(includes "-I$(pwd)");                                    } || :;
	[ $true        ] && { parameters+=(libraries "$libraries");                                 } || :;
	[ $true        ] && { parameters+=(mains "$mainName");                                      } || :;
	[ $true        ] && { parameters+=(executables "$executableName");                          } || :;
	[ $true        ] && { ./compile/compile.sh "${parameters[@]}" "$@";               return 0; } || :;
}

main "$@";
exit $?;

