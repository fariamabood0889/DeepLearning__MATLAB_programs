clc
clear
in=[0 0;0 1;1 0;1 1];
t=[1 1 1 0];
alpha=0.1;
wt=[0 0];
b=0;

for epoch=1:1
 for i=1:4
     yin=in*wt';
    diff=t(i)-yin(i);
    dw=b+(alpha*diff*in(i,:));
    wt=wt+dw;
    db=alpha*diff;
    b=b+db;
    
 end
end

yin=in*wt';
for i=1:4
 y(i)=threshold_Adaline_nand(yin(i),1);
end

   se=t-y;
   er=se.^2;


str=sprintf('FINAL adaline Weight for OR Problem:');
disp(str);
disp(wt);
str=sprintf('Error obtained after applying adaline weight for an OR problem:');
disp(str);
disp(er);
