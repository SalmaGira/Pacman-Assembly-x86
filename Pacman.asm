.model
.stack 64
.data
;اللعبة دي هي لعبة pacman بس كلها مربعات .. المفروض اللاعب بيبدأ اللعبة ومعاه صحة ب1 بس .. لو خبط في عدو بيخسر 1 من صحته ولو اخد صحة بتزود 1 على صحته .. المفروض اللاعب بياخد كل النقط الصفرا اللي في الشاشة اللي هي الاكل .. لما ياخد كل الاكل بيكسب اللعبة .. ولو وصلت صحته ل0 بيخسر
;صحتة اللاعب بتبان تحت في الشاشة في نص الحتة اللي تحت .. ولما بيخسر بيبينله رسالة انه خسر ولو كسب بيبينله رسالة انه كسب مكان الصحة
;بلعب العبة دي بتحرك بWSAD مش الاسهم

;هنا بعمل متغيرات احط فيها قيمة اول المربع في الx والy الاولاني والاخراني بتوعه .. عشان اللابع بيكون مربع .. وعموما كل رسمة في اللعبة دي مربع
end1     dw 12
start1   dw 2
end2     dw 12
start2   dw 2 
;دول x وy تانيين بتوع اي شكل بقى في الشاشة غير اللاعب, وبرضو هي بتحدد اول x وy للشكل واخر x وy بتوعه
startx   dw ?
starty   dw ?
endx     dw ?
endy     dw ?

;الarray او اي حاجة بخصوص مقارنات بالpixels هي انا عاملاها relative للشاشة والابعاد اللي انا حاطاها .. يعني لما اقول الx هنا في الarray دا ب1 هي يعني انه في ابعاد الشاشة الاصلية 18
;دا بقى array فيه مكان كل حيطة جوا الpixels بتوع الشاشة .. لو في حيطة يبقى البيكسل ب1 ولو مفيش يبقى ب0 .. بس الarray دا بشوف منه الحيطات وانا ماشية يمين او شمال بس
;right and left
arrx     db 4 DUP(0),1,0,1,6 DUP(0),1,5 DUP(0), 1,3 DUP(0),1,0,1,0,0,1,3 DUP(0),1,5 DUP(0), 1,0,1,3 DUP(0),1,1,0,1,3 DUP(0),1,5 DUP(0), 3 DUP(1),3 DUP(0),1,1,0,1,0,1,0,1,3 DUP(0),1,0, 1,1,9 DUP(0),1,3 DUP(0),1,0,1,0, 1,14 DUP(0),1,3 DUP(0), 3 DUP(0),1,11 DUP(0),1,3 DUP(0), 0,1,0,1,0,1,7 DUP(0),1,0,1,0,1,0, 1,1,3 DUP(0),1,7 DUP(0),1,3 DUP(0),1,0, 1,1,3 DUP(0),1,7 DUP(0),1,0,1,0,1,0, 1,7 DUP(0),1,4 DUP(0),1,0,1,3 DUP(0), 8 DUP(0),1, 3 DUP(0),1,0,0,1,3 DUP(0)

;الarray دا بقى بتاع الحيطات اللي بشوفها وانا طالعة فوق او تحت
;up and down 
arry     db 11 DUP(0),0, 11 DUP(0),0, 4 DUP(0),1,4 DUP(0),1,0,0, 4 DUP(0),1,4 DUP(0),1,0,0, 0,0,1,0,1,4 DUP(0),1,1,0, 0,0,1,0,1,4 DUP(0),1,1,0, 6 DUP(0),1,0,0,1,1,0, 6 DUP(0),1,0,0,1,0,0, 4 DUP(0),1,4 DUP(0),1,0,0, 4 DUP(0),1,4 DUP(0),1,0,0, 1,3 DUP(0),1,4 DUP(0),1,0,0, 1,3 DUP(0),1,0,1,0,0,1,0,0, 1,3 DUP(0),1,0,1,0,0,1,0,0, 4 DUP(0),1,0,1,0,0,1,0,0, 11 DUP(0),0, 11 DUP(0),0, 1,10 DUP(0),0, 1,1,9 DUP(0),0, 0,1,9 DUP(0),0, 11 DUP(0),0

;دول الx والy بتوع اللاعب هم اللي بيعدوا هو انا فين في الcoordinates اللي انا عاملاها للشاشة .. يعني لو انا في الx ب2 معناها اني في الx بتاع الشاشة الاصلية ب34
xcr      db 1
xcl      db 0
ycu      db 0
ycd      db 1 

;دا عداد لكل عدو بيعد فيهم على عدد الحركات اللي بيتحركها .. يعني لو الe1 وصل ل4 يتدور ويرجع تاني للمكان اللي كان فيه
e1       db 0
e2       db 0
e3       db 0
e4       db 0
e5       db 0

;دول الx وy الاولاني والاخراني بتوع كل عدو من الخمسة اللي عاملاهم
xst1     dw ?
xen1     dw ?
yst1     dw ?
yen1     dw ?

xst2     dw ?
xen2     dw ?
yst2     dw ?
yen2     dw ?

xst3     dw ?
xen3     dw ?
yst3     dw ?
yen3     dw ?

xst4     dw ?
xen4     dw ?
yst4     dw ?
yen4     dw ?

