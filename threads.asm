
org 100h   
.data
    AXREG EQU 0FFFCh
    CXREG EQU 0FFFAh
    DXREG EQU 0FFF8h
    BXREG EQU 0FFF6h
    SPREG EQU 0FFF4h
    BPREG EQU 0FFF2h
    SIREG EQU 0FFF0h
    DIREG EQU 0FFEEh   
    IPREG EQU 0FFECh  
    
    
    
   
    abc dw 100h;    
    thread_base_sp dw 0000h; 
    var_a dw 00h;
    flag dw 00;
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;                                                                                         ;;
    ;; can handle max 16*16 threads, notice abc. Result of mul ax is in ax only, thus, 16*16   ;;
    ;;                                                                                         ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
   
   
     


               
                   



.code
start_1:  

; Define virtual register addresses          
; Define virtual register addresses   

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;                                                   ;;;
    ;;;      save a copy of registers onto stack          ;;;
    ;;;                                                   ;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    pusha;    
    mov [IPREG],bx; 
    mov BX,[IPREG];
    
    lookup: 
              
   ;; and [bx],0x008B;
    
    cmp  [BX], 0xC38B;  
    je mov_ax_bx; 
    
    
    cmp [bx], 0xC18B;    
    je mov_ax_cx;
    
    cmp [bx], 0xC28B;
    je mov_ax_dx;
    
    
    cmp [bx],0xD88B;   
    je mov_bx_ax;
    
    cmp [bx],0xD98B;
    je mov_bx_cx;
    
    cmp [bx],0xDA8B; 
    je mov_bx_dx;
    
    
    cmp [bx],0xC88B;
    je mov_cx_ax; 
    
    
    
    cmp [bx],0xCB8B;
    je mov_cx_bx;   
    
    
    cmp [bx],0xCA8B;
    je mov_cx_dx;   
    
    
    cmp [bx],0xD08B;
    je mov_dx_ax;   
    
    
    cmp [bx],0xD38B;
    je mov_dx_bx;  
    
    
    cmp [bx],0xD18B; 
    je mov_dx_cx;   
    
    mov al,[bx]; 
    cmp al,0xB8;    
    je alt_mov_ax;  
     
    mov al,[bx];
    cmp al,0xBB;
    je alt_mov_bx;
      
    and al,[bx];
    cmp al,0xB9;
    je alt_mov_cx;   
    
    
    and al,[bx];
    cmp al,0xBA;
    je alt_mov_dx;

    
 
    nop; 
    jmp last; 
    nop;
    nop;  
    
       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       ;;;                                                                                       ;;;
       ;;;                main proc                                                              ;;;
       ;;;                                                                                       ;;;
       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
   program:
    mov ax,bx;
    nop;
    nop;
    jmp last;
    
       
       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       ;;;                                                                                        ;;;
       ;;;                     mov reg reg                                                        ;;;
       ;;;                                                                                        ;;;
       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       
       
    mov_ax_bx:  
    push this1;  
    jmp header_bx; 
    this1:  
    mov word ptr [AXREG], dx;           
    jmp usual_1;
       
       
    mov_ax_cx: 
    push this2;  
    jmp  header_cx; 
    this2:    
    mov word ptr [AXREG], dx;
    jmp usual_1;    
       
       
    mov_ax_dx: 
    push this3;  
    jmp header_dx;
    pop ax;
    this3:                 
    mov word ptr [AXREG],dx;
    jmp usual_1;
           
           
    mov_bx_ax: 
    push this4;  
    jmp header_ax;
    this4:  
    mov word ptr [BXREG], dx;
    jmp usual_1;
           
           
    mov_bx_cx:  
    push this5;  
    jmp header_cx;
    this5:
    mov word ptr [BXREG],dx;
    jmp usual_1;
           
           
    mov_bx_dx:
    push this6;  
    jmp header_dx;
    this6:
    mov word ptr [BXREG],dx;
    jmp usual_1;
       
    
    mov_cx_ax: 
    push this7;  
    jmp header_ax;
    this7:
    mov word ptr [CXREG],dx;
    jmp usual_1;
       
       
    mov_cx_bx: 
    push this8;  
    jmp header_bx;
    this8:            
    mov word ptr [CXREG],dx;
    jmp usual_1;
      
      
    mov_cx_dx:
    push this9;  
    jmp header_dx;
    this9:
    mov word ptr [CXREG],dx;
    jmp usual_1;
           
           
    mov_dx_ax:  
    push this10;  
    jmp header_ax;
    this10:
    mov word ptr [DXREG],dx;
    jmp usual_1;
    
    
    mov_dx_bx:      
    push this11;  
    jmp header_bx;
    this11:
    mov word ptr [DXREG],dx;
    jmp usual_1; 
    
    
    mov_dx_cx:  
    push this12;  
    jmp header_cx;
    this12: 
    mov word ptr [DXREG],dx;
    jmp usual_1;
    
     
    
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;                                                                         ;;;
    ;;;                               usuals                                    ;;;
    ;;;                                                                         ;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    usual_1:
    add bx,02h; 
    mov [IPREG],bx;
    jmp lookup;
                                                                 
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;                                                                         ;;;
    ;;;                  mov reg,data                                           ;;;
    ;;;                                                                         ;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                             
                                                                 
               
    alt_mov_ax:                 
    add bx,01h;
    mov dx,[bx];
    mov word ptr [AXREG], dx;   ; store into AX slot at FFFC           
    jmp usual_1;
    
    alt_mov_bx:
    add bx,01h;
    mov dx,[bx];
    mov word ptr [BXREG], dx;
    jmp usual_1;
    
    alt_mov_cx:   
    add bx,01h;
    mov dx,[bx];
    mov word ptr [CXREG], dx;
    jmp usual_1;
    
    alt_mov_dx:
    add bx,01h;
    mov dx,[bx];
    mov word ptr [DXREG], dx;
    jmp usual_1;     
    
      
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;                                                                             ;;;
    ;;;            for capturing data from mov reg reg operand                      ;;;
    ;;;                                                                             ;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    
    header_ax:
    mov DX,[AXREG];
    ret;

    
    header_bx:
    mov DX,[BXREG]; 
    ret;
     
    
    header_cx:
    mov DX,[CXREG];
    ret;
    
    
    header_dx:
    mov DX,[DXREG];
    ret;
    
 
    
    last:
    nop;
    nop;





