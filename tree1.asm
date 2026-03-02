
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

push bx;       ;; >> resolve this later

case_check_555:

mov cl,3;
loop:
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
cmp word ptr[case_xx_xx_60],0x01;
jne label_x;
mov word ptr[case_xx_60_60],0x01;
mov word ptr[case_xx_xx_60],0x00;
jmp close_case;

label_x:
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
jne do_something_2_continue:
cmp cl,2;
jne do_something_3;
mov word ptr [case_xx_xx_60],0x00;
mov word ptr [case_xx_50_60],0x01;

do_something_2_continue:

dec bx;
mov dx,[bx];
and dl,0x0F;
cmp dl,6;
jne case_last_is_50;
mov word ptr [case_xx_xx_60],0x01;
dec bx;
jmp loop;

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
        ;; bx----> create thread ip (-) minus 3


mov cx,bx;
mov dx,bx;


check_which_flag_up:
cmp word ptr [case_50_50_50], 0x01;
jne check_case_60_50;


label_50_50:

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



mov dx,sp;



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
jge label_stop;


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

mov cx,sp;
mov bx,sp;
add bx,06h;
mov bx,[bx]; ;;bx---> create thread ip




jmp tree_do;
return_here:


mov bx,sp;
mov cx,bx;
mov ax,bx;


label_data:
data_variable dw 0x00;

loop:

mov cx,bx;
mov ax,bx;

cmp word ptr[label_data],0x02;
je close;

cmp [bl],60;
jne not_60;
add bx,02h;
mov sp,bx;
push 0x00;
inc word ptr[label_data];
jmp loop;


not_60:
mov cx,[bx];
mov ax,bx;
mov bx,bp;
sub bx,08h;
mov bx,[bx];  ;;bx---> bp of rw1

sub bx, 02h;
mov sp,[bx]; ;sp---> rw2 ;;push ground
push cx;    ;; push to rw2
push 0x00;   ;; push to rw2
mov cx,sp;  ;;; cx----> sp rw2
sub bx,02h;
mov bx,[bx]; ;; bx--> bp of rw2
add bx,04h;
cmp word ptr[label_data],0x01;
je skip_this_line;
mov sp,bx;
push ax; ; ;; push to rw2 (bottom)

skip_this_line:
sub bx,04h;
mov bx,[bx];
sub bx,02h;

mov sp,ax;
inc sp;
inc sp;
push [bx];   ;; push to rw1

add bx,02h;
mov sp,bx;
push cx;   ;; push to rw1
mov bx,ax;
mov sp,bx;
inc bx;
inc bx;
inc word ptr [label_data];
jmp  loop;


close:
dec sp;
dec sp;
mov cx,sp;
mov sp,bp;
dec sp,04;
push cx;  push to mw

mov bx,bp;
dec bx,06;
mov sp,[bx];

jmp start_reg_reg_mapping;
return_here:

inc dx;
inc dx;
inc dx;
inc dx;

jmp tree1.asm;

label_stop:
;;finished
nop;
nop;


start_reg_reg_mapping:

;;sp-->rw1
;;bp-->mw

push 0x00; ;;push to rw1
           ;; finished status ?
mov bx,sp;
add bx,0Eh;
push bx; ;; push to rw1  ;;base pointer
mov bx,[bx];
mov cx, bx;   ;; cx carries thread no.
mov bx,bp;
sub bx,04h;
mov bx,[bx];
sub bx,02h;
mov bx,[bx];
loop:
add bx,02h;
cmp [bx],cx;  ;; cx is free !
je found_thread_no;
add bx,02h;
jmp loop;

found_thread_no:
mov cx,bx; ;;cx---> sp of lw2

mov ax,sp;

mov bx,bp;
sub bx;08h;
mov bx,[bx];
sub bx,02h;
mov bx,[bx];
mov sp,bx;

mov bx,cx;
loop:
add bx,04h;
cmp bx,[bp_lw_2];
jge end;
push [bx]; push to rw2
jmp loop;

end:
push 0x00; ;; push to rw2
mov cx,sp;
mov sp,ax;

mov bx,bp;
sub bx,08h;
mov bx,[bx];
sub bx,02h;
push [bx]; push to rw1
mov ax,sp;
dec bx,02h;
mov sp,bx;
push cx; ;; push to rw1