xst5     dw ?
xen5     dw ?
yst5     dw ?
yen5     dw ?

;دول رسالتين واحدة بتقولي ان اللاعب كسب والتانية بتقولي انه خسر .. يعني واحدة بعرضها لما اكسب والتانية بعرضها لما اخسر
msg      db 'YOU WIN!!!$'
msg2     db 'YOU LOST!!$' 

;دا المتغير اللي حاطة فيه اللاعب او الشكل هيتحرك بمقدار قد ايه من الcoordinates بتاعت الشاشة الاصلية
movement db 16;8

;دا array للاكل حاطاه عاملاله initialize كله ب1 .. 1 يعني البيكسل في الcoordinates اللي انا عاملاها فيها اكل و0 يعني مفيهاش اكل
arrf     db 240 DUP(1)

;دا متغير للصحة بتاعت الاعب وبيبدأ ب1
health   db 1

.code
main proc
;دول السطرين اللي احنا خدناهم في المحاضرات عشان ننقل الداتا في المكان اللي بينفذ الكود
    mov ax,@data
    mov ds,ax
    
;هنا ببدأ بقى احط كل الحاجات المبدأية للعبة
    ;initialize
;هنا بعمل المكان اللي اللاعب واقف فيه بانه مفيهوش اكل .. بديهيات
    mov arrf,0    

;هنا بحول الكود لvideo mode عشان ابدأ اللعبة .. بحط في الax 013h وبعمل interrupt 10h زي ما هو في الcheat sheet
    mov ah,0
    mov al,13h
    int 10h     ;video mode
    
;بحط في al الرقم دا عشان اقول ان دا لون اللاعب اللي هو اللون الازرق وبعد كدا بنادي على الfunction او الprocedure بلغة الاسيمبلي بتاعت اللي بترسم اللاعب
    mov al,0001b ;player color
    CALL drawplayer
;هنا بقى في الجزء الكبير اللي جاي دا برسم المتاهة .. برسمها ازاي؟ بحدد اول x واخر x واول y واخر y بالنسبة للcoordinates بتاعت الشاشة الاصلية وبعد كدا بنادي على الproc اللي بترسم المتاهة .. هو انا اصلا برسم احيطان يعني
    ;-----------maze---------------
    mov startx,14
    mov endx,16
    mov starty,14
    mov endy,96               
    call drawmaze 
    
    mov startx,14
    mov endx,16
    mov starty,126
    mov endy,176              
    call drawmaze
    
    mov startx,30
    mov endx,32
    mov starty,46
    mov endy,80  
    call drawmaze 
    
    mov startx,30
    mov endx,96
    mov starty,78
    mov endy,80               
    call drawmaze
    
    mov startx,30
    mov endx,32
    mov starty,110
    mov endy,160   
    call drawmaze
    
    mov startx,30
    mov endx,80
    mov starty,158
    mov endy,160   
    call drawmaze
    
    mov startx,46
    mov endx,48
    mov starty,30
    mov endy,64  
    call drawmaze
    
    mov startx,62
    mov endx,96
    mov starty,46
    mov endy,48  
    call drawmaze
    
    mov startx,62
    mov endx,64
    mov starty,94
    mov endy,128  
    call drawmaze
    
    mov startx,62
    mov endx,112
    mov starty,174
    mov endy,176 
    call drawmaze
    
    mov startx,78
    mov endx,80
    mov starty,0
    mov endy,32               
    call drawmaze 
    
    ;--------------------------
    
    mov startx,94
    mov endx,128
    mov starty,110
    mov endy,112         
    call drawmaze
    
    mov startx,94
    mov endx,96
    mov starty,110
    mov endy,160 
    call drawmaze
    
    mov startx,62
    mov endx,224
    mov starty,158
    mov endy,160  
    call drawmaze
    
    mov startx,222
    mov endx,224
    mov starty,110
    mov endy,176             
    call drawmaze             
    
    mov startx,174
    mov endx,224
    mov starty,110
    mov endy,112              
    call drawmaze
    
    mov startx,110
    mov endx,112
    mov starty,0
    mov endy,64              
    call drawmaze
    
    mov startx,126
    mov endx,128
    mov starty,30
    mov endy,64              
    call drawmaze
    
    mov startx,126
    mov endx,224
    mov starty,78
    mov endy,80              
    call drawmaze
    
    mov startx,190
    mov endx,192
    mov starty,46
    mov endy,80              
    call drawmaze
    
    mov startx,158
    mov endx,160
    mov starty,14
    mov endy,64              
    call drawmaze
    
    mov startx,158
    mov endx,208
    mov starty,14
    mov endy,16              
    call drawmaze
    
    mov startx,222
    mov endx,224
    mov starty,0
    mov endy,64              
    call drawmaze
    
    mov startx,254
    mov endx,288
    mov starty,14
    mov endy,16              
    call drawmaze
    
    mov startx,254
    mov endx,256
    mov starty,62
    mov endy,128              
    call drawmaze
    
    mov startx,254
    mov endx,256
    mov starty,142
    mov endy,192              
    call drawmaze
    
    mov startx,206
    mov endx,208
    mov starty,174
    mov endy,192              
    call drawmaze
    
    mov startx,142
    mov endx,144
    mov starty,158
    mov endy,192              
    call drawmaze
    
    mov startx,270
    mov endx,304
    mov starty,30
    mov endy,32              
    call drawmaze
    
    mov startx,286
    mov endx,288
    mov starty,46
    mov endy,80              
    call drawmaze
    
    mov startx,286
    mov endx,288
    mov starty,110
    mov endy,160              
    call drawmaze
    
    mov startx,0
    mov endx,318 
    mov starty,190
    mov endy,192              
    call drawmaze
