
; You may customize this and other start-up templates;
; The location of this template is c:\emu8086\inc\0_com_template.txt




start:

;;expected coming from thread stack


mov sp,[bp];
mov bp,[bp];  ;;shortcut for moving to stack
              ;; (not recommended though)


dec sp;
dec sp;
;; stack --- > main


;;pre-requisite for tree;
struct_init():
mov bx,bp;
sub bx,8000h;
mov cx,sp;
mov sp,bx;
push cx;
push bp;
mov cx,sp;
mov bx,bp;
mov bp,[bp];
inc bx;
inc bx;
mov sp,[bx];

;;stack-->main

push cx;         ;; push to main stack
push bx;         ;; push to main stack

struct_init_fin:


mov bx, main_line_1;
jmp here_1;






mov word ptr [replay],0x01;

mov bx,ax;
push here_1;   push to main stack
jmp comparison;                          jump
                                         <---->
take_from_tree_caller:    ; comparison /---------\   tree
push create_thread;       ;           /           \
jmp back_from_caller;     ;         |/             \|


tree_do:

add word ptr [rfa_1],0x01;

mov word ptr [replay_capturing_args],0x01;
dec bx;
dec bx;
dec bx;

push bx;

case_check_555:

loop:

mov cl,3;
mov dx,[bx];
and dl,0Fh;
cmp dl,5;
jne do_somethingelse;
dec bx;
dec cl;
jmp loop

do_somethingelse:
cmp cl,0;
jne do_somethingelse_1;
mov word ptr [case_50_50_50],0x01;
jmp close_case;


do_somethingelse_1:
cmp cl,1;
jne do_something_else_2;
dec bx;
mov dx,[bx];
and dl,0Fh;
cmp dl,6;
jne last_two_are_50;
mov word ptr [case_xx_xx_60],0x01;
dec bx;
jmp loop;


last_two_are_50:
dec bx;
mov dx,[bx];
and dl,0x0F;
cmp dl,6;
jne label_xx_50_50;
mov word ptr[case_xx_60_50], 0x01;
jmp close_case;

label_xx_50_50:
mov word ptr [case_xx_50_50],0x01;
jmp close_case;



do-somethingelse_2:
cmp word ptr[case_xx_xx_60],0x01;
jne do_something_2_contnue:
cmp cl,2;
jne do_something_3;
mov word ptr [case_xx_xx_60],0x00;
mov word ptr [case_xx_50_60],0x01;

do_something_2_continue
cmp cl,2;
jne do_somethingelse_3;

dec bx;
mov dx,[bx];
and dl,0x0F;
cmp dl,6;
jne case_last_is_50;
mov word ptr [case_xx_xx_60],0x01;


case_last_is_50:
mov word ptr[case_xx_60_50],0x01;
jmp close_case;

do_somethingelse_3:

cmp word ptr [case_xx_xx_60],0x01;
je last_case;
cmp cl,3;
mov word ptr [case_xx_xx_60],0x01;
dec bx;
dec bx;
dec bx;
jmp loop;

last_case:
mov word ptr [case_xx_xx_60],0x00;
mov word ptr [case_xx_60_60],0x01;

close_case:
nop;

pop bx;


mov cx,bx;
mov dx,bx;

check_which_flag_up:
cmp word ptr [case_50_50_50], 0x01;
jne check_case_60_50;


label_50_50:

dec bx;
push label_50_50_end;
jmp handle_5_inst_set_tree1_version;
label_50_50_end:
push word ptr[push_type];

dec bx;
push label_50_50_end_1;
jmp handle_5_inst_set_tree1_version;
label_50_50_end_1:
push word ptr[push_type];


jmp return_here;




check_case_60_50:
cmp word ptr [case_xx_60_50], 0x01;
jne check_case_50_50;
push label_60_50_end;
jmp handle_5_inst_set;

label_60_50_end:

mov cx, word ptr [push_type];
push cx;
push 60;

jmp return_here;




check_case_50_50:
cmp word ptr [case_xx_50_50], 0x01;
jne check_case_50_60;
jmp label_50_50;

check_case_50_60:
cmp word ptr [case_xx_50_60], 0x01;
je label_50_60:
label_50_60:
dec bx;
dec bx;
dec bx;
push label_50_60_end;
jmp handle_5_inst_set;
label_50_60_end:

push 60;
mov cx,word ptr [push_type];
push cx;

jmp return_here;




;;
;; rough work below
'
struct:
pop ax;
pop bx;
pop cx;

jmp run_create_create_table;
jmp run_create_join_table;


and al,0Fh;
and bl,0Fh;

do_cases:

case_6:
cmp bl,8;

jne case_50;
push 0x00;
push 0x00;
push 0x00;

case_50:
cmp bl,0;
jne case_51;
push 0x0A;
push 0x00;
push 0x00;

case_51:
cmp bl,1;
jne case_52;
push 0x0C;
push 0x00;
push 0x00;

