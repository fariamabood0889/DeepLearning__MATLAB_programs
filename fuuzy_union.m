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
k=1;%point my union fuzzy set which is cf

for i=1:l1
    if ~any(Cf(1,:)==Af(1,i))
        loc=find(Bf(1,:)==Af(1,i));
        Cf(1,k)=Af(1,i);
        if isempty(loc)
            Cf(2,k)=Af(2,i);
        else
            Cf(2,k)=max(Af(2,i),Bf(2,loc));
        end
        k=k+1;
    else
        loc=find(Cf(1,:)==Af(1,i));
        if ~isempty(loc)
            Cf(2,loc)=max(Cf(2,loc),Af(2,i));
        end
    end
end

for i=1:l2
    if ~any(Cf(1,:)==Bf(1,i))
        loc=find(Af(1,:)==Bf(1,i));
        Cf(1,k)=Bf(1,i);
        if isempty(loc)
            Cf(2,k)=Bf(2,i);
        else
            Cf(2,k)=max(Af(2,loc),Bf(2,i));
        end
        k=k+1;
    else
        loc=find(Cf(1,:)==Af(1,i));
        if ~isempty(loc)
            Cf(2,loc)=max(Cf(2,loc),Af(2,i));
        end
    end
end

Cf=sortrows(Cf')';
str=sprintf('Value of Cf obtained after union is:  ');
disp(str);
disp(Cf);