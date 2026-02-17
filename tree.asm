
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
;;implementation of tree in assembly


start:  
                                                  /--\
                                                  |  |        /--\
                                                  \--/        |  |
                                                              \--/      (layer 3)
                                                  /|\       _
;;                                                 |        /|
;;                                                 |       /     (leaf)
;;                                                 |      /
;;                                                 |     /
;;                                                 |    /
;;                                                 |   /
;;                                  /--\           |  /
;;                                  |  |          /--\
;;                                  \--/          |  |
;;                                                \--/  (leaf)  (layer2_)
;;                                   /|\         _
                                      |          /|
                                      |         /
arg, arg, result                      |        /
                                      |       /
                                      |      /
                                      |     /
                                      |    /
                                      |   /
                                     /--\/
                                     |  |
                                     \--/   (root)
                                            (layer1)
                                     
  
  
                                     
                                        
 (track)          
          bx     cx      _  dx
     ax    \     |       /|
       \    \    |      /
        \    \   |     /
         \    \  |    /
          \    | |   /                 
           \   | |  /     
            \  | | /                       
        |----------|                 
push    | mem addr | -------- $data 
arg     |----------|  

           (source)  
             
             
                                                
                                                
                                                
                                                
                                                
                                             /--\   
                                            |    |
                                            |    |
                                             \--/  
                                              |  
                                              |  
                                              |  
                                              |  
                                              |  
                                              |  
                                              |
                                              |
                                            /--\       
                                           | cx |      /--\
                                           |    |     | 05 |
                                            \--/      |    |
                                              |        \--/
                                              |      /
                                              |     /
                                              |    /
                                              |   /
                                              |  /
                                              | /               
                                             /--\  
                                            | bx |      /--\
                                            |    |     | 02 |
                                             \--/      |    |
if data: closed case                          |       / \--/
                                              |      /
                                              |     /
                                              |    /
                                              |   /
(track both reg)                              |  /
                                              | /
if reg:                         /--\         /--\
                               | bx |       | ax |
considered:                    |    |       |    |
  mul ax,bx;                    \--/         \--/
  add ax,bx;                      |        /
  sub ax,bx;                      |       /
  div ax,bx;                      |      /
                                  |     /
not considered:                   |    /
  mul ax,02;                      |   /  
  add ax,02;                      |  /
  sub ax 02;                     /--\
  div ax,02;                    |    |
                                |    | mul bx,ax
                                 \--/

   
   ax bx cx dx  push
   
 mem access                                
 
end start                                  
ret                                        
                                        depends on? (list)
                                           affects ? (list) 


                (list)------>
                   of nodes                  (node)
                                               thread
               .next                                
                                            affects ?   (list)                                        
                                            depends on? (list)
                                            has_run_? 
                                            .join(run parallel)
                                            (runs only if depends_on.has_run status 1)
                                            
                                            depends on (list) .back .next
                                             back only when .next == null 
                                             

struct of node (thread)
(node)
number#
depends on ? (list)
affects ?  (list)
next

struct of 
depends on (list)
number#                                             
next
back

struct of 
number #
affects (list)
next
up          

layer 1 --> runs those wiht affects 0 ; depends 0
                            affedcts multiple ; depends 0
                            
             has .next
                            
layer 2 ---> checks layer1.affects ; runds only those, dependson.all.hasrun =1
            
            has .next  
            
