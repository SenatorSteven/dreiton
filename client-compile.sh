
#!/bin/bash

NAME="client-compile.sh";
true=1;
false=0;

function main(){
	[ $true        ] && { local name="client";                                             } || :;
	[ $true        ] && { local folder="/tmp/$name";                                       } || :;
	[ $true        ] && { local libraries="";                                              } || :;
	[ $true        ] && { local parameters=();                                             } || :;
	[ $true        ] && { cd "${BASH_SOURCE%/*}";                                          } || :;
	[ ! -f "$NAME" ] && { printf "$NAME: could not find $NAME directory\n" 1>&2; return 1; } || :;
	[ $true        ] && { rm -rf "$folder";                                                } || :;
	[ $true        ] && { parameters+=(header-folder "headers");                           } || :;
	[ $true        ] && { parameters+=(source-folder "source");                            } || :;
	[ $true        ] && { parameters+=(debug-folder "$folder/debug");                      } || :;
	[ $true        ] && { parameters+=(output-folder "$folder/output");                    } || :;
	[ $true        ] && { parameters+=(record-folder "$folder/record");                    } || :;
	[ $true        ] && { parameters+=(systems "systems/client-system");                   } || :;
	[ $true        ] && { parameters+=(mains "$name");                                     } || :;
	[ $true        ] && { parameters+=(executables "$name");                               } || :;
	[ $true        ] && { parameters+=(libraries "$libraries");                            } || :;
	[ $true        ] && { ./compile/compile.sh "${parameters[@]}" "$@";          return 0; } || :;
}

main "$@";
exit $?;