;هنا كدا خلاص خلصت رسم المتاهة كلها
;بعد كدا اللي جاي دا هرسم تلات مربعات حمراء والمربعات دي بتمثل الصحة اللي محطوطة في تلات اماكن في المتاهة اللي لما اللاعب ياخدها صحته تزيد
;في الاول بحدد لون لون الصحة هو لون الاحمر بحطه في al .. بعد كدا بحدد اول x واخر x واول y واخر y بالنسبة للcoordinates بتاعت الشاشة الاصلية بعد كدا بنادي على proc اللي بترسم الصحة اللي هي هي اللي بترسم المتاهة واي مربع تاني غير اللاعب   
    ;---------------life--------------------
    mov al,0100b
    
    mov startx,34
    mov endx,44 
    mov starty,66
    mov endy,76              
    call drawmaze
    
    mov startx,98
    mov endx,108 
    mov starty,146
    mov endy,156              
    call drawmaze
    
    mov startx,290
    mov endx,300
    mov starty,34
    mov endy,44             
    call drawmaze
;هنا كدا خلصت رسم الصحة التلاتة اللي في المتاهة كلها 
;بعد كدا هخلي الاماكن اللي هم موجودين فيها مفيهاش اكل واسجل في الarray بتاعت الاكل ان المكان دا فاضي مفهوش اكل
    
    mov arrf[82],0
    mov arrf[186],0
    mov arrf[58],0 
;الشوية الكتار في الكود اللي جايين دول هرسم الاعداء
;في الاول احدد لو الاعداء اللي هو cyan .. بعد كدا احدد اول المربع واخره بالنسبة للcoordiantes بتاعت الشاشة الاصلية .. بعد كدا انادي على الproc اللي هترسم المربع بتاع العدو .. بعد كدا بعمل initialize للx والy بتوع كل واحد هو واقف فين بالنسبة للcoordinates بتاعت الشاشة الاصلية  
    ;---------------enemies------------------
    mov al,0011b ;enemy color 
    ;enemy 1 V
    mov startx,2
    mov endx,12 
    mov starty,178
    mov endy,188
    CALL drawmaze 
    
    mov xst1,2
    mov xen1,12
    mov yst1,178
    mov yen1,188
    
    ;enemy 2 V
    mov startx,98
    mov endx,108 
    mov starty,114
    mov endy,124
    CALL drawmaze 
    
    mov xst2,98
    mov xen2,108
    mov yst2,114
    mov yen2,124 
    
    ;enemy 3 H
    mov startx,50
    mov endx,60 
    mov starty,178
    mov endy,188
    CALL drawmaze
    
    mov xst3,50
    mov xen3,60
    mov yst3,178
    mov yen3,188 
    
    ;enemy 4 V
    mov startx,306
    mov endx,316 
    mov starty,2
    mov endy,12
    CALL drawmaze
    
    mov xst4,306
    mov xen4,316
    mov yst4,2
    mov yen4,12 
    
    ;enemy 5 H
    mov startx,114
    mov endx,124 
    mov starty,2
    mov endy,12
    CALL drawmaze
    
    mov xst5,114
    mov xen5,124
    mov yst5,2
    mov yen5,12
;كدا خلصت كل حاجة تخص الinitialization بتاعت الاعداء
;بعد كدا الحتة دي بحدد لون الاكل اللي هو اصفر وبعد كدا بنده على الproc اللي بترسم الاكل وهي تقوم بالواجب كله
    ;-----------food---------------
    mov al,1110b ;food color
                 
    call drawfood 
;بعد كدا برسم اللاعب بقى وبحدد لونه اللي هو ازرق
    ;-----------player-------------
    mov al,0001b ;player color
    CALL drawplayer
;بعد كدا بدخل على الmain loop بتاعت اللعبة اللي هفضل جواها طول ما اللعبة شغالة
    ;-----------loop---------------
mainloop: 
;في الاول بعمل clean للbuffer عشان اعرف ادوس متبقاش الدوسة الواحدة هتكون الاولى والاخيرة عشان ميبقاش هو بياخد حرف تاني عشان البافر هيفضل مليان .. فجبت التلات سطور دول من cheat sheet
    mov ah,0ch
    mov al,0
    int 21h    ;clear buffer 
    
;هنا بقى الجزء اللي جاي دا هدخل على كل المقارنات اللي هشوف هل اللاعب دا خبط في عدو ولا لا او خد صحة ولا لا
    ;-----------COMPAIRSSSS--------    
; بشوف هل اللاعب دا وصل الصحة بتاعته ل0 ولا لا .. لو وصل بروح على end وهي تقوم بالواجب
    cmp health,0
    jz end

