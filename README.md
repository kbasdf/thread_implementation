(see readme in full screen), as there are lot of ';;'



work in progress...
basic implementation of threading in C using asm x86
just use of basic asm instructions



;



   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;;                                                                                                ;;

   ;;                                 stack structure                                                ;;

   ;;                                                                                                ;;

   ;;                                                                                                ;;

   ;;                                                                                                ;;

   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                            ;;

   ;;  ;;           main stack         ;;                                                            ;;

   ;;  ;;                              ;;                                                            ;;

   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                            ;;

   ;;                                                                                                ;;

   ;;          |                                                                                     ;;

   ;;          |   -10h from bp                                                                      ;;

   ;;          |                                                                                     ;;

   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                            ;;

   ;;  ;;  thread program base stack   ;;                 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;         ;;

   ;;  ;;                              ;;   -400 h     \\  ;;    thread 2 stack            ;;         ;;

   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; --------------  ;;                              ;;         ;;

   ;;          |                           from bp     /  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;         ;;

   ;;          |   -200 h   from bp      \\                                                            ;;       ;;

   ;;          |                          \\                                                          ;;

   ;;          |                           \\ -300h from bp                                                        ;;

   ;;         \\|/                           \\                                                        ;;

   ;;                                        \\|                                                      ;;

   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    -  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                 ;;                                ;;

   ;;  ;;        queue                 ;;       ;;     thread 1 stack             ;;

   ;;  ;;                              ;;       ;;                                ;;                 ;;

   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                 ;;                               ;;

   ;;                                                                                                ;;

   ;;                                                                                                ;;

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;









    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;;                                                      ;;

    ;;   structure of main stack                            ;;

    ;;                                                      ;;

    ;;                               high addresses         ;;

    ;;                                                      ;;

    ;;     arg2                                             ;;

    ;;     arg1                                             ;;

    ;;     %program2                                        ;;

    ;;     return value                                     ;;

    ;;     arg 2                                            ;;

    ;;     arg 1                                            ;;

    ;;     %program                                         ;;

    ;;     thread  sp                                       ;;

    ;;     caller's bp  ----> bp                           ';;

    ;;     callers' sp                                     ';;

    ;;                               low addresses          ;;

    ;;                                                      ;;

    ;;                                                      ;;

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 

 

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;;     structure of thread program stack                ;;

    ;;                                                      ;;

    ;;                                                      ;;

    ;;                               high addresses         ;;

    ;;                                                      ;;

    ;;                                                      ;;

    ;;  thread1 bp                                          ;;

    ;;  thread1 sp                                          ;;

    ;;  variable                                            ;;

    ;;  caller's bp --> bp ---> thread base sp             ';;

    ;;  caller's sp                                        ';;

    ;;                                                      ;;

    ;;                               low addresses          ;;

    ;;                                                      ;;

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 

 

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;;     structure of thread 1/2/3 stack                  ;;

    ;;                                                      ;;

    ;;                                                      ;;

    ;;                               high addresses         ;;

    ;;                                                      ;;

    ;;                                                      ;;

    ;;                                                      ;;

    ;;                                                      ;;

    ;;  offset                                              ;;

    ;;  caller's bp --> bp                                 ';;

    ;;  caller's sp                                        ';;

    ;;                                                      ;;

    ;;                               low addresses          ;;

    ;;                                                      ;;

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





















';;stacks





&nbsp;								(higher addresses)



;;			;;		;;		;;				;;		;;		

;;			;;		;;		;;				;;		;;		

;;			;;		;;		;;				;;		;;		

;;			;;		;;   <----->	;;		<------>	;;		;;		

;;			;;		;;		;;				;;		;;		

;;			;;		;;		;;bp\_rw1			;;		;;		

;;			;;		;;		;;sp\_rw1			;;		;;		

;;			;;bp\_lw3	;;bp\_lw2 	;;bp\_lw1	<------>	;;bp\_rw2	;;		

;;			;;sp\_lw3	;;sp\_lw2	;;sp\_lw1			;;sp\_rw2	;;		

;;bp\_lw2		;;bp\_lw1	;;bp\_mw		;;bp				;;bp		;;bp\_rw1		

;;sp\_lw2		;;sp\_lw1	;;sp\_mw		;;sp				;;sp		;;sp\_rw1		



&nbsp;								(lower addressses)



fetch stack	     join             create          init                       push ground	        dump

(left wing\_3)       (left wing\_2)    (left wing\_1)    (mid wing)                (right wing\_1)        (right wing\_2)

(lw3)                (lw2)            (lw1)            (mw)                      (rw1)                 (rw2)

'

