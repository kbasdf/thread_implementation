(see readme in full screen), as there are lot of ';;'



work in progress...
basic implementation of threading in C using asm x86
just use of basic asm instructions



;                      



&nbsp;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

&nbsp;  ;;                                                                                                ;;

&nbsp;  ;;                                 stack structure                                                ;;

&nbsp;  ;;                                                                                                ;;

&nbsp;  ;;                                                                                                ;;

&nbsp;  ;;                                                                                                ;;

&nbsp;  ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                            ;;

&nbsp;  ;;  ;;           main stack         ;;                                                            ;;

&nbsp;  ;;  ;;                              ;;                                                            ;;

&nbsp;  ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                            ;;

&nbsp;  ;;                                                                                                ;;

&nbsp;  ;;          |                                                                                     ;;

&nbsp;  ;;          |   -10h from bp                                                                      ;;

&nbsp;  ;;          |                                                                                     ;;

&nbsp;  ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                            ;;

&nbsp;  ;;  ;;  thread program base stack   ;;                 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;         ;;

&nbsp;  ;;  ;;                              ;;   -400 h     \\  ;;    thread 2 stack            ;;         ;;

&nbsp;  ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; --------------  ;;                              ;;         ;;

&nbsp;  ;;          |                           from bp     /  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;         ;;

&nbsp;  ;;          |   -200 h   from bp      \\                                                            ;;       ;;

&nbsp;  ;;          |                          \\                                                          ;;

&nbsp;  ;;          |                           \\ -300h from bp                                                        ;;

&nbsp;  ;;         \\|/                           \\                                                        ;;

&nbsp;  ;;                                        \\|                                                      ;;

&nbsp;  ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    -  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                 ;;                                ;;

&nbsp;  ;;  ;;        queue                 ;;       ;;     thread 1 stack             ;;

&nbsp;  ;;  ;;                              ;;       ;;                                ;;                 ;;

&nbsp;  ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                 ;;                               ;;

&nbsp;  ;;                                                                                                ;;

&nbsp;  ;;                                                                                                ;;

&nbsp;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          









&nbsp;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;   structure of main stack                            ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                               high addresses         ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;     arg2                                             ;;

&nbsp;   ;;     arg1                                             ;;

&nbsp;   ;;     %program2                                        ;;

&nbsp;   ;;     return value                                     ;;

&nbsp;   ;;     arg 2                                            ;;

&nbsp;   ;;     arg 1                                            ;;

&nbsp;   ;;     %program                                         ;;

&nbsp;   ;;     thread  sp                                       ;;

&nbsp;   ;;     caller's bp  ----> bp                           ';;

&nbsp;   ;;     callers' sp                                     ';;

&nbsp;   ;;                               low addresses          ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        

&nbsp;   

&nbsp;   

&nbsp;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

&nbsp;   ;;     structure of thread program stack                ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                               high addresses         ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;  thread1 bp                                          ;;

&nbsp;   ;;  thread1 sp                                          ;;

&nbsp;   ;;  variable                                            ;;

&nbsp;   ;;  caller's bp --> bp ---> thread base sp             ';;

&nbsp;   ;;  caller's sp                                        ';;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                               low addresses          ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  

&nbsp;   

&nbsp;   

&nbsp;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

&nbsp;   ;;     structure of thread 1/2/3 stack                  ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                               high addresses         ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;  offset                                              ;;

&nbsp;   ;;  caller's bp --> bp                                 ';;

&nbsp;   ;;  caller's sp                                        ';;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;                               low addresses          ;;

&nbsp;   ;;                                                      ;;

&nbsp;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