case_52:
cmp bl,2;
jne case_53;
push 0x0D;
push 0x00;
push 0x00;

case_53:
cmp bl,3;
jne case_54;
push 0x0B;
push 0x00;
push 0x00;

case_54:
push 0x0E;
push 0x00;
push 0x00;

mov bl,al;
mov al,0f;
cmp al,0f;
je cases_are_done;
jmp do_cases;

cases_are_done:




'


;;registers available cx,dx

run_create_create_table:

mov dx,sp;
mov sp,bp;
sub sp,f0f0;
push dx;
push bp;
mov bp,sp;


run_create_join_table;
push create_thread;
push main_line_1;

note_1:
pop cx;
mov dx,note_2;
sub dx,cx;
jmp [dx];
note_2:

start ends;





;;;;;;;

tree1.asm



define block
if create.thread.args=registers
find depends on
otherwise no dependency

;;expected standing at ----> init thread

;;sp-->top
;;bp--> bottom

;; pointer to play with ----> bx ;;
;; pointer to move around --- > bx;;

mov dx,sp;
sub bp,06h;
mov sp,[bp];
add bp,06h;

;;sp---rw1
;; bp--> mw (init)

mov bx,dx;


above:
inc bx;  ;; sp---> thread no. (1st) from top
inc bx;
cmp bx,bp;
je label_stop;


push [bx];    ;; push to rw 1 thread no.

mov ax,[bx];  <--- ax carries thread no.

;; procedure to move to left wing--> lw1
mov bx,bp;
sub bx,02h;
mov bx,[bx];  ;; sp---> sp of lw1
inc bx;
inc bx;

loop:
cmp [bx],ax;
je break;
add bx,04h;
jmp loop;

break:
dec bx;
dec bx;
push [bx];  ;; push to rw1

mov bx,bp;
sub bx,04h;
mov bx,[bx];  ;; bx --> lw2 -->create thread

mov cx,bx; ;;cx --> bp of create thread
dec bx;
dec bx;
mov bx,[bx];  ;; bx--> sp of lw2


inc bx;
inc bx;

loop:

cmp [bx],ax;
je break:
add bx,04h;
jmp loop;

break:
dec bx;
dec bx;
push [bx];


mov bx,cx;

dec bx;
dec bx;
dec bx;
dec bx;
mov bx,[bx]; ;; bx--> bp of join (lw2)

mov cx,bx;
dec bx;
dec bx;  ;; bx--> sp of lw3

mov cx,bx; ;; cx-->bp of join (-)1
mov bx,[bx];
inc bx;
inc bx;

mov cx,bx;

;;multiple pushes begin
mov bx,bp;
sub bx,08h;
mov bx,[bx] ;;bx ---> bp of lw1
sub bx,04h;
mov bx,[bx];
add bx,02h;
mov [bx],sp;  ;; sp updated in rw2
sub bx,02h;
mov bx,[bx];
sub bx,02h;
mov bx,[bx];
mov sp,bx; ;; stack ---> rw2



dec cx;
dec cx;
mov bx,cx;
mov bx,[bx];
mov cx,bx;  ;; cx --> bp of lw3 fetch

inc cx;
inc cx;

mov bx,cx;  ;; cx---> sp of lw3 fetch
mov bx,[bx];
inc bx;
inc bx;

loop:

cmp bx,cx;
jge break;

cmp [bx],ax;
je spotted:
add bx,04h;
jmp loop;

spotted:
dec bx;
dec bx;
push [bx];
inc bx;
inc bx;
jmp loop;


break:
mov bx,bp;
sub bx,08h;
mov bx,[bx];
sub bx,02h;
cmp sp,[bx];
je no_fetch_found;
push 0;
mov sp,cx;
sub bx,02h;
mov bx,[bx];
add bx,02h;
mov bx,[bx];
mov sp,bx;
mov bx, bp;
sub bx,08h;
mov bx,[bx];
sub bx,02h;
mov cx,bx;
mov bx,[bx];
push bx;
mov bx,cx;
mov [bx],cx;


no_fetch_found:
sub bx,02h;
mov bx,[bx];
add bx,02h;
mov bx,[bx];
mov sp,bx;  ;; stack---> rw1

push 0x00; ;; push to rw1





mov bx,dx;
inc bx;
jmp tree1.asm;


;;lets get the  return expected flag now
mov cx,sp;
mov bx,sp;
add bx,02h;
mov bx,[bx];
sub bx,04h;
mov bx,[bx];
push bx;  ;; push to rw1
          ;; pushed return expected flag
mov sp,cx;

add bx,04h; ;;bx ---> create thread pointer


jmp tree_do;
return_here:




fetch
join
create_thread
thread_no.








[thread object]
[thread number]
[arg1]
[arg2]
[result_flag]
[]

arg1 thread
arg2 thread



init thread
fetch thread
create thread
join thread




