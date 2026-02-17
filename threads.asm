
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
    
    
    
   
    abc dw 0x7f;    
    thread_base_sp dw 0000h; 
    var_a dw 00h;
    flag dw 00;

    defer_args:

    case_50_50_50  0x00;
    case_xx_xx_60 0x00;
    case_xx_xx_50 0x00;
    case_xx_60_50 0x00;
    case_xx_50_50 0x00;
    case_xx_50_60 0x00;

    rfa_1   0x00;
    rfa2   0x00;
    replay         0x00;
    replay_capturing_args 0x00;
    replay_capturing_result 0x00;
    push_type;  0x00;
                         
    join_detected  0x00
    thread_no   0x00
    arg1        0x00        
    arg2        0x00
    return_val  
    return_expected
    d_ax
    d_bx
    d_cx
    d_dx
   
  
    
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
   ;;  ;;           main stack         ;;              _  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        ;;
   ;;  ;;                              ;;              /| ;;    alt_space                  ;;        ;;
   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;             /   ;;                               ;;        ;;
   ;;          |                                     /    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        ;;
   ;;          |                                    /
   ;;          |                                   /                                                 ;;
   ;;          |   -10h from bp                   / -10h from bp                                     ;;
   ;;         \|/                                /                                                   ;;
   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ------/                                                    ;;
   ;;  ;;  thread program base stack   ;;                 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;         ;;
   ;;  ;;                              ;;   -580 h     \  ;;    thread 2 stack            ;;         ;;
   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; --------------  ;;                              ;;         ;;
   ;;          |                           from bp     /  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;         ;;
   ;;          |   -200 h                \                                                           ;;       
   ;;          |   from bp                \                                                          ;;
   ;;          |                           \ -500h from bp                                           ;;
   ;;         \|/                           \                                                        ;;
   ;;                                       _\|                                                      ;;
   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                 ;; 
   ;;  ;;        queue                 ;;       ;;     thread 1 stack             ;;                 ;;
   ;;  ;;                              ;;       ;;                                ;;                 ;;
   ;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                 ;;                                      ;;;;                                                                                                ;;
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

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;     structure of alt_space                           ;;
    ;;                                                      ;;
    ;;                                                      ;;
    ;;                               high addresses         ;;
    ;;                                                      ;;
    ;;  thread2 bp                                          ;;
    ;;  thread2 sp                                          ;;
    ;;  thread1 bp                                          ;;
    ;;  thread1 sp                                          ;;
    ;;  caller's bp                                        ';;
    ;;  caller's sp                                        ';;
    ;;                                                      ;;
    ;;                               low addresses          ;;
    ;;                                                      ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 


    main_line_1:
     
    main_init:
    push sp;                    ;; push to main stack
    push bp;                    ;; push to main stack
    main_init_stack_calc:
    mov bp,sp;    
    push l_m1;                ;; push to main stack;;loading return addr
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
      
    
    push program;       ;; 4th push to main stack  
    push arg1;          ;; push to main stack
    push arg2;          ;; push to main stack
    push l_m2;          ;; 5th push to main stack
    l_m2:                             
    
                      ;; JMP carries arguments
                      ;; bx carries offset
                      
    jmp create_thread;  ;; alt for thread_create(function addr) 
    
    
                        ;; bx holds the value of offset 
    
    main_line_3:
    push join; ;; for calculating offset for join
    push create_thread;   ;; for calculating offset for create_thread 
    push 01;              ;; push to main stack  01 is code for 1st thread   
    push 0;               ;; return expected flag ?
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
    
    for_update_of_bpsp_in_alt_space:
    dec dx;
    dec dx;
    dec dx;
    dec dx;   ;; (sp---> thread_base_sp -2)
              ;; (new config)

    mov bx,bp;
    sub bx,10h;
    push dx;                    ;; 1st push to alt_space
    push bp;                    ;; 2nd push to alt_space
    mov bp,sp; 

    ;;
    ;; now, move back to program stack
    ;; and save alt_space config
    
    mov sp,bp; 
    mov bp,[bp];                 ;; dx carries sp of thead program (old)
    mov bx,sp;                   ;; cx carries return   addr 
    inc bx;                      ;; bx carries sp of alt_space
    inc bx;                      ;; ax free ! 
    mov sp,[bx];
    
    dec bx;
    dec bx;

    reverse_of_for_update_of_bpsp_in_alt_space: 
    				;;(see 10 lines above)
    inc sp;      ;;
    inc sp;      ;;
    inc sp;      ;;  reverse of above
    inc sp;      ;; 
    

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
	;; (new config)
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
                                ;; (old)

                                ;; cx carries return addr 
                                ;; bx free
                                ;; ax free ! 
    push dx;                    ;; 3rd push  to main stack
                                ;; (old)

    jmp cx;   ;; (passes value of sp in DX)
              ;; (so that  it can be pushed
              ;;  on main stack )
                  
           
    ;;
    ;;
    ;;( expects args from caller)
    ;; bx carries offset
    ;;



   	 ;; (expects args in bx) 
    	 ;;

    create_thread:   

    pop ax;                      ;; AX has the return addr/IP
    inc ax;                      ;; 
    inc ax;                      ;; incrementing AX by 3 units
    inc ax;                      ;; so, return addr has address of next label    
    
    cmp dx,0001h;
    je next_line_0;                          
    mov cx,bx;                   ;; cx now, has signed offset; 
    
    ;;                                                  
    ;;    expected control coming from main                     
    ;;    sp ---> main  stack                           
    ;;                                                  
    ;;  

    next_line_0:
    mov sp,bp;                  ;;
    dec sp;                     ;;
    dec sp;                     ;;
    mov bx,sp;                  ;;
    mov sp,[bx];                ;;  changing stack position
    mov bp,thread_base_sp;      ;;
                                ;;  stack --> thread program stack
    cmp dx,0001h;               ;;    (old config)
    je next_line;               ;;
                             
    ;;
    ;; calculations for thread 1/2/3 stack         
    :; below

                         ;;                          
                         ;; (forwarding old config to jmp back_to_join)
                         ;;

    next_line:
    cmp dx,0001h;           ;; DX if coming from thread
    je back_to_join;        ;; init, would have dx=address
    
                             
    ;;
    ;; let's move stack to thread program (new config)
    
    dec sp;
    dec sp;
    dec sp;
    dec sp;
         	 ;;
   	 	 ;;  stack --- > thread program stack
   	 	 ;;   (new config)

                            ;; ax free !
    mov dx,ax;              ;; DX now has the return addr/IP
                            ;; cx still carries signed offset
                            ;;(cx needs to be pushed to thread1/2 stack)

          
    mov bx, bp     ;          ;; sp --> alt_space;;    
    dec bx;                   ;; ( pointing to bp of thread stack)
    dec bx;                   ;; sp--> variable  
    mov ax, [bx];             ;; ax carries count 
    
                              ;; cx free
    mov bx,cx;                ;; bx carries signed offset now
    mov cx,[abc];             ;; dx carries return addr                        
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
                           ;; allocated 7ff = 127 bytes space !         
    
    mov cx,thread_base_sp; ;;    
    sub cx,ax;             ;;
                           ;; thread base sp -(minus) 0500,0600,0700h
                           ;; AX now has offset that needs to be pushed to thread 1/2 stack  
    

                           ;;
                           ;; bx carries signed offset
                           ;; dx carries return addr/IP  
                           ;; CX still carries thread1/2/3 address
    
    mov ax,dx;             ;; 
                           ;; dx<------> ax
                           ;; (interchange)
    mov dx,sp;             
    mov sp,cx;             ;; sp----> thread sp
                           
    push dx;               ;; 1st push to thread 1 stack
    push bp;               ;; 2nd push to thread 1 stack
    mov bp,sp;             ;;

                           ;; bx carries signed offset
                           ;; ax carries return addr/IP  
                           
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;                                           ;;
	;; calculation for signed offset now         ;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
                          ;;
                          ;; sp--->thread1/2 stack

    mov dx,bx;            ;; bx <---> dx  
                          ;; bx free!           
                          ;; dx carries signed offset
                          ;; cx bx free !
                          ;; ax carries return addr

    mov bx,[bp];          ;;  bx ---- > thread program bp
    mov bx,[bx];          ;; bx--- > main stack bp
    
    add bx,dx;
    mov bx,[bx];          ;; bx----> %program


    push bx;              ;; 3rd push to thread1/2 stack
                          
                          ;; dx free !
    mov dx,ax;            ;; dx carries return addr/IP
                          ;; ax free

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;                                                      ;;
    ;;  moving back to thread program stack to save bp,sp   ;;
    ;;                                                      ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
   
                                                                         
                           
    mov cx,sp;             ;; CX carries sp                                                          
    mov bx,bp;             ;; BX carries BP
    mov bp,[bp];           ;; dx carries return addr/IP
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
                                ;; dx carries return addr/IP
   pop bp;       ;;
   pop sp;       ;; stack ---->alt space sp

         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
 	 ;; sp----> alt_space               ;; 
         ;;                                 ;;
 	 ;; moved to alt_space              ;;
 	 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

  push cx;          ;; push to alt_space
  push bx;          ;; push to alt_space
                    ;; cx free
                    ;; bx free 
    ;;
    ;; moving to caller stack
    ;; moving to thread_program
  
  mov cx,sp;        ;; cx carries sp  alt_space new
  mov bx, bp;       ;;  bx carries bp  alt_space
  mov bp,[bp];      ;; dx carries return addr/IP
  inc bx;
  inc bx;
  mov sp,[bx];    ;; sp---> thread program stack (new config)
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; updating alt_space                 ;;
  ;; in program stack                   ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  inc sp;
  inc sp;
  inc sp;
  inc sp;
  
  push cx;       ;; push / repush to program stack
  push bx;       ;; push /repush to program stack

                ;;  program stack
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
                           ;; 

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; alt space bp,sp updated !!     ;;                       
    ;;                                ;;  
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
   ;;
   ;; incrementing variable 
   ;;
   ;;
   ;; variable ---> +1


   mov bx,sp;
   add bx,04h;
   inc [bx];
    ;;
    ;; moving to caller stack
    ;; moving to main 

    mov sp,bp
    mov bp,[bp]; 
    inc sp;
    inc sp;
    mov bx,sp;
    mov sp,[bx];           ;; DX carries return addr/IP
                           
    pop ax;
    pop bx;

    jmp dx;
    
    

    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;      closing off       ;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

           
    
    join:  
          
    
    mov DX,0001h;     ;;  setting a flag  ;;
    mov cx,sp;        ;;  cx has sp  of main
                      ;; Only cx is going 
                      ;;  to be free register
                      ;; create_thread
  
    jmp create_thread;   
    
                      ;; popped in create_thread
                      ;; AX still carries 
                      ;; return address
                      ;;
                    
    back_to_join:      
                     ;;
                     ;; sp --->thread program
                     ;;(old config)  --- > variable
                        
                     ;; 
                     ;; AX carries return address
                     ;; 
                     
                     ;; bx <--------> ax
    mov bx,ax;       ;; bx has return address
                     
 
    mov sp,cx;       ;; bx carries return addr
    pop dx;          ;; dx carries return expected flag ? 1 or 0       
    pop ax;          ;; ax carries thread number   
    
    mov sp,bp;
    dec sp;
    dec sp;     sp------> thread program stack
                          (old config)  
    dec sp;
    dec sp;
    dec sp;
    dec sp;     ; sp-------> thread program stack
                ;   (new config)

    push dx;   ;; push to thread program stack
    push ax;   ;; push to thread program stack
   
    mov sp,cx;
    pop dx;
    pop ax;
    mov sp,bp;
    dec sp,0ah;
    push ax;   ;; push to thread program stack
    push dx;    ;; push to thread program stack
    push bx;

   ;;   sp---> thread program stack (new) + 5 push

       ;;  ensure AX after returning from
       ;;  defer run has thread number
       
       ;; Jumping, 

       
       
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
                    ;; bx carries return addr    
                    ;; cx carries return expected flag !!   

    ;; finding thread program stack 
    ;; new config   
    ;;                               


    ;;
    ;;
    ;;  sp --> thread program stack
    ;; (new config) + 5 push
    ;; 

                    ;; ax free
                    ;; bx free
                    ;; cx free
                    ;; dx free

 ;; status of stacks
 ;;

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          
   ;;                                                   ;;
   ;;                               high addresses      ;;
   ;;  main stack                                       ;;
   ;;                                                   ;;
   ;;							;;                                               
   ;;                                |---|              ;;
   ;; |--------------------------|   |   |              ;;
   ;; |  ip                      |   |  \|/             ;;
   ;; |  return expected flag    | --|   popped         ;;
   ;; |  thread number           |        out           ;;
   ;; |                          |                      ;;
   ;; |  offset threadinit       |                      ;;
   ;; |  offset join             |                      ;;
   ;; |--------------------------|                      ;;
   ;;   thread program sp  <----sp                       ;;
   ;;   bp                                              ;;
   ;;   sp                                              ;;
   ;;                                low addresses      ;;
   ;;                                                   ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          
   ;;                                                   ;;
   ;;                               high addresses      ;;
   ;;  program stack                                    ;;
   ;;                                                   ;;
   ;;   return addr                                     ;; 
   ;;   offset create_thread  {  you can set these      ;;
   ;;   offset join           {  in main                ;; 
   ;;   thread number                                   ;;
   ;;   return_expected_flag                            ;;
   ;;   alt_space bp                                    ;; 
   ;;   alt_space sp                                    ;;
   ;;   variable                                        ;;
   ;;   bp                                              ;;
   ;;   sp                                              ;;
   ;;                                low addresses      ;;
   ;;                                                   ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    
    pop ax;
    pop bx;
    pop cx;
    pop dx;
               
    push dx;
    push cx;
    push bx;
    push ax;       
                    ;; ax return addr
                    ;; bx carries offset
                    ;; cx carries offset
                    ;; dx carries thread no.

    mov bx,sp;      
    dec bx;
    dec bx,        ; sp--- > variable
    
    ;;
        
    
    cmp dx,[bx];    ;  still carries thread no.
    jg handle_error;; 
    jle continue;   ;
    
    reverse_temporary_push:
    continue:  
 

                    ;; ax return addr
                    ;; bx free
                    ;; cx carries offset
                    ;; dx carries thread no.

     
     ;; sp --- > thread program stack
     ;;  (new config) + 5 push


                 
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
    
    mov bx,ax;      ;bx carries return addr   
                    ; ax too carries retunr addr

                    ;; ax carries return addr
                    ;; bx carries return addr
                    ;; cx carries offset
                    ;; dx carries thread no.

    
    1st_check:               ;;
    push 1st_check_end;      ;; push to thread program stack
    cmp cx,0;                
    je here_1:               ;; checking cx, return
                             ;; expected flag 
    
   ;;(do this later)
    
    
    mov ax,main_line_1;
    mov bx; main_line_1;   ;; << ---- throw your pointer here
    setting_base:
    
    
    mov bx,ax;
    here_1: 
    push here_1;             ;; push to thread program stack 

                    ;; ax carries return addr
                    ;; bx carries return addr
                    ;; cx carries offset
                    ;; dx carries thread no.
   
   ;;
   ;; sp --- > thread program stack
   ;;                 (old) + 7 push

    
    ;;
    ;; comparison table below 
    ;;  

    comparison:
    mov dx,[bx];       ;; <------ throw Pointer here
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
    cmp dl,0x3;
    jmp handle_3_inst_set;
    cmp dl,0x9;
    jmp handle_nop;



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
    jne case_handle_6_8;           ;;
    case_handle_6_0:               ;;
    add bx,01h;                    ;; offset before 
    jmp end_handle_6_inst_set ;    ;; prior to end_handle...
                                   ;;
    case_handle_6_8:
    cmp dl,0x08;                   ;;
    jne case_handle_6_A;           ;;
    cmp word ptr [replay_capturing_args],0x01;
    jne handle_6_8_continue;
    mov word ptr [push_type],0x6a; ;;
    add bx,03h; 
    jmp tree_do_1;                 ;;  <-------- return to tree_do
     
    handle_6_8_continue:
    add bx,03h;                    ;;  
    jmp end_handle_6_inst_set;     ;;
    
    case_handle_6_A:               ;;
    
    cmp dl,0xA;                    ;;
    jne jmp handle_5_inst_set;     ;;
    add bx,02h;
    jmp end_handle_6_inst_set;  
    


    end_handle_6_inst_set:
    cmp word ptr[replay_capturing_args],0x01;
    pop dx;
    jmp dx; 

     
    
    handle_5_inst_set:             ;;
    mov dx,[bx];                   ;;
    and dl,0Fh;                    ;;

    cmp dl,0x00;                   ;; 
    jne handle_5_1;
    mov word ptr[push_type],0x50;

    handle_5_0_end:	
    jmp end_handle_5_inst_set;
    
    handle_5_1:
    cmp dl,0x01;
    jne handle_5_2;
    mov word ptr[push_type],0x51;

    handle_5_1_end
    jmp end_handle_5_inst_set;
   
    handle_5_2:
    cmp dl,0x02; 
    jne handle_5_3;
    mov word ptr[push_type],0x52;

    handle_5_2_end:
    jmp end_handle_5_inst_set;
    
    handle_5_3:
    cmp dl,0x03;
    jne handle_5_4;
    mov word ptr[push_type],0x53;

    handle_5_4_end:
    jmp end_handle_5_inst_set;
    
    handle_5_4:
    mov word ptr[push_type],0x54;

    handle_5_4_end:
    jmp end_handle_5_inst_set;

                             
    jmp end_handle_5_inst_set:     ;;
                                   ;;  handle for 5
    end_handle_5_inst_set:         ;;
    cmp word ptr[replay_capturing_args],0x01;
    jne continue_5_end_usual;
    pop bx;
    mov cx,test_label;
    sub cx,bx;
    mov bx,cx;
    jmp [bx];                 ;;  <-------- return to tree_do
    test_label:
    
    continue_5_end_usual:
    add bx,01h;                    ;;  push reg
    pop dx;                        ;;
    jmp dx;                        ;;
 
    
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
    add bx,02h;                    ;; 
    pop dx;                        ;; 
    jmp dx;                        ;; 
                                   ;;
             
                                   ;;
    handle_e_inst_set:             ;;
    mov dx,[bx];                   ;;
    and dl,0fh;                    ;; handle for e
                                   ;; jmp
    cmp dl,0x0b;                   ;;
    jmp eb_detected;               ;;  
                                   ;; 
                                   ;;
    eb_detected:                   ;;
                                  ;; capable of handling two
    cmp word ptr [replay],0x01;
    je take_from_tree_caller;
    ordinary:
    push join;                     ;; label offsets, can be 
                                   ;; extended later
    back_from_caller:
    jmp check_offset;
    check_offset:                  ;;
    mov dx,[bx];                   ;; dh has signed offset
    mov ax,bx;                     ;; store bx to ax
    inc bx;                        ;;
    inc bx;                        ;;
    pop cx;                        ;;
    sub bx,cx;                     ;;  assuming code is small/medium ie. 				   ;;  cannot be 
                                   ;;  far beyond 256/128 (signed)
    cmp bl,dh;                     ;; (assuming functions use just jmp to 							  			 	                   ;; callers stack)
    je join_detected;              ;; (assuming functions know return addr and do 		 		   
                                   ;; return to caller pointer)
    mov bx,ax                      ;;
    jmp end_handle_e_inst_set;     ;;
    join_detected;                 ;;   
    mov bx,ax;                      ;;
    cmp  word ptr [replay],0x01    ;;
    je create_thread_detected;
    cmp word ptr [replay],0x01;
    je tree_do;
    jmp exectute_main ;            ;; <--- jump to tree.asm
                                   ;; push ax ;; ax carries starting point
                                   ;;
    end_handle_e_inst_set:         ;;  
                                   ;;
    add bx,02h;                    ;; we need to load bx with the 
    add bx,dh;                     ;;
    pop dx;                        ;; address (from offset)
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


