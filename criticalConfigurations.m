%--------------------------------------------------------------------------------------
%CRITICAL CONFIGURATIONS IN Q(I)
%--------------------------------------------------------------------------------------

function CC = criticalConfigurations(  )

CC = [];

%48 symmetries of the cube
C1 = [1 2 3 4 5 6 7 8];
C2 = [4 1 2 3 8 5 6 7];
C3 = [3 4 1 2 7 8 5 6];
C4 = [2 3 4 1 6 7 8 5];
C5 = [4 3 7 8 1 2 6 5];
C6 = [8 7 6 5 4 3 2 1];
C7 = [5 6 2 1 8 7 3 4];
C8 = [5 1 4 8 6 2 3 7];
C9 = [6 5 8 7 2 1 4 3];
C10 = [2 6 7 3 1 5 8 4];
C11 = [1 4 8 5 2 3 7 6];
C12 = [1 5 6 2 4 8 7 3];
C13 = [6 2 1 5 7 3 4 8];
C14 = [3 2 6 7 4 1 5 8];
C15 = [6 7 3 2 5 8 4 1];
C16 = [8 4 3 7 5 1 2 6];
C17 = [3 7 8 4 2 6 5 1];
C18 = [8 5 1 4 7 6 2 3];
C19 = [2 1 5 6 3 4 8 7];
C20 = [7 3 2 6 8 4 1 5];
C21 = [7 8 4 3 6 5 1 2];
C22 = [4 8 5 1 3 7 6 2];
C23 = [5 8 7 6 1 4 3 2];
C24 = [7 6 5 8 3 2 1 4];
C25 = [2 1 4 3 6 5 8 7];
C26 = [4 3 2 1 8 7 6 5];
C27 = [5 6 7 8 1 2 3 4];
C28 = [1 2 6 5 4 3 7 8];
C29 = [1 5 8 4 2 6 7 3];
C30 = [1 4 3 2 5 8 7 6];
C31 = [6 2 3 7 5 1 4 8];
C32 = [3 2 1 4 7 6 5 8];
C33 = [8 7 3 4 5 6 2 1];
C34 = [7 8 5 6 3 4 1 2];
C35 = [3 4 8 7 2 1 5 6];
C36 = [6 5 1 2 7 8 4 3];
C37 = [3 7 6 2 4 8 5 1];
C38 = [8 4 1 5 7 3 2 6];
C39 = [8 5 6 7 4 1 2 3];
C40 = [6 7 8 5 2 3 4 1];
C41 = [4 1 5 8 3 2 6 7];
C42 = [2 6 5 1 3 7 8 4];
C43 = [7 6 2 3 8 5 1 4];
C44 = [7 3 4 8 6 2 1 5];
C45 = [5 1 2 6 8 4 3 7];
C46 = [2 3 7 6 1 4 8 5];
C47 = [4 8 7 3 1 5 6 2];
C48 = [5 8 4 1 6 7 3 2];

C = [C2;C3;C4;C5;C6;C7;C8;C9;C10;C11;C12;C13;C14;C15;C16;C17;C18;C19;C20;
    C21;C22;C23;C24;C25;C26;C27;C28;C29;C30;C31;C32;C33;C34;C35;C36;C37;C38;
    C39;C40;C41;C42;C43;C44;C45;C46;C47;C48];

%Configuracion 1: En el inicial, el 2 y el 4

cc1 = [0 1 0 1 0 0 0 0];
CC = [CC;cc1];
 
for i = 1:47
    cc2 = zeros(1,8);
    c1 = [C(i,2) C(i,4)];
    c2 = sort(c1);
    cc2(c2(1)) = 1;
    cc2(c2(2)) = 1;
    k = belong(CC,cc2);
    if k == 0
        CC = [CC;cc2];
    end
end

%Configuracion 2: En el inicial, el 3 y el 5

cc1 = [0 0 1 0 1 0 0 0];
CC = [CC;cc1];

for i = 1:47
    cc2 = zeros(1,8);
    c1 = [C(i,3) C(i,5)];
    c2 = sort(c1);
    cc2(c2(1)) = 1;
    cc2(c2(2)) = 1;
    k = belong(CC,cc2);
    if k == 0
        CC = [CC;cc2];
    end
end

%Configuracion 3: En el inicial, el 2, 3 y el 5

cc1 = [0 1 1 0 1 0 0 0];
CC = [CC;cc1];

for i = 1:47
    cc2 = zeros(1,8);
    c1 = [C(i,2) C(i,3) C(i,5)];
    c2 = sort(c1);
    cc2(c2(1)) = 1;
    cc2(c2(2)) = 1;
    cc2(c2(3)) = 1;
    k = belong(CC,cc2);
    if k == 0
        CC = [CC;cc2];
    end
end

%Configuracion 4: En el inicial, el 2, 4 y el 5

