
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
    push 00;   
    mov IPREG,[dx]; 
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

end start_1










;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;

name "thread"
.model tiny
org 100h

.data
    abc dw 100h;    
    thread_base_sp dw 0000h; 
    var_a dw 00h;
    flag dw 00;
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;                                                                                         ;;
    ;; can handle max 16*16 threads, notice abc. Result of mul ax is in ax only, thus, 16*16   ;;
    ;;                                                                                         ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
   
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





;;;
;;; way to get to calling function sp,bp
;;; mov to bp
;;; pop bp;
;;; pop sp;
;;;        


 
.code  
org 100h                
start:                   



    main_line_1:
     
    main_init:
    push sp;  
    push bp;     
    main_init_stack_calc:
    mov bp,sp; 
    main_stack_calc:
    jmp thread_init;    ;; alternative for pthread t1 
      
    
    
    main_line_2:       
    push DX;            ;;storing sp of thread stack
    push program;       ;; alt for thread_create(function addr) 
    jmp create_thread;  ;; alt for thread_create(function addr)
    
    
    push 01;   ;; 01 is code for 1st thread 
    jmp join; 
        
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;                                                      ;;
    ;;   structure of main stack                            ;;
    ;;                                                      ;;
    ;;                            high addresses          ;;
    ;;                                                      ;;
    ;;                                                      ;;
    ;;     %program                                         ;;
    ;;     thread  sp                                       ;;
    ;;     caller's bp  ----> bp                            ;;
    ;;     callers' sp             low addresses            ;;
    ;;                                                      ;;
    ;;                                                      ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        
    
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;     structure of thread program stack                ;;
    ;;                                                      ;;
    ;;                                                      ;;
    ;;                               high addresses       ;;
    ;;                                                      ;;
    ;;                                                      ;;
    ;;  thread1 bp                                          ;;
    ;;  thread1 sp                                          ;;
    ;;  variable                                            ;;
    ;;  caller's bp --> bp ---> thread base sp              ;;
    ;;  caller's sp                                         ;;
    ;;                                                      ;;
    ;;                               low addresses        ;;
    ;;                                                      ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
    
    
    
    thread_init:
   
    thread_init_stack_calc: 
    push sp;
    mov sp,bp;                  ;; just checking here if 
    sub sp,10h;                 ;; thread stack has
    mov bx,sp;                  ;; already been created ?
    cmp [bx],0h;                ;; offsetting 
    jne back_to_create_thread;
    
    cmp [bx],0h;                ;; error
    je  error;                  ;; error
    
    pop  dx;                    ;; back to caller sp        
    push dx;                   ;; push to thread program stack
    push bp;                   ;; push to thread program stack
    mov bp,sp;
    
    mov thread_base_sp, sp;
    push 0;                       ;;push to thread program stack
    mov dx,sp;                          ;;storing sp in thread_base_sp  
    mov sp,bp;                           ;; ADDED TGUs
    mov bp,[bp];
    mov dx,sp;
    add dx,02h;                ;; returning to caller stack
    mov sp,[dx];               ;; returning to caller stack  
    cmp [bx],0h;
    
    jmp main_line_2;
                  
    
    
    
                  
    create_thread:   
    jmp thread_init_stack_calc; ;; stack calculation routine
                                ;; stack calcualtion routine
    back_to_create_thread:   
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;                                                  ;;
    ;;    expected coming from main                     ;;
    ;;    sp ---> main  stack                           ;;
    ;;                                                  ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     
    pop bx;                     ;;
    add bx,02h;                 ;;   changing stack position
    mov bp,thread_base_sp;      ;;
    mov sp,[bx];                ;;   changing stack position
                                ;;    
                                
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                            
    ;; calculations for thread 1/2/3 stack         ;;
    ;;                                             ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
    
    cmp dx,0001h;           ;; DX if coming from thread
    je back_to_join;        ;; init, would have dx=address
        
    mov bx, sp     ;          ;; sp --> variable                  ;;     ;; pointing to bp of thread stack
    mov ax, [bx];             ;;  inc thread count !!                  ;;    
    cmp ax,0001h;
    je skip_line;    
    inc ax;
    skip_line: 
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
 
      
    mov cx,thread_base_sp;    
    sub cx,ax;   
    cmp [bx],0;
    push sp;           ;; thread base sp -(minus) 0100,0200,0400h
    mov sp,cx;         ;; remembering bp of thread stack
    
    pop dx;
    mov sp,cx;
    push [dx]          ;; 1st push to thread 1 stack
    push bp;           ;;2nd push to thread 1 stack
    mov bp,sp;
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;                                                      ;;
    ;;  moving back to thread program stack to save bp,sp   ;;
    ;;                                                      ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                                              
                                                              
    mov dx,bp;
    mov bp,[bp];
    add dx,02h;
    mov sp,[dx];
    
    push [dx];      ;; push to thread program stack
    push [dx];      ;; push to thread program stack

    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;      closing off       ;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

           
    
    join: 
    pop ax;   
    mov DX,0001h;   ;;  setting a flag  ;;
    mov flag,1;
    jmp create_thread; 
     
    back_to_join:
    
    cmp ax;
    mov cx,02h;
    mul cx;      ;; result is in AX    
    
    ;; let's fetch the program function address
    
    mov bx,[bp];
    dec bx;         ;; fetching program address
    sub bx,ax;      ;; fetching program address
    mov bx,[bx];    ;;fetched program address
    
    mov dx,bx;      ;; storing bx address to dx
    
    mov bx,sp;      ;;
    sub bx,ax;      ;;
    dec bx;         ;; now sp ---> thread 1/2/3 sp
    mov bp, [bx];   ;;
    inc bx;         ;;
    mov sp,[bx];    ;; 
    
         ;; DX still holds the address program
        
    jmp start_1;
    
    
   
    
    
    
    
    
       
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;let's see which variable count is it ;;; 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                                  
                                                  
                                                  
                                                  
                                                
    
    error:
    int 21h; [do this later]
    
  
               

end start 
ret


