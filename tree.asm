
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

     
     
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
    ;;         structure of main                       ;;
    ;;                                                 ;;
    ;;                                                 ;;
    ;;                                                 ;;
    ;;                                                 ;;
    ;;                                                 ;;
    ;;                                                 ;;
    ;;        thread_no                                ;;
    ;;        create_strcutbp                          ;;
    ;;        create_structsp   // ip                  ;;
    ;;        bp                                       ;;
    ;;        sp                                       ;;
    ;;                                                 ;;
    ;;                                                 ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
    
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

stack - 500h;

stack requiremnet - 1fff

start:    

    mov bp,bp;
    mov sp,bp;
    
                (mov sp 500h backwards)
                
   
              
    
    
    push next_line;
    jmp create_struct_init;
    
    next_line:
    push next_line_1;
    jmp cs_init;         

    next_line1: 
    push 1;            
    jmp create_struct;    
    
    
    
    ;; (requires returb address before 
    ;; jump to init
    
    cs_init:
    
    ;;
    ;;  expected
    ;;  coming from main --->(bp-1)
    ;;

    pop ax;                ;; ax has IP  ! 
    cs_init_skip;  
    mov bx,sp;             ;; bx has sp 
    mov cx,bp;
    sub cx,500h;

                          
    push bx;         ;; bx had sp !
    mov bx,cx;
    cmp [bx],0000h;
    je contd;   
    
    pop dx;          ;; dx has sp !
    mov bx,ax;       ;; bx has IP !
    jmp [bx]; 
 
    ;;  let move
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
    ;; dx carries thread number
    
    
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
    ;;  main expected
    ;;   
    ;; |----------|
    ;; |thread_no | xx popped  xx
    ;; |cs_bp     |
    ;; -----------|
    ;; cs_sp     <----- sp
    ;; bp
    ;; sp
    ;;
    
    
 
    push dx;   ;; #thread number
    push 0;    ;; # depends on        [[2 bytes]]
    push 0;    ;; #affects
    push 0;    ;; run status 
    push 0;    ;; next

    mov dx,sp;
       ;;return to main 
       ;; stack
       
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
                               