mov ax,sp;

mov sp,cx;
add ax,10h;
mov bx,ax;
sub ax,10h;
mov bx,[bx];
mov cx,bx;

mov bx,bp_lw_2;
sub bx,02h;
mov bx,[bx];

loop_above:
mov bp,sp;

loop:

;;cx carries create_thread ip
cmp bx,[bp_lw3];
jg end;
cmp [bx],cx;
jl do_this;
return here:
add bx,04h;
jmp loop;


do_this:
add bx,02h;
push bp;
jmp do_this_1;
push_1:
pop bp;
push [bx];
sub bx,02h;
skip_line_1:
jmp return_here;
defer_push:
pop bp;
sub bx,02h;
jmp return_here;


do_this_1:
dec bp;
dec bp;
cmp bp,sp;
jle push_1;
cmp [bp],[bx];
je defer_push;
jmp do_this_1;

end:
push 0x00;
mov cx,sp;
mov bp,bp_mw;
mov sp,ax;
mov bx,bp_rw_1;
sub bx,02h;
push [bx];
mov ax,sp;
add bx,02h;
mov sp,bx;
push cx;
mov sp,ax;



label_list_of_fetch_before_creat_thread_ip

mov ax,sp;

mov bx,sp
add bx,14h;  ;; should point create thread ip
mov bx,[bx];
mov cx,bx; ;; cx carries create thread ip

mov bx,[bp_rw1];
sub bx,02h;
mov sp,[bx];

mov bx,[bp_lw2];
sub bx,02h;
mov bx,[bx];


loop_k:
cmp bx,[bp_lw3];
jle end;
cmp [bx],cx;
jnle xx
push [bx];

xx:
add bx,04h;
jmp loop_k;


end:
push 0x00;
mov cx,sp;

usual_proc_1:
mov sp,ax;
mov bx,[bp_rw1];
sub bx,02h;
push [bx];
mov ax,sp;
add bx,02h;
mov sp,bx;
push cx;
mov sp,ax;


label_of_fetch_list_before_create[reg]:

mov bx,sp;
add bx,02h;
mov sp,cx;
mov bx,[bx];
mov cx,bx;


loop_u:
mov bx,[bx];

cmp bx,0x00;
je end_u;

case_58h:
cmp [bl],58h;
jne case_5Bh;
push 58h;

case_5Bh:
cmp [bl],5Bh;
jne case_59h;
push 5Bh;

case_59h:
cmp [bl],59h;
jne case_5Ah;
push 59h;

case_5Ah:
push 5Ah;

dec cx;
dec cx;
mov bx,cx;
jmp loop_u;


end_u:
push 0x00;

[do_proc here]


data_label:
dw 0x01;
jmp loop_above;
end_below:
push 0x00;
jmp label_proc;



label_push_fetch_register_own:

mov sp,cx;    ;;
mov bx,ax;    ;;
add bx,10h;   ;; pointer to fetch
mov bx,[bx];  ;;

mov cx,bx;


loop_above:

mov bx,[bx];
cmp bx, 0x00;
je end;

case pop_ax:
cmp bl,58h;
jne case pop_bx;
push 5800h;

case pop_bx:
cmp bl,5Bh;
jne case pop_cx;
push 5B00h;

case pop_cx:
cmp bl,59h;
jne case pop_dx;
push 5900h;

case pop_dx;
cmp bl,5Ah;
push 5A00h;

dec cx;
dec cx;
mov bx,cx;
jmp loop;

end:
cmp [data_label],0x01;
je end_below;
push 0x00;

usual_proc:
mov cx,sp;
mov sp,ax;
mov bx,bp_rw1;
sub bx,02h;
mov bx,[bx];
push bx;  push to rw1
mov ax,sp;
add bx,02h;
mov sp, bx;
push cx;  ;; push to rw1
mov sp,ax;


end_all:
nop;
;;sp-->ax
;;




fetch_register_list_own [registers]
_list_of_fetch_before_create_thread[register]
_list_of_fetch_before_create_thread[ip]
_list_of_fetch_before_create_thread[thread no.]
my_prior_joins [thread no.]
base stack pointer
finished status
push arg
push arg
return expected flag
fetch
join
create
thread no

mov bx,bp;
add sp,




jmp return_here;
;;start register-register mapping



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