;بحط الy الاخراني بتاع العدو الاول في ax عشان اعرف استخدم الcmp وبعد كدا بقارن اخر الy بتاع العدو باخر الyبتاع اللاعب .. لو هم مش قد بعض بيروح للcheck  اللي بعده .. انما لو قد بعض بيكمل تاكيد هل هو في المكان نفسه بتاع العدو من حيث الx والy الاتنين مع بعض ولا لا .. لو اه نفس المكان يبقى يقلل الصحة 1 ويطلع يكمل اللوب بتاعت اللعبة .. عشان اكيد هو هيكون خبط حاجة واحدة بس من كل الحاجات اللي محطوطة في الشاشة فمش هعمل check على الباقي .. ولما يخبط في عدو بينقص الصحة بتاته ويرجع لمكانه الاولاني اللي بدأ اللعبة بيه بس اللعبة كلها بتفضل شغالة عادي
;بعد كدا بعمل check دا نفسه على الاربع اعداء الباقيين
    mov ax,yen1
    cmp end1,ax
    jnz cnte1
    mov ax,xen1
    cmp end2,ax
    jnz cnte1
    dec health
    jmp begagain
    
cnte1:
    mov ax,yen2
    cmp end1,ax
    jnz cnte2
    mov ax,xen2
    cmp end2,ax
    jnz cnte2
    dec health
    jmp begagain
    
cnte2:
    mov ax,yen3
    cmp end1,ax
    jnz cnte3
    mov ax,xen3
    cmp end2,ax
    jnz cnte3
    dec health
    jmp begagain
    
cnte3:
    mov ax,yen4
    cmp end1,ax
    jnz cnte4
    mov ax,xen4
    cmp end2,ax
    jnz cnte4
    dec health
    jmp begagain
    
cnte4:
    mov ax,yen5
    cmp end1,ax
    jnz hlth1
    mov ax,xen5
    cmp end2,ax
    jnz hlth1
    dec health
    jmp begagain
    
;بعد كدا بعمل check على كل الصحة اللي موجودين بنفس الطريقة اللي بشوف بيها الاعداء بس باختلاف ان الصحة بتزيد واللاعب بيكمل اللعبة عادي لما بياخدها مش بيرجع لمكانه الاولاني
hlth1:
    cmp start1,66
    jnz hlth2
    cmp start2,34
    jnz hlth2
    inc health 
    
hlth2:
    cmp start1,146
    jnz hlth3
    cmp start2,98
    jnz hlth3
    inc health
    
hlth3:
    cmp start1,34
    jnz hlth4
    cmp start2,290
    jnz hlth4
    inc health
    
hlth4:
    ;------------------------------  
;هنا في الخمس سطور دول بنده على خمس proc كل واحدة فيهم بترسم عدو .. وهم كلهم مكتوبين بنفس الطريقة بس باختلاف المتغيرات اللي بستخدمها عشان الاعداء
    CALL enemies1
    CALL enemies2
    CALL enemies3
    CALL enemies4
    CALL enemies5  
    
;بنده على proc اللي بترسم الاكل
    CALL drawfood 
    
;بنده على الproc اللي بتطبع الصحة تحب
    CALL print 
    
;دا هنا بوضح اني بلعب بWSAD مش بالاسهم
    ;WSAD
;هنا عاملة جزء delay كدا جوا الloop عشان يستنى الوقت دا عشان يكمل .. ودي خدتها برضو من الcheat sheet وحاطة الinterval  بتاع الوقت اللي يستنى فيه
    delay:
    ;delay
    MOV CX, 4h;01H
    MOV DX, 3240H
    mov ah, 86h    ;WAIT.
    int 15h

;هنا بقى عاملة الجزء بتاع انه ياخد الinput من الuser بس من غير ما يستنى .. ودا خدته برضو من التشيت شيت
    mov ah,1      ;do not wait for key press
    int 16h       ;key press  
    jz mainloop  
   
;بعد كدا بقى ببدأ اعمل كل check هل هو داس على فوق ولا تحت ولا يمين ولا شمال .. وبدور بالscancode
;-------------------------------------------------
isup:   ;scancode
;بقارن الinput اللي داخلي من اليوزر واشوف هل هو اللي داس فوق ولا لا .. لو كان فوق فعلا يمكل عادي انما لو مش فوق يروح على التشيك اللي بعده اللي هو هل هو تحت .. بعد كدا يمشي بنفس الطريقة دي لحد اخر check في التحركات الاربعة
    cmp ah,11h ;w
    jnz isdown
    
;هنا بقى بعمل تاكيدات هل هو واقف في اول جزء من الشاشة فمش هيقدر يطلع فوق اكتر من كدا ولا لا .. لو اه في اول جزء يروح للmain loop ويشوف الانبوت اللي بعده وميتحركش .. لو لا يكمل 
    ;---put here all movement possibility checks---
    cmp ycu,0
    jz mainloop 
    