cc1 = [0 1 0 1 1 0 0 0];
CC = [CC;cc1];

for i = 1:47
    cc2 = zeros(1,8);
    c1 = [C(i,2) C(i,4) C(i,5)];
    c2 = sort(c1);
    cc2(c2(1)) = 1;
    cc2(c2(2)) = 1;
    cc2(c2(3)) = 1;
    k = belong(CC,cc2);
    if k == 0
        CC = [CC;cc2];
    end
end

%Configuracion 5: En el inicial, 2,3,5,8

cc1 = [0 1 1 0 1 0 0 1];
CC = [CC;cc1];

for i = 1:47
    cc2 = zeros(1,8);
    c1 = [C(i,2) C(i,3) C(i,5) C(i,8)];
    c2 = sort(c1);
    cc2(c2(1)) = 1;
    cc2(c2(2)) = 1;
    cc2(c2(3)) = 1;
    cc2(c2(4)) = 1;
    k = belong(CC,cc2);
    if k == 0
        CC = [CC;cc2];
    end
end

%Configuracion 6: En el inicial, 3,4,5,7

cc1 = [0 0 1 1 1 0 1 0];
CC = [CC;cc1];

for i = 1:47
    cc2 = zeros(1,8);
    c1 = [C(i,3) C(i,4) C(i,5) C(i,7)];
    c2 = sort(c1);
    cc2(c2(1)) = 1;
    cc2(c2(2)) = 1;
    cc2(c2(3)) = 1;
    cc2(c2(4)) = 1;
    k = belong(CC,cc2);
    if k == 0
        CC = [CC;cc2];
    end
end

%Configuracion 7: En el inicial, 2,4,5,7

cc1 = [0 1 0 1 1 0 1 0];
CC = [CC;cc1];

for i = 1:47
    cc2 = zeros(1,8);
    c1 = [C(i,2) C(i,4) C(i,5) C(i,7)];
    c2 = sort(c1);
    cc2(c2(1)) = 1;
    cc2(c2(2)) = 1;
    cc2(c2(3)) = 1;
    cc2(c2(4)) = 1;
    k = belong(CC,cc2);
    if k == 0
        CC = [CC;cc2];
    end
end

%Configuracion 8: En el inicial, 3,4,5,6,7

cc1 = [0 0 1 1 1 1 1 0];
CC = [CC;cc1];

for i = 1:47
    cc2 = zeros(1,8);
    c1 = [C(i,3) C(i,4) C(i,5) C(i,6) C(i,7)];
    c2 = sort(c1);
    cc2(c2(1)) = 1;
    cc2(c2(2)) = 1;
    cc2(c2(3)) = 1;
    cc2(c2(4)) = 1;
    cc2(c2(5)) = 1;
    k = belong(CC,cc2);
    if k == 0
        CC = [CC;cc2];
    end
end

%Configuracion 9: En el inicial, 2,4,5,6,7

cc1 = [0 1 0 1 1 1 1 0];
CC = [CC;cc1];

for i = 1:47
    cc2 = zeros(1,8);
    c1 = [C(i,2) C(i,4) C(i,5) C(i,6) C(i,7)];
    c2 = sort(c1);
    cc2(c2(1)) = 1;
    cc2(c2(2)) = 1;
    cc2(c2(3)) = 1;
    cc2(c2(4)) = 1;
    cc2(c2(5)) = 1;
    k = belong(CC,cc2);
    if k == 0
        CC = [CC;cc2];
    end
end

%Configuracion 10: En el inicial, 2,3,4,5,6,8

cc1 = [0 1 1 1 1 1 0 1];
CC = [CC;cc1];

for i = 1:47
    cc2 = zeros(1,8);
    c1 = [C(i,2) C(i,3) C(i,4) C(i,5) C(i,6) C(i,8)];
    c2 = sort(c1);
    cc2(c2(1)) = 1;
    cc2(c2(2)) = 1;
    cc2(c2(3)) = 1;
    cc2(c2(4)) = 1;
    cc2(c2(5)) = 1;
    cc2(c2(6)) = 1;
    k = belong(CC,cc2);
    if k == 0
        CC = [CC;cc2];
    end
end


%Configuracion 11: En el inicial, 2,3,4,5,6,7

cc1 = [0 1 1 1 1 1 1 0];
CC = [CC;cc1];

for i = 1:47
    cc2 = zeros(1,8);
    c1 = [C(i,2) C(i,3) C(i,4) C(i,5) C(i,6) C(i,7)];
    c2 = sort(c1);
    cc2(c2(1)) = 1;
    cc2(c2(2)) = 1;
    cc2(c2(3)) = 1;
    cc2(c2(4)) = 1;
    cc2(c2(5)) = 1;
    cc2(c2(6)) = 1;
    k = belong(CC,cc2);
    if k == 0
        CC = [CC;cc2];
    end
end
end

