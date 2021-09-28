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

%Testing of Network of Exact Signal
ts1=[1 1 0 0];
disp('Testing with Exact Signal:'); 
disp('Testing Signal is:'); %To display the testing signals
disp(ts1);
testing(ts1,wt,t,nos);
fprintf('\n');
fprintf('\n');

%Testing of Network of "Noisy" Signal
ts2=[0 1 0 0];
disp('Testing with Noisy Signal with error 1:'); 
disp('Testing Signal is:'); %To display the testing signals
disp(ts2);
testing(ts2,wt,t,nos);

function[]=testing(ts,wt,t,nos)
recin=ts*wt;
for i=1:size(t,2)
    rec(i)= threshold_binary(recin(i),0)
end
disp('Recall Target by Model using Training:');
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

function[output]= threshold_binary(input,threshold)
if input>threshold
    output=1;
else
    output=0;
end
end