;هنا بقى بيعمل معادلة عشان يعرف هي دي حيطة ولا لا .. فعشان انا بعمل العدادات بتاعت x وy بتوعي انا مش بتوع الشاشة الاصلية بdb مش بdw قبخلي ah ب0 واحط في al القيمة بتاعت الشيء اللي هعمله زائد للرقم اللي هطلعه بعد كدا .. عشان بعد كدا اعرف اخزنه على بعضه في register عشان اضيفه على ax بعد كدا في ناتج الضرب وبعد كدا اعرف استخدمه في اني اجيب الarray .. يعني بحط الy بتاع الفوق بتاع اللاعب في cx واحط الx بتاع شماله في al واحط 12 في bl عشان اضرب bl في al والناتج اللي يطلع في ax اضيف عليه cx وبعد كدا احطه في bx عشان استخدمه في الarray ودي الطريقة اللي بستخدمها في كل حاجة بقى قدام وحتى في proc deactivefood اللي بستخدمها عشان اجيب الرقم اللي هستخدمه عشان اجيب الindex بتاع الarray .. وببقى بستخدم بقى مين هحطه في cx ولا bl على حسب المعادلة اللي عندي مين هعمله زائد ومين هضربه في الرقم بتاعي
    ;checking for movement in wall
    mov ah,0
    mov al,ycu
    mov cx,ax 
    dec cx
    ;12*xcl+(ycl-1)
    mov bl,12
    mov al,xcl
    mul bl
    add ax,cx
    mov bx,ax
;بعد كدا بشوف الindex اللي طلعته من المعادلة دي هل هو حيطة ولا لا لو حيطة ارجع للmain loop ومتحركش ولو مش حيطة يعني مش 1 هكمل عادي وهدخل على الحركة
    cmp arry[bx],1
    jz mainloop

;في الاول عشان اتحرك بخلي اللون بتاعي باسود وبرسم مكان ما اللاعب واقف .. بحدد اللون بعد كدا بنده على الproc اللي بترسم اللاعب
moveup:    
    mov al,0000b ;blank
    CALL drawplayer
    
;بقلل بقى الy اللي فوق واللي تحت بتوع اللاعب عشان يتحرك فوق
    ;put the new changes and values of counters
    dec ycu
    dec ycd
    
;بعد كدا بعد push وpop للax عشان احتفظ بالقيمة بتاعتها متضيعش لما انده على deactivefood اللي بخليها تجيب الindex من المعادلة اللي انا كاتباها جواها .. وبعد ما بجيب الاندكس بجيبه في الارراي وبخليه ب0 .. يعني مبقاش في المنطقة دي اكل
    ;checking for food
    push ax
    CALL deactivefood 
    mov arrf[bx],0
    pop ax
    
;بعد كدا بقى بحط في الbx القيمة بتاعت الحركة هو اللاعب دا هيتحرك قد ايه من الcoordinates بتاعت الشاشة الاصلية .. وبعد كدا انقص الحركة دي من الy بتاع اللاعب عشان يطلع فوق .. وبعد كدا بحدد لون اللاعب .. ازرق .. بعد كدا بنده على الproc اللي هترسمه .. وبعد كدا بروح لcheckfood
    ;draw new position of player
    mov bl,movement 
    mov bh,0
    sub start1,bx
    sub end1,bx               
    mov al,0001b ;player color
    CALL drawplayer
    
    jmp checkfood
;-------------------------------------------------
;في كل التحركات والتاكيدات بتاعتهم بعمل نفس اللي عملته في isup
isdown:   ;scancode
    cmp ah,1fh ;s
    jnz isleft
    
    ;---put here all movement possibility checks--- 
    cmp ycd,12
    jz mainloop 
    
    ;checking for movement in wall
    mov ah,0
    mov al,ycu
    mov cx,ax 
    ;12*xcl+ycu
    mov bl,12
    mov al,xcl
    mul bl
    add ax,cx
    mov bx,ax
    cmp arry[bx],1
    jz mainloop

movedown:    
    mov al,0000b ;blank
    CALL drawplayer
    
    ;put the new changes and values of counters
    inc ycu
    inc ycd
    
    ;checking for food
    push ax
    CALL deactivefood  
    mov arrf[bx],0
    pop ax
    
    ;draw new position of player
    mov bl,movement 
    mov bh,0
    add start1,bx
    add end1,bx               
    mov al,0001b ;player color
    CALL drawplayer
    
    jmp checkfood  
;-------------------------------------------------
isleft:   ;scancode
    cmp ah,1eh ;a
    jnz isright
    
    ;---put here all movement possibility checks---
    cmp xcl,0
    jz mainloop
    
    ;checking for movement in wall
    mov ah,0
    mov al,xcl
    mov cx,ax 
    dec cx
    ;19*ycu+(xcl-1)
    mov bl,19
    mov al,ycu
    mul bl
    add ax,cx
    mov bx,ax
    cmp arrx[bx],1
    jz mainloop         
    
moveleft:    
    mov al,0000b ;blank
    CALL drawplayer
    
    ;put the new changes and values of counters
    dec xcr
    dec xcl 
    
    ;----------------food-------------
    push ax
    CALL deactivefood   
    mov arrf[bx],0
    pop ax
    
    ;draw new position of player
    mov bl,movement 
    mov bh,0
    sub start2,bx
    sub end2,bx               
    mov al,0001b ;player color
    CALL drawplayer
    
    jmp checkfood
