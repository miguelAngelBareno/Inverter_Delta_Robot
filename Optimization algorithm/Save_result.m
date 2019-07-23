function Save_result(F,L1,L2,L3)
ver=F
Dimentions=[L1 L2 L3]
File = [F,L1,L2,L3];
ex=fopen('Data.txt','a+'); 
fprintf(ex,'%12.3f    %12.3f  %12.3f  %12.3f  %12.3f    \n',File); 
fclose(ex); 
   