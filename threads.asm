
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
   ;;  ;;                              ;;   -400 h     \  ;;    thread 2 stack            ;;         ;;
   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; --------------  ;;                              ;;         ;;
   ;;          |                           from bp     /  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;         ;;
   ;;          |   -200 h   from bp      \                                                            ;;       ;;
   ;;          |                          \                                                          ;;
   ;;          |                           \ -300h from bp                                                        ;;
   ;;         \|/                           \                                                        ;;
   ;;                                        \|                                                      ;;
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




    main_line_1:
     
    main_init:
    push sp;  
    push bp;     
    main_init_stack_calc:
    mov bp,sp;    
    push l_m1;                ;; loading return addr
    l_m1:  
    jmp thread_init;      ;; alternative for pthread t1 
    ;; (return  in DX) 
    
    


    main_line_2:

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; below does :                               ;;
    ;;                                            ;;
    ;;  (main stack)                              ;;
    ;; l_m2                                       ;;
    ;; %program                                   ;;
    ;; dx -->thread program sp                    ;;
    ;; bp                                         ;;
    ;; sp                                         ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; position of:                               ;;
    ;;                                            ;;
    ;;  (thread program stack)                    ;;
    ;;                                            ;;
    ;;                                            ;;
    ;; int     <------sp                          ;;
    ;; bp                                         ;;
    ;; sp                                         ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      
    push DX;            ;;  3rd push to main stack
    push program;       ;; 4th push to main stack  
    sub bx, sp;         ;; random value for now;; I do not understand this;; will recall later calculating Offset, so that we can push to thread ;;1/2/ stack
    push l_m2;          ;; 5th push to main stack
    l_m2:                             
    
                      ;; JMP carries arguments
                      ;; bx carries offset
                      
    jmp create_thread;  ;; alt for thread_create(function addr) 
    
    
                        ;; bx holds the value of offset 
    
    main_line_3:
    push join; ;; offset for create_thread
    push create_thread;          ;; offset for join
    push 01;            ;; push to main stack  01 is code for 1st thread   
    push 0;             ;; return expected flag ?
    push l_m3;
    l_m3:
    jmp join; 
        
    
    main_line_4:
    main_line_5:
    main_line_6:
  
         
         
         
         
    ;(expects return addr in stack)
    ;(returns value of sp in DX)

    thread_init: 
    pop cx;    CX has the return addr
    inc cx;    inc CX
    inc cx;    by 3 moves address 
    inc cx;    ahead by 3 units ;;
    
    thread_init_stack_calc: 
    mov dx, sp;
    mov sp,bp;                  ;; just checking here if 
    sub sp,10h;                 ;; thread stack has
    mov bx,sp;                  ;; already been created ?
    cmp [bx],0000h;
    jne handle_error_init_stack; ;; error handling

                                ;; dx is free now
    push dx;                    ;; 1st push to thread program stack
                                ;; 
    push bp;                    ;; 2nd push to thread program stack
    mov bp,sp;                  ;; SP ---> thread program bp
                                                            
                                                            
    mov thread_base_sp, sp;
    push 0;                     ;; 3rd push to thread program stack
    mov dx,sp;                  ;; storing sp in thread_base_sp  
    
                                ;; dx carries sp of thead program stack
                                ;; cx carries return addr 
                                ;; bx free
                                ;; ax free ! 
    ;; let's create alt_space
    ;;
    mov bx,bp;
    sub bx,10h;
    push dx;                    ;; 1st push to alt_space
    push bp;                    ;; 2nd push to alt_space
    mov bp,sp; 

    ;;
    ;; now, move back to program stack
    ;; and save alt_space config
    
    mov sp,bp; 
    mov bp,[bp];                 ;; dx carries sp of thead program 
    mov bx,sp;                   ;; cx carries return   addr 
    inc bx;                      ;; bx carries sp of alt_space
    inc bx;                      ;; ax free ! 
    mov sp,[bx];
    dec bx;
    dec bx;
    push bx;                     ;; 4th push to program stack
    push bx;                     ;; 5th push to program stack
        
    ;;
    ;; stack --> program stack

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; status 
	;; (alt_space)
	;;
	;;	
	;; bp  <---sp
	;; sp
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; status 
	;; (program stack)
	;;
	;;
	;; alt_space bp <----- sp
	;; alt_space sp
	;; int
	;; bp
	;; sp
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
 
    ;; let's return to caller main stack
    mov sp,bp;                  
    mov bp,[bp];
    mov bx,sp;                ;; returning to caller stack
    add bx,02h;
    mov sp,[bx];               ;; returning to caller stack  
                                
                                ;; dx carries sp of thread program stack
                                ;; cx carries return addr 
                                ;; bx free
                                ;; ax free ! 
 
    jmp cx;   ;; (passes value of sp in DX)
              ;; (so that  it can be pushed
              ;;  on main stack )
                  
           
    ;;
    ;;
    ;;( expects args from caller)
    ;; bx carries offset
    ;;

    create_thread:   
    pop ax;                      ;; AX has the return addr/IP
    inc ax;                      ;; 
    inc ax;                      ;; incrementing AX by 3 units
    inc ax;                      ;; so, return addr has address of next label    
                              
    mov cx,bx;                   ;; cx now, has offset; 
    
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
    

                                
    ;;
    ;; calculations for thread 1/2/3 stack         
    :; below
    ;;                                             

       
    next_line:
    cmp dx,0001h;           ;; DX if coming from thread
    je back_to_join;        ;; init, would have dx=address
    
                            ;; ax free !
    mov dx,ax;              ;; DX now has the return addr/IP
                            ;; cx still carries offset
                            
                            ;; 
    
        
    mov bx, sp     ;          ;; sp --> alt_space;;     ;; pointing to bp of thread stack
    inc bx;
    inc bx;
    inc bx;
    inc bx;                   ;; sp--> variable  
    mov ax, [bx];             ;;  inc thread count !!                  ;;  
    
                              ;; cx free
    mov bx,cx;                ;; bx carries offset now
    mov cx,[abc];                                     
    mul cx;          ;;  AX will have 0000,0100, 0200h, 0300 h     ;;
    
          
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
          
          
            ;; AX still has 0000h,0100h,0200h basis varible count
 
    
    add ax,0500h;          ;; each thraad
                           ;; allocated ff space !         
    
    mov cx,thread_base_sp; ;;    
    sub cx,ax;             ;;
                           ;; thread base sp -(minus) 0500,0600,0700h
                           ;; AX now has offset that needs to be pushed to thread 1/2 stack  
    

                           ;;
                           ;; BX has offset
                           ;; DX carries return addr/IP  
                           ;; CX still carries thread1/2/3 address
    
    mov ax,dx;             ;; ax carries return addr/IP now
                           ;; dx free !
 
    mov dx,sp;             
    mov sp,cx;             ;; sp----> thread sp
                           
    push dx;               ;; 1st push to thread 1 stack
    push bp;               ;; 2nd push to thread 1 stack
    mov bp,sp;             ;;
    push 0;                ;; 3rd push to thread 1 stack // we could have pushed offset bx too !, but we did not ! we can change this
    
    mov dx,ax;            ;; DX carries return addr/IP
                          ;; BX carries offset

     
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;                                                      ;;
    ;;  moving back to thread program stack to save bp,sp   ;;
    ;;                                                      ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
   
                                                              
                           ;; DX carries return addr/IP
    mov ax,bx;             ;; AX has offset
                           ;; BX free !
    mov cx,sp;             ;; CX carries sp                                                          
    mov bx,bp;             ;; BX carries BP
    mov bp,[bp];    
    inc bx;
    inc bx;
    mov sp,[bx];     
        
	;;
	;;  sp ---> thread program
	;;
	;;


        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; thread program stack               ;;
        ;;                                    ;;
        ;;                                    ;;
	;; alt_space_bp  <----- sp            ;;
	;; alt_space sp                       ;;
	;; int                                ;;
	;; bp                                 ;;
        ;; sp                                 ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;;
   ;; let's move to thread_program__alt_space
   ;; will update program stack with address
   ;;  of alt_space

				;; CX carries sp                                                          
    				;; BX carries BP
 				;; this needs to be pushed to alt_space   
   
   pop bp;       ;;
   pop sp;       ;; stack -->alt space sp
   
 	 ;; moved to alt_space
 	 ;; sp--> alt_space
 	 ;; 

  push cx;          ;; push to alt_space
  push bx;          ;; push to alt_space
    
    ;;
    ;; moving to caller stack
    ;; moving to thread_program
  
  mov cx,sp;     ;; cx carries sp of alt_space new
  mov bx, bp;    ;;   bx carries bp of alt_space
  mov bp,[bp];
  inc bx;
  inc bx;
  mov sp,[bx];    ;; sp---> thread program stack
  
  ;;
  ;; updating alt_space
  ;; in program stack

  inc sp;
  inc sp;
  inc sp;
  inc sp;
  push cx;       ;; push / repush to program stack
  push bx;      ;;  program stack
                ;;
		;; |---------------| 
		;; | bp alt_space  |  <----- sp
		;; | sp alt_space  | (updated)
		;; |---------------|
		;;  variable
		;;  bp
		;;  sp
                           ;; 
                           ;; DX has return addr/IP
                           ;; AX has offset 

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; alt space bp,sp updated !!     ;;                       
    ;;                                ;;  
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; moving to caller stack
    ;; moving to main 

    mov sp,bp
    mov bp,[bp]; 
    inc sp;
    inc sp;
    mov bx,sp;
    mov sp,[bx];           ;; DX has return addr/IP
                           ;; AX has offset 
    
    jmp dx;
    

    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;      closing off       ;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

           
    
    join:  

                  
    mov DX,0001h;     ;;  setting a flag  ;;
    jmp create_thread;   
    
                      ;; popped in create_thread
                      ;; AX still carries 
                      ;; return address
                      ;;
                    
    back_to_join:      
                     ;;
                     ;; sp --->thread program
                     ;;(old config)
                        
                     ;; 
                     ;; AX carries return address
                     ;; 
                     
                     ;;
    mov bx,ax;       ;; bx has return address
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
    
    ;;queueing join
    

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

                    
    ;; 
    ;; finding thread program stack 
    ;; new config   
    ;;                               


    dec sp;
    dec sp;
    dec sp;
    dec sp;
    
    mov bx,sp;
    mov bx,[bx];       ;;
    mov sp,bx;         ;;
    inc sp;            ;;
    inc sp;            ;;  
    mov bx,sp;         ;;
    mov sp,[bx];       ;;
                       ;;
    
    ;;
    ;;
    ;;  sp --> thread program stack
    ;; (new config)
    ;; 

 
    
    push ax;       ;  push to 
    push bx;       ;  thread program stack 
     
                    ;; checking 
                    ;; ax meets variable count  
                    
    
    mov bx,sp;      ;
    add bx,04h;     ; cx -> return expected flag
    cmp ax,[bx];    ; ax- > saved to stack
    jg handle_error;; bx -> saved to stack
    jle continue;   ;
    
    continue:                                    
    pop bx;         ; retrieving regs
    pop ax;         ; retrieving regs    
    
  
    mov dx,bx;      ;dx carries IP
    
    mov sp,bp;
    mvo sp,[bp];
    dec sp;
    dec sp;
    mov bx,sp;
    mov sp,[bx];     
    
    
    ;;
    ;;
    ;;  sp --> thread program stack
    ;; (old config)
    ;;     
    ;;  sp--->varible   
     
    ;; ax carries thread number
    ;; dx carries IP    
    ;; cx carries return expected flag !!  

    
    mov sp,bp;
    mov bp,[bp];
    mov bx,sp;
    inc bx;
    inc bx;
    mov sp,[bx];               
    
                     ;;
                     ;; sp---> main stack   
                     ;;

    
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
    ;;
    ;; 4. if 1 is '1', checks, if new
    ;; threads depend on output of previous threads
    ;;
    
    mov bx,dx;   bx carries IP    
           
    ;; ax carries thread number
    ;; bx carries IP    
    ;; cx carries return expected flag !!  
    
    
    1st_check:               ;;
    push 1st_check_end;      ;; push to main stack
    cmp cx,0;                
    je here_1:               ;; checking cx, return
                             ;; expected flag 
    
     
    push cx;                 ;; push to main stack
    push bx;                 ;; push to main stack
    push ax;                 ;; push to main stack   
    
    
    here_1: 
    push here_1;             ;; push to main stack 

    
                             ;; ax,bx,cx are free now
                             ;; bx still has ip
    
             ;;
             ;; bx --> address pointer
             ;; 
   
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          
   ;;                                                   ;;
   ;;                               high addresses      ;;
   ;;  main stack                                       ;;
   ;;                                                   ;;
   ;;   here_1                                          ;;
   ;;   ax                                              ;;
   ;;   bx                                              ;;
   ;;   cx                                              ;;                                          ;;
   ;;   1st_check_end                |---|              ;;
   ;; |--------------------------|   |   |              ;;
   ;; |  ip                      |   |  \|/             ;;
   ;; |  return expected flag    | --|   popped         ;;
   ;; |  thread number           |                      ;;
   ;; |--------------------------|                      ;;
   ;;   offset threadinit                               ;;
   ;;   offset join                                     ;;
   ;;   return value       <----sp                      ;;
   ;;   arg2                                            ;;
   ;;   arg1                                            ;;
   ;;   %program                                        ;;
   ;;   thread program sp                               ;;
   ;;   bp                                              ;;
   ;;   sp                                              ;;
   ;;                                low addresses      ;;
   ;;                                                   ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
    
    ;;
    ;; comparison table below 
    ;;  
      
    
    mov dx,[bx];                   
    and dl,F0h; 
    
    cmp dl,0xB;  
    jmp handle_b_inst_set;
    cmp dl,0x8;
    jmp handle_8_inst_set; 
    cmp dl,0xC;
    jmp handle_c_inst_set;  
    cmp dl,0x6;
    jmp handle_6_inst_set;
    cmp dl,0x5;
    jmp handle_5_inst_set;
    cmp dl,0x7;
    jmp handle_7_inst_set;
    cmp dl,0xE;
    jmp handle_e_inst_set;
    
    
    handle_b_inst_set:              ;;
    mov dx,[bx];                    ;;
    and dl,0Fh;                     ;;
                                    ;;
    cmp dl,0x8;                     ;;
    mov dx,1111h;                   ;; handle for B
    je end_handle_b_inst_set;       ;;
    mov dx,1111h;                   ;;
    cmp dl,0x9;                     ;;
    je end_handle_b_inst_set;       ;;    mov reg
    mov dx,1111h;                   ;;
    cmp dl,0xA;                     ;;
    je end_handle_b_inst_set;       ;;
    mov dx,1111h;
    cmp dl,0xB;
    
    end_handle_b_inst_set:          ;;
    cmp dx,1111h;                   ;;
    je line2;                       ;;
    line1:                          ;;  handle for B (contd)
    add bx,03h;                     ;;
    jmp line3;                      ;;
    line2:                          ;;    mov reg
    add,05h;                        ;;
    line3:                          ;;
    pop dx;                         ;;
    jmp dx; 
                                    ;;
    handle_8_inst_set:              ;;
    jmp end_handle_8_inst_set;      ;;
                                    ;;  handle for 8
    end_hendle_8_inst_set:          ;;
    add bx,02h;                     ;;
    pop dx;                         ;;   mov reg,reg
    jmp dx;                         ;;

    
    handle_c_inst_set:              ;;
    jmp end_handle_c_inst_set;      ;;
                                    ;;  handle for C
    end_handle_inst_set:            ;;
    add bx,06h;                     ;;   mov [bx]
    pop dx;                         ;;
    jmp dx;
    
                                   ;;
    handle_6_inst_set:             ;; handle for 6
    mov dx,[bx];                   ;;
    and dl,0Fh;                    ;;   push a
                                   ;;   push data 
                                   ;;
    cmp dl,0x00;                   ;; handling address
    add bx,01h;                    ;; offset before 
    jmp end_handle_6_inst_set ;    ;; prior to end_handle...
    cmp dl,0x08;                   ;;
    add bx,03h;                    ;;  
    jmp end_handle_6_inst_set;     ;;  
    cmp dl,0xA;                    ;;
    add bx,02h;
    jmp end_handle_6_inst_set;  
    
    end_handle_6_inst_set:
    pop dx;
    jmp dx;      
    
    handle_5_inst_set:             ;;
    jmp end_handle_5_inst_set:     ;;
                                   ;;  handle for 5
    end_handle_5_inst_set:         ;;
    add bx,01h;                    ;;  push reg
    pop dx;
    jmp dx;
 
    
    handle_7_inst_set:             ;;
    mov dx,[bx];                   ;;
    and dl,0fh;                    ;;
                                   ;;
    cmp dl,0x04;                   ;;
    je end_handle_7_inst;          ;;  handle for 7
    cmp dl,0x05;                   ;;
    je end_handle_7_inst;          ;;
    jmp end_handle_7_inst_set;     ;;
    cmp dl,0x0c;                   ;;   jg,jl,je,jne         
    je end_handle_7_inst;          ;;
    cmp dl,0x0f;                   ;;
    je end_handle_7_inst;          ;;
                                   ;;
    end_handle_7_inst_set:         ;;
    add bx,02h;
    pop dx;
    jmp dx;
             
                                   ;;
    handle_e_inst_set:             ;;
    mov dx,[bx];                   ;;
    and dl,0fh;                    ;;
                                   ;;
    cmp dl,0x0b;                   ;;
    jmp eb_detected;               ;;  handle for e
    
    eb_detected:                   ;;
    jmp check_offset;
    check_offset:                  ;;
    mov dx,[bx];                   ;; dh has signed offset
    push bx;                       ;; push to main stack
    inc bx;                        ;;
    inc bx;                        ;;
    mov cx,bx;                     ;;
    mov bx,join;                   ;;
    sub bx,cx;                     ;;
    cmp bl,dh;                     ;;
    je join_detected;              ;;
    pop bx;                        ;;
    jmp end_handle_e_inst_set;     ;;
    join_detected;                 ;;   
    pop bx;                        ;;
    jmp exectute_main ;            ;;
                                   ;;
                                   ;;
    end_handle_e_inst_set:         ;;  
    add bx,02h;                    ;;
    pop dx;                        ;;
    jmp dx;                        ;;
                                   ;;  
                                    
                                   
                                   ;;
    handle_3_inst_set:             ;;
    mov dx,[bx];                   ;;
    and dl,0x0f;                   ;;  handle for 3
                                   ;;
    cmp dl,0x09;                   ;;  cmp
    jmp end_handle_3_inst_set;     ;;
    cmp dl,0x0b;                   ;;
    jmp end_handle_3_inst_set;     ;;
                                   ;;
    end_handle_3_inst_set:         ;;
    add bx,02h;                    ;;
    pop dx;
    jmp dx;
    
                               
                                   
    handle_nop:                    ;;
    jmp end_handle_nop;            ;;
                                   ;;  handle for 9 nop
    end_handle_nop:                ;;
    add bx,01h;                    ;;
    pop dx;
    jmp dx;
    
    
    end
                          
    1st_check_end:
    nop;
   
       
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;let's see which variable count is it ;;; 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                                  
                                                                                             
    
    error:
    int 21h; [do this later] 
    
    execute_main:
     
    
    handle_error: 
    pop bx;        ; retrieving regs
    pop ax;        ; retrieving regs  
    
    
    mov sp,bp;
    mov bp,[bp];  
    inc sp;
    inc sp;
    jmp [bx];
    
    jne handle_error_init_stack:
    nop;  [do this later]
  
              

end start_1 
ret


