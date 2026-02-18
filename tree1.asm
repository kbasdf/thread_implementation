
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



mov word ptr [push_type],0x00;         

label_50_50:  

cmp [push_type],0x00;
je dont_decrement_bx;

decrement_bx: 
dec bx;
 
dont_decrement_bx:


mov cx,dx; 
sub cx,bx;
cmp cx,2;  
je label_50_50_end;

push word ptr [push_type];  
push label_50_50;


jmp handle_5_inst_set;
label_50_50_end:

pop bx;
pop cx;
pop dx;
push cx;
push bx;

jmp create_struct;

    
    
 
check_case_60_50:
cmp word ptr [case_xx_60_50], 0x01;
jne check_case_50_50;  
push label_60_50_end;
jmp handle_5_inst_set;

label_60_50_end:   

mov word ptr [push_type], cx;
push cx; 
push 60;

jmp create_struct;




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
mov word ptr [push_type], cx;
push cx;

jmp create_struct;



create_struct: 





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




arg1 dependency,
arg 2 dependency,
result dependency,
next  
previous






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