;-------------------------------------------------
isright:   ;scancode
    cmp ah,20h ;d
    jnz mainloop
    
    ;---put here all movement possibility checks---
    cmp xcr,20
    jz mainloop   
    
    ;checking for movement in wall
    mov ah,0
    mov al,xcl
    mov cx,ax 
    ;19*ycu+xcl
    mov bl,19
    mov al,ycu
    mul bl
    add ax,cx
    mov bx,ax
    cmp arrx[bx],1
    jz mainloop

moveright:    
    mov al,0000b ;blank
    CALL drawplayer
    
    ;put the new changes and values of counters
    inc xcr
    inc xcl  
    
    ;checking for food 
    CALL deactivefood    
    mov arrf[bx],0
    
    ;draw new position of player
    mov bl,movement 
    mov bh,0
    add start2,bx
    add end2,bx               
    mov al,0001b ;player color
    CALL drawplayer
;-------------------------------------------------
;هنا بقى بعمل اتنين loop وبمشي بsi وdi وبخليهم الاتنين في الاول ب0
checkfood:
    ;jmp mainloop
    mov si,0
    mov di,0
    loopfood:
    ;cmp arrf[20*si+di],1
    
;بعمل نفس اللي عملته في isup عشان احطلع ناتج المعادلة اللي هجيب منها مكان الindex بتاع الarray عشان اشوف هل الاكل خلص ولا لا
;بفضل اعمل check على كل واحدة في الarray واول واحدة الاقي قيمتها ب1 بطلع من اللوب على الmain loop على طول
;انما لو مقابلتش 1 بفضل ماشية ماشي لحد لما الarray كله يخلص ويبقى كله ب0 بطلع من اللوب دي واكتب رسالة ان اللاعب خلص اللعبة وكسب .. واطلع على ending
    ;CALL deactivefood
    mov ax,si
    ;mov arrf[20*si+di],0
    mov bl,20
    mul bl
    add ax,di
    mov bx,ax
    ;cmp arrf[si],1
    cmp arrf[bx],1
    jz mainloop
    
    ;keep looping
    inc si
    cmp si,12;12
    jnz loopfood 
    
    inc di 
    mov si,0
    cmp di,20;20
    jnz loopfood 
    
;كدا بقى اللي جاي دا بعد ما بخلص اني الف على الarray بتاعت الاكل كلها بروح بقى اغير مكان الcursor واطبع رسالة انه كسب واروح على ending مش هرجع على الmain loop
    ;after the loop finished
    ;"YOU WIN"
    mov ah,2
    mov dx,1800h
    int 10h
    
    mov dx,offset msg
    mov ah,9
    int 21h
    jmp ending    
;-------------------------------------------------    
;دي بقى الproc اللي بترسم اللاعب
drawplayer PROC 
    ;the player end=10,start=2
