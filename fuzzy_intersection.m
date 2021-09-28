clc
clear
Af=[10 20 60 70 80;
    0.1 0.5 0.8 0.4 0.6];
disp('fuzzy set of Af is:');
disp(Af);

Bf=[20 40 60 50 30;
    0.9 0.2 0.4 0.3 0.7];
disp('fuzzy set of Bf is:');
disp(Bf);

l1=size(Af,2);
l2=size(Bf,2);
Cf(1,1)=0;
k=1;


for i=1:l1
    loc=find(Bf(1,:)==Af(1,i));
    if ~isempty(loc)
        Cf(1,k)=Af(1,i);
        Cf(2,k)=min(Af(2,i),Bf(2,loc));
        k=k+1;
    end
end
Cf=sortrows(Cf')';
str=sprintf('Value of Cf obtained after intersection is: ');
disp(str);
disp(Cf);