s = [1 1 0 0;0 0 1 1]; %Signal
t=[1,0;0,1];  %Target


%Training of the Network
nos = size(s,1);  %FOR THE NUMBER OF SIGNALS
wt = zeros(size(s,2),size(t,2)); %Initialisation of weight


for i=1:nos
    wt=wt + s(i,:)'*t(i,:);  %Weight updation 
end

disp('Weight Matrix are: ');  %To display the Weight Matrix
disp(wt);

%Testing of Network with Noisy as well as Exact Signal/Target
test=input('Enter Your choice For Forward(enter1) and for Backward(enter2):');

%For Forward direction
if test==1
ts1=[1 1 0 0];
disp('Testing with Exact Signal:'); 
disp('Testing Signal is:'); %To display the testing signals
disp(ts1);
testing(test,ts1,wt,t,nos,s);
fprintf('\n');
fprintf('\n');
%Testing of Network of "Noisy" Signal
ts2=[0 1 0 0];
disp('Testing with Noisy Signal with error 1'); 
disp('Testing Signal is:'); %To display the testing signals
disp(ts2);
testing(test,ts2,wt,t,nos,s);
end

%For Backward Direction
if test==2
ts1=[0 1];
disp('Testing with Exact Signal'); 
disp('Testing Signal is'); %To display the testing signals
disp(ts1);
testing(test,ts1,wt,t,nos,s);
fprintf('\n');
fprintf('\n');
%Testing of Network of "Noisy" Signal
ts2=[0 0];
disp('Testing with Noisy Signal with error 1:'); 
disp('Testing Signal is'); %To display the testing signals
disp(ts2);
testing(test,ts2,wt,t,nos,s);
end

%Testing of the Network

function[]=testing(test,ts,wt,t,nos,s)
if test==1
recin=ts*wt;

for i=1:size(t,2)
    rec(i)= threshold_binary(recin(i),0)
end
disp('Target Corresponding to the testing signal is');
disp(rec);
flag=0;
for i=1:nos
    if rec==t(i,:)
        fprintf('Network has converged with Target  %d',i);
        fprintf('\n');
        flag=1
        break;
    end
end

if flag ==0 
    disp('Network has not Converged');
end
end


if test==2
sin=ts*wt';
for i=1:size(s,2)
    si(i)= threshold_binary(sin(i),0)
end
disp('Signal Corresponding to the testing target is');
disp(si);


flag=0;
for i=1:size(t,2)
    if si==s(i,:)
        fprintf('Network has converged with Target  %d',i);
        flag=1;
        break;
    end    
end
if flag == 0;
    disp('Network has not Converged');
end
end
end

function[output]= threshold_binary(input,threshold)
if input>threshold
    output=1;
else
    output=0;
end
end