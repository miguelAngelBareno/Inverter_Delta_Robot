function Save_result_2(F,L1,L2,L3)
Dimentions=[L1 L2 L3 ];
File = [F,L1,L2,L3];
ex=fopen('Data_T.txt','a+'); 
fprintf(ex,'%12.3f    %12.3f  %12.3f  %12.3f  %12.3f    \n',File); 
fclose(ex); 
   