layer 3 --->checks layer2.affects ; runs only those, dependson.all.hasrun = 1

     
     
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          
   ;;                                                   ;;
   ;;                               high addresses      ;;
   ;;  program stack                                    ;;
   ;;                                                   ;;
   ;;   return addr   <------sp                         ;; 
   ;;   offset thread  {  you can set these             ;;
   ;;   offset join    {  in main                       ;; 
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
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;                                                 ;;
    ;;                                                 ;;
    ;;        structure of create_struct               ;;
    ;;                                                 ;;
    ;; |--------------|                                ;;
    ;; |   struct 1   |                                ;;
    ;; |   struct 1   |                                ;;
    ;; |   struct 1   |                                ;;
    ;; |   struct 1   |                                ;;
    ;; |--------------|                                ;;
    ;;    int                                          ;;
    ;;    bp                                           ;;
    ;;    sp     -- > main thread number               ;;
    ;;                                                 ;;
    ;;                                                 ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                   ;;


org 100h       

;;256 threads * len of datastructure   


;;
;; jumps from join checks
;; expected input --> ip of 1st join
;;
                        
                        
                        
;;
;; (assuming coming from join.defer_run.handle.jmpjoin
;;                                                    

stack - 500h;

stack requiremnet - 1fff  



start:    
    
    ;; expected to come from
    ;; thread program stack
    ;; (old config) + 7 push
    ;; (new config) + 5 push
    
    ;; Ideal assumption - functions
    ;; do not return values in 
    ;; any registers
    ;; do not pass args in registers
    ;; if previous funcitons passed values in
    ;; registers, we can fix them later
    
    
    ;; assuming main stack/functions
    ;; pushes data before function call
    ;; and pops values out
    ;; after function is over
    ;; i.e wipes off
    
   ;;we have to work around main stack
   
   
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
       
   
   ;;main manages:
   ;; thread number (1,2,3..)
   ;; retunr  value from function(thread)
   ;; passes return expected flag for thread
   
   ;; ax carries address of starting_block
   
       
    mov sp,bp;
    mov bp,[bp];
    mov sp,[bp];       ;; non traditional way of moving to stack
    dec sp;
    dec sp;
    
    
    ;; sp-->main stack
    
    mov bx,ax;
    mov [replay],0x01;
    
    jmp comparison;
    take_from_caller:
    push create_thread;
    jmp back_from_caller;
   
    create_thread_detected:
    
    
    
    
    push next_line;
    jmp create_struct_init;
    
    next_line:
    push next_line_1;
    jmp cs_init;         

    next_line1: 
    push 02;         ;;address no.    
    jmp create_struct;    
    
              
    cs_init:     ;; 
                 ;; requires return address before 
                 ;;  jumping here
                 ;;
                 
                 ;;
                 ;;  expected
                 ;;  coming from main --->(bp-1)
                 ;;

    pop ax;                ;; ax has return addr  ! 
   
    cs_init_skip:  
    mov cx,bp;
    sub cx,500h;

                          
    
    mov bx,cx;
    cmp [bx],0000h;
    je contd;   
    
    mov bx,ax;            ;; bx has return addr !
    jmp [bx]; 
 
    ;;  lets move
    ;;   sp---> create_struct

    
    contd: 
 
    mov bx,sp;     
    mov sp,cx;
    push bx;               ;; push to create_struct   
    push bp;               ;; push to create_struct
    mov bp,sp;  
    push 0;                ;; push to create_struct
      
                     ;;
                     ;;
                     ;; sp--->create struct
                     ;;   
                           
                 
    ;; let's return
    ;; to caller stack
    
    mov cx,sp;
    mov dx,bp;
    
    mov sp,bp;
    mov bp,[bp];
    inc sp;
    inc sp;
    mov bx,sp;
    mov sp,[bp];   
                    ;;
                    ;; sp---> main
                    ;;
    ;;
    ;; updating sp,bp on main 
    ;; stack
    ;;      
          
    push cx;        ;; push to main stack
    push dx;        ;; push to main stack
    
    mov bx,ax;            ;; bx has IP 
    jmp [bx];
    
    
    ;;
    ;;  now, 
    ;; main stack
    ;; 
    ;;
    ;; cs_bp     <------ sp
    ;; cs_sp
    ;; bp
    ;; sp
    ;;

    
    create_struct: 
    
    ;; expected coming from main 
    
    
    ;;
    ;;  
    ;;  main expected
    ;;   
    ;; 
    ;; thread_no <----- sp
    ;; cs_bp     
    ;; cs_sp
    ;; bp
    ;; sp
    ;;
     
    push cs_work;
    pop ax;
    jmp cs_init_skip; 
    

    cs_work: 
    
    ;; after return
    ;; dx carries address of thread args
    
    
    ;;
    ;; sp---> create struct 
    
    pop dx; 
    pop bx;
    mov bp,[bx];    
    mov bx,sp;
    inc sp;
    inc sp;
    mov sp,[bx];  
    
    ;;
    ;;  
    ;;  main 
    ;;   
    ;; |----------|
    ;; |thread_no | xx popped  xx
    ;; |cs_bp     |
    ;; |----------|
    ;; cs_sp     <----- sp
    ;; bp
    ;; sp
    ;;
    
               ;; push to struct thread
 
    push dx;   ;; push to struct 
    push 0;    ;; push to struct 
    push 0;    ;; push to struct 
    push 0;    ;; push to struct 
    push 0;    ;; push to struct 
    push 0;    ;; push to struct 
    
    
   ;;
   ;;  |----------------------------------------| 
   ;;  |  order :                               |
   ;;  |                                        |
   ;;  |  thread no.                            |                |
   ;;  |  address - depends on list             |
   ;;  |  address -  affects  list              |
   ;;  |  run status                            |
   ;;  |  do_filled                             |
   ;;  |  next                                  |
   ;;  |                                        |
   ;;  |----------------------------------------|
   ;;
   ;;   
   
   
    
    mov dx,sp; 
       ;; let's 
       ;; return to main stack
       ;;
       
       
    mov sp,bp;
    mov bp,[bp];
    inc sp;
    inc sp;
    mov bx,sp;
    mov sp,[bx]; 
   
    push dx;
     
    ;;
    ;; sp---> main  
    ;;                                               
                               