;بكتب في الاول مكان اللاعب بحط x اللي في اليمين في cx وy اللي فوق في dx .. وانفذ الint بتاع انه يرسم
    mov cx,end2        ;put the player x position(don't change this)
    mov dx,start1     ;put the player y position
    ;mov al,0001b ;player color 
    mov ah,0ch

;هنا بقى بدخل في الloopدي عشان افضل ارسم كل بيكسل لحد ما اخلص المربع ..
back1:
    int 10h
    dec cx
    cmp cx,start2
    jnz back1
      
    inc dx
    mov cx,end2
    cmp dx,end1
    jnz back1 
    
           RET
drawplayer ENDP                    
;-------------------------------------------------
;نفس الproc اللي فوق بالظبط بس بستخدمها بس في كل الرسومات الا اللاعب عشان احتفظ بproc مخصصة باللاعب مبوظلوش حاجة وانا برسم حاجة تانية
drawmaze PROC 
    ;the player
    mov cx,endx        ;put the player x position(don't change this)
    mov dx,starty     ;put the player y position
    ;mov al,0010b ;player color 
    mov ah,0ch

backmaze:
    int 10h
    dec cx
    cmp cx,startx
    jnz backmaze
      
    inc dx
    mov cx,endx
    cmp dx,endy
    jnz backmaze 
    
         RET
drawmaze ENDP                                     
;-------------------------------------------------
; هنا في الاول بحدد الحجم بتاع الاكل باني احدد اول x واخر x واول y واخر y وبعد كدا اخلي الsi وdiب0 عشان ابدأ اعد عشان ادخل اللوب اللي هرسم منها
drawfood PROC 
    mov startx,6
    mov endx,8 
    mov starty,6
    mov endy,8 
    
    mov si,0
    mov di,0

backfood:
;بعد كدا بقى بدخل في اللوب ببدأ اعمل الخطوات بتاعت اني اجيب الindex من المعادلة الل كاتباها دي .. اعمل الاول check اشوف لو الindx دا اللي جواه مش ب1 اعدي واعد بعد كدا من غير ما ارسمه .. انما لو 1 هرسمه واكمل 
;بعد كدا بفضل ازود بقى بقيمة 16 اللي هي تقريبا كل بيكسل جوا الcoordinates بتاعتي relative للcoordinates بتاعت الشاشة الاصلية .. عشان انقل على البيكسل اللي بعدها عشان ارسم فيها الاكل التاني .. وافضل كدا بقى لحد ما اخلص الشاشة كلها
    ;checking for food
    mov ax,si ;to get al
    mov bx,20 ;to get bl
    mul bl    ;now we have ax
    add ax,di
    mov bx,ax
    ;cmp arrf[20*si+di],1 
    mov al,1110b
    cmp arrf[bx],1
    ;jz getnext
    jnz getnext                     
    call drawmaze
getnext:
    add starty,16
    add endy,16 
    
    inc si
    cmp si,12
    jnz backfood
      
    inc di 
    add startx,16
    add endx,16   
    mov starty,6
    mov endy,8
    mov si,0
    cmp di,20
    jnz backfood 
    
         RET
drawfood ENDP    
;------------------------------------------------- 
;دي بقى الproc اللي غالبا بستخدمها لكل الحاجات اللي بحتاج اجيب بيها ناتج المعادلة نفسها اللي جوا الproc دس عشان اجيب الindex .. بس كدا
deactivefood PROC
    ;checking for food
    mov ah,0
    ;mov al,ycu
    ;mov si,ax
    mov al,xcl
    mov cx,ax
    ;mov arrf[20*ycu+xcl],0
    mov bl,20
    mov al,ycu
    mul bl
    add ax,cx
    mov bx,ax
    
         RET
deactivefood ENDP 
;-------------------------------------------------
;دي proc بعمل display للصحة في الجزء الاخير من الشاشة .. بغبر الاول مكان الcursor بعد كدا بطبع القيمة بتاعت الصحة .. بس بزود على الascii code بتاع الرقم "0" عشان يتطبع 0 مش اللي الascii code بتاعه هو قيمة الصحة
print PROC
    mov ah,2
    mov dx,1810h
    int 10h
    
    mov ah,2
    mov dl,health
    add dl,'0'
    int 21h
    
    RET
print ENDP
;-------------------------------------------------
;هنا دي الproc اللي برسم بيها العدو الاول .. والباقي نفس الكود بالظبط بس باختلاف المتغيرات اللي بستخدمها جوا وكمان هل انا بتحرك افقي ولا رأسي
enemies1 PROC 
;في الاول بخلي اللون اسود
    mov al,0000b ;blank
    ;------------
    
;بعد كدا باستخدام الstack بحط قيم الx والy بتوع العدو في الx وy اللي بستخدمهم جوا الproc اللي بترسم 
    push yen1
    push yst1
    push xen1
    push xst1
    pop startx
    pop endx
    pop starty
    pop endy
    CALL drawmaze
    
;بعد كدا برجع اللون تاني لcyan اللي هو لون العدو .. بعد ما اكون رسمت مكان العدو قبل ما يتحرك اسود .. كأني مسحته
    mov al,0011b 
    
;بعد كدا بقارن بشوف هو العداد وصل ل6 يعني عدد التحركات وصل ل6 .. لو لسه موصلش بروح اطلع فوق .. لو وصل بكمل
    cmp e1,6
    jl upe1
    
;بعد كدا بقارن بشوف هل العداد بتاع التحرك وصل ل12 ولا لا .. يعني هل هو رجع لمكانه تاني ولا لا لو وصل ل12 بروح عشان اصفره لو لسه بكمل بقى عشان ينزل لتحت
    cmp e1,12
    jz zeroe1
    
;عشان انول لتحت بقى بحط في الbx قيمة التحرك اللي هي 16 بيكسل من الشاشة الاصلية وبزود القيمة دي على كل y بتاع العدو والy بتوع الproc اللي هترسم العدو
;وبعد كدا ازود العداد بتاع الحركة .. يعني انه اتحرك خطوة
;وبعد كدا اروح بقى لنهاية الproc بتاعتي
    ;down
    ;add y,bx
    ;draw again
    mov bl,16;4 
    mov bh,0
    add yst1,bx
    add yen1,bx
    add starty,bx
    add endy,bx               
    CALL drawmaze
    inc e1
    jmp nexte2
    
;عشان اطلع فوق نفس الخطوات هي هي بتاعت اني انزل تحت بس بدل ما بزود قيمة التحرك من الy كلهم فانا بنقصها منهم .. وبرضو بزود العداد وبعد كدا اروح لنهاية الproc بتاعتي
    upe1:
    ;sub y,bx
    ;draw again
    mov bl,16;4 
    mov bh,0
    sub yst1,bx
    sub yen1,bx 
    sub starty,bx
    sub endy,bx              
    CALL drawmaze
    inc e1
    jmp nexte2
    
;في الاخر بقى لما العداد بيكون وصل لاخر قيمة ليه المفروض يوصلها وهي عدد التحركات بتاعته فبرجع اصفر العداد وارسم العدو في اخر مكان ليه 
    zeroe1:
    mov e1,0
    CALL drawmaze
    
    nexte2:
        RET
enemies1 ENDP 
;-----------------------------------------------
;بعد كدا بعمل نفس اللي في الproc اللي فاتت دي على كل الproc بتوع باقي الاعداء
enemies2 PROC 
    mov al,0000b
     
    push yen2
    push yst2
    push xen2
    push xst2
    pop startx
    pop endx
    pop starty
    pop endy
    CALL drawmaze
    
    mov al,0011b
    
    cmp e2,7
    jl upe2
    
    cmp e2,14
    jz zeroe2
    
    ;down
    ;add y,bx
    ;draw again   
    
    mov bl,16;4 
    mov bh,0
    sub Xst2,bx
    sub xen2,bx
    sub startx,bx
    sub endx,bx               
    CALL drawmaze
    inc e2
    jmp nexte3
    
    upe2:
    ;sub y,bx
    ;draw again
    mov bl,16;4 
    mov bh,0
    add xst2,bx
    add xen2,bx
    add startx,bx
    add endx,bx               
    CALL drawmaze
    inc e2
    jmp nexte3
    
    zeroe2:
    mov e2,0 
    CALL drawmaze
    
    nexte3:

    RET
enemies2 ENDP
;-----------------------------------------------
enemies3 PROC 
    mov al,0000b
     
    push yen3
    push yst3
    push xen3
    push xst3
    pop startx
    pop endx
    pop starty
    pop endy
    CALL drawmaze
    
    mov al,0011b
    
    cmp e3,5
    jl upe3
    
    cmp e3,10
    jz zeroe3
    
    ;down
    ;add x,bx
    ;draw again
    mov bl,16;4 
    mov bh,0
    sub xst3,bx
    sub xen3,bx
    sub startx,bx
    sub endx,bx               
    CALL drawmaze
    inc e3
    jmp nexte4
    
    upe3:
    ;sub x,bx
    ;draw again 
    mov bl,16;4 
    mov bh,0
    add xst3,bx
    add Xen3,bx
    add startx,bx
    add endx,bx               
    CALL drawmaze
    inc e3
    jmp nexte4
    
    zeroe3:
    mov e3,0
    CALL drawmaze
    
    nexte4:

    RET
enemies3 ENDP
;-----------------------------------------------
enemies4 PROC
    mov al,0000b
    
    push yen4
    push yst4
    push xen4
    push xst4
    pop startx
    pop endx
    pop starty
    pop endy
    CALL drawmaze
    
    mov al,0011b
    
    cmp e4,8
    jl upe4
    
    cmp e4,16
    jz zeroe4
    
    ;down
    ;add y,bx
    ;draw again
    mov bl,16;4 
    mov bh,0
    sub yst4,bx
    sub yen4,bx
    sub starty,bx
    sub endy,bx               
    CALL drawmaze
    inc e4
    jmp nexte5
    
    upe4:
    ;sub y,bx
    ;draw again
    mov bl,16;4 
    mov bh,0
    add yst4,bx
    add yen4,bx
    add starty,bx
    add endy,bx               
    CALL drawmaze
    inc e4
    jmp nexte5
    
    zeroe4:
    mov e4,0
    CALL drawmaze
    
    nexte5:

    RET
enemies4 ENDP
;-----------------------------------------------
enemies5 PROC
    mov al,0000b
    
    push yen5
    push yst5
    push xen5
    push xst5
    pop startx
    pop endx
    pop starty
    pop endy
    CALL drawmaze
    
    mov al,0011b
    
    cmp e5,4
    jl upe5
    
    cmp e5,8
    jz zeroe5
    
    ;down
    ;add x,bx
    ;draw again
    mov bl,16;4 
    mov bh,0
    sub yst5,bx
    sub yen5,bx 
    sub starty,bx
    sub endy,bx              
    CALL drawmaze
    inc e5
    jmp nexte6
    
    upe5:
    ;sub x,bx
    ;draw again
    mov bl,16;4 
    mov bh,0
    add yst5,bx
    add yen5,bx
    add starty,bx
    add endy,bx               
    CALL drawmaze
    inc e5
    jmp nexte6
    
    zeroe5:
    mov e5,0
    CALL drawmaze
    
    nexte6:

    RET
enemies5 ENDP
;-----------------------------------------------
;دي الprocاللي بنده عليها لما اللاعب بيخبط في عدو .. عشان اخلي اللاعب يرجع تاني لمكان البداية
begagain:                                       
;برجع تاني كل قيم الx وال y بتوع اللاعب لمكانهم الاولاني اول ما بدأ اللعبة .. وكمان العدادات بتوع x وy اللي هم بتعامل بيهم في الcoordinates بتاعتي انا
    mov end1,12
    mov start1,2
    mov end2,12
    mov start2,2
    
    mov xcr,1
    mov xcl,0
    mov ycu,0
    mov ycd,1
    
;بعد كدا بحط لون اللاعب اللي هو ازرق وبعد كدا برسمه في مكانه الجديد
    mov al,0001b
    CALL drawplayer 
    
;بعد كدا برجع للmainloop
    jmp mainloop
    
;-----------------------------------------------  
;دي بقى النهاية اللي هو بحط مكان الcursor عشان يطبع جملة انع خسر في تحت الشاشة وبعد كدا بطبع الرسالة
end:
    mov ah,2
    mov dx,1810h
    int 10h
       
    mov dx,offset msg2
    mov ah,9
    int 21h
ending: 
;بعد كدا بعمل شوية delay عشان اللاعب يلحق يشوف الرسالة وهي بتتعرض .. ولما اللاعب بيكسب بينط على طول على الdelay دا مش التاني اللي هو من اول ما بيكتب رسالة انه خسر
    ;delay
    MOV CX, 32h;01H
    MOV DX, 3240H
    mov ah, 86h    ;WAIT.
    int 15h