'                      

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
   ;;  ;;                              ;;   -200 h     \  ;;    thread 2 stack            ;;         ;;
   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; --------------  ;;                              ;;         ;;
   ;;          |                           from bp     /  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;         ;;
   ;;          |   -100 h   from bp                                                                  ;;       ;;
   ;;          |                                                                                     ;;
   ;;          |                                                                                     ;;
   ;;         \|/                                                                                    ;;
   ;;                                                                                                ;;
   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                            ;;
   ;;  ;;  thread 1 stack              ;;                                                            ;;
   ;;  ;;                              ;;                                                            ;;
   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                            ;;
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

 '


    main_line_1:
     
    main_init:
    push sp;  
    push bp;     
    main_init_stack_calc:
    mov bp,sp;    
    push l_m1;
    l_m1:  
    jmp thread_init;      ;; alternative for pthread t1 
      
    
    
    main_line_2:
          
    push DX;            ;;  3rd push to main stack
    push program;       ;; 4th push to main stack  
    sub bx, sp;         ;; calculating Offset, so that we can push to thread 1/2/ stack
    push l_m2;
    l_m2:                             
    
                      ;; JMP carries arguments
                      ;; bx carries offset
                      
    jmp create_thread;  ;; alt for thread_create(function addr) 
    
    
                        ;; bx holds the value of offset 
    
    main_line_3:
    push 01;            ;; push to main stack  01 is code for 1st thread   
    push 0;             ;; return expected flag ?
    push l_m3;
    l_m3:
    jmp join; 
        
    
    main_line_4:
    main_line_5:
    main_line_6:
  
         
         
         
         
    
    thread_init: 
    pop cx;    CX has the IP
    inc cx;    inc CX
    inc cx;    by 3 moves address 
    inc cx;    ahead by 3 units ;;
    
    thread_init_stack_calc: 
    mov dx, sp;
    mov sp,bp;                  ;; just checking here if 
    sub sp,10h;                 ;; thread stack has
    mov bx,sp;                  ;; already been created ?
    

                                ;; dx is free now
    push dx;                    ;; 1st push to thread program stack
                                ;; 
    push bp;                    ;; 2nd push to thread program stack
    mov bp,sp;                  ;; SP ---> thread program bp
                                                            
                                                            
    mov thread_base_sp, sp;
    push 0;                     ;; 3rd push to thread program stack
    mov dx,sp;                  ;; storing sp in thread_base_sp  
    mov sp,bp;                  
    mov bp,[bp];
    mov bx,sp;                ;; returning to caller stack
    add bx,02h;
    mov sp,bx;               ;; returning to caller stack  
    
 
    jmp cx;
                  
           
    
    
                  
    create_thread:   
    pop ax;                      ;; AX has the IP
    mov cx,bx;                   ;; CX now, has offset; this should   
    
    
                               
    
    ;;
    ;;                                                  
    ;;    expected control coming from main                     
    ;;    sp ---> main  stack                           
    ;;                                                  
    ;;  
    
    
  
    mov sp,bp;                  ;;
    dec sp;                     ;;
    dec sp;                     ;;
    mov bx,sp;                  ;;
    mov sp,[bx];                ;;  changing stack position
    mov bp,thread_base_sp;      ;;
                                ;;  stack --> thread program stack
    cmp dx,0001h;               ;;    
    je next_line;               ;;
    push cx;                    ;;  push to thread stack ;; CX is free now
    

                                
    ;;
    ;; calculations for thread 1/2/3 stack         
    :; below
    ;;                                             

       
    next_line:
    cmp dx,0001h;           ;; DX if coming from thread
    je back_to_join;        ;; init, would have dx=address
    
                            ;; 
    mov dx,ax;              ;; DX now has the IP
                            ;; 
                            
                            ;; 
    
        
    mov bx, sp     ;          ;; sp --> variable                  ;;     ;; pointing to bp of thread stack
    mov ax, [bx];             ;;  inc thread count !!                  ;;       
    inc ax;
    mov cx,[abc];                                     
    mul cx;          ;;  AX will have 0100, 0200h, 0300 h     ;;
    
          
          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
          ;;                                                  ;;
          ;; calculating offset length for allocating stack   ;;
          ;;                                                  ;;
          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
          
          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
          ;;                                                  ;;
          ;;   creating thread stack                          ;;
          ;;                                                  ;;
          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
          
          
            ;; AX still has 0100h,0200h,0300h basis varible count
 
      
    mov cx,thread_base_sp; ;; DX has sp now !   
    sub cx,ax;             ;;
                           ;; thread base sp -(minus) 0100,0200,0400h
                           ;; AX now has offset that needs to be pushed to thread 1/2 stack  
    

                           ;;
    mov bx,dx;             ;; BX has IP
                           ;;    
                           
                           
    pop ax;                ;; AX carries offset
    mov dx,sp;
    mov sp,cx;             ;; remembering bp of thread stack
                           
    push dx;              ;; 1st push to thread 1 stack
    mov bp,sp;
    push bp;               ;; 2nd push to thread 1 stack 
    push ax;               ;; 3rd push to thread 1 stack
     
    mov cx,sp;
     
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;                                                      ;;
    ;;  moving back to thread program stack to save bp,sp   ;;
    ;;                                                      ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                                              
                           ;;
    mov dx,bx;             ;; DX has IP
                           ;;
                                                              
    mov bx,bp;
    mov bp,[bp]; 
    mov cx,sp;
    inc bx;
    inc bx;
    mov sp,[bx];           
                           ;; 
                           ;; BX has IP
    mov bx, dx;            ;;        
    
    
    push cx;      ;; push to thread program stack
    dec dx;
    dec dx;
    push dx;      ;; push to thread program stack 
    
                           ;;
    mov dx,bx;             ;; DX has IP
                           ;;                             
    
    mov sp,bp
    mov bp,[bp]; 
    inc sp;
    inc sp;
    mov bx,sp;
    mov sp,[bx];  
    
    inc dx;            ;;
    inc dx;            ;;  inc IP by 3 units
    inc dx;            ;;
    jmp dx;
    

    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;      closing off       ;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

           
    
    join:  

                  
    mov DX,0001h;     ;;  setting a flag  ;;
    jmp create_thread;   
    
                      ;; popped in create_thread
                      ;; AX still carries 
                      ;; thread number
                      ;;
                    
    back_to_join:      
                     ;;
                     ;; sp --->thread program
                     ;;
                        
                     ;; 
                     ;; AX carries IP  
                     ;; 
                     
                     ;;
    mov bx,ax;       ;; bx has IP
                     ;;    
    
    pop cx;          ;; cx has return expected flag ? 1 or 0       
    pop ax;          ;; ax has thread number  
    
       ;;  ensure AX after returning from
       ;;  defer run has thread number
       
       ;; Jumping, 
       ;; ax carries thread number
       ;; bx carries IP    
       ;; cx carries return expected flag !!
       
    jmp defer_run;                
                  
    mov dx,ax;    
    mov cx,04h;   
    mul cx;                 ;; result is in AX
       
                     ;;
    mov dx,bx;       ;; bx has IP
                     ;;
    
                    
    mov bx,sp;
    sub bx,ax;
    mov bp,[bx];      ;;
    inc bx;           ;; sp ---> thread1/2 stack
    inc bx;           ;;
    mov sp,[bx];      ;;
    
             
    
    
    ;;
    ;; let's fetch the program function 
    ;; address in main stack
    ;;
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;                                             ;;
    ;;  calculating address for program addresss   ;;
    ;;                                             ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    
   
   mov bx,sp;  ;; storing offset
   mov cx,[bx];
   mov bx,[bp];  ;; now, bs has
   mov bx,[bx];  ;; bp of main now
   sub bx,cx;
   mov bx,[bx];  ;; now bx has 
                 ;; the program address
                 ;; 
                 
                 
        
    jmp start_1; 
    
    defer_run:      
    
    ;; defer is to check
    ;; dependency of new thread
    ;; onto results of previous thread output
    
    
    ;;
    ;; sp----> thread program stack
    ;; old config
    ;;  i.e  sp ---> variable 
    
    ;; ax carries thread number
    ;; bx carries IP    
    ;; cx carries return expected flag !! 
    
    mov dx,bx;   ;; dx carries IP
    
    mov sp,bp;
    mov bp,[bp];
    mov bx,sp;
    inc bx;
    inc bx;
    mov sp,[bx];               
    
    ;;
    ;; sp---> main stack   
    
    
    
    loop:
   
    ;;
    ;; this loop is supposed
    ;; to do round of checks in main
    ;; 
    ;; checks: 
    ;; 1. whether status of 
    ;;  return expected flag is 0 or 1
    ;;
    ;; 2. whether next thread join, create 
    ;; thread is present ?
    ;;
    ;; 3. if yes, execute them.
    ;; 4. if 1 is '1', checks, if new
    ;; threads depend on output of previous threads
    ;;
    
    mov bx,dx;   bx carries IP
    
    1st_check: 
    push 1st_check_end;
    cmp cx,0;    
    je here_1:    
    here_1:    
    
    
    
    
    
             ;;
    jmp bx;  ;; bx --> address pointer
             ;; 
    
    mov [bx],bl;         
    cmp bl, 0Bh;
    
    
      
    1st_check_end:
    nop;
   
  
 
    
    
     
    
    ;;
    
    
    
   
    
    
    
    
    
       
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;let's see which variable count is it ;;; 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                                  
                                                  
                                                  
                                                  
                                                
    
    error:
    int 21h; [do this later]
    
  
              

end start_1 
ret


