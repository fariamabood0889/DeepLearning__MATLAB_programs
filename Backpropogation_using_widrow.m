clc
clear
in_nodes = 2;
hd_nodes = 3;
output_nodes = 2;
lr = 0.7;

beta_h = lr * (hd_nodes)^(1/in_nodes); %hd_nodes is the number of units in the hidden layer, in_nodes is the number
                                          %of units in the input layer.
                                          
beta_o = lr* (output_nodes)^(1/hd_nodes); %output_nodes is the number of units in the hidden layer, hd_nodes is the number
                                          %of units in the input layer.

bias_h = beta_h-(beta_h * rand(1,hd_nodes));  

bias_o = beta_o-(beta_o * rand(1,output_nodes));

wt_ih = 0.5-(0.5 * rand(hd_nodes,in_nodes));   
wt_ho = 0.5-(0.5 * rand(hd_nodes,output_nodes));

%compute the value of vih 
vih = 0;
for i=1:hd_nodes
    for j=1:in_nodes
        vih = vih+wt_ih(i,j)*wt_ih(i,j);
    end
end
vih = sqrt(vih);

vho = 0;
for i=1:hd_nodes
    for j=output_nodes
        vho = vho+wt_ho(i,j)*wt_ho(i,j);
    end
end
vho = sqrt(vho);


final_wt_ih = zeros(hd_nodes,in_nodes);    
%final initialization from input to hidden layer 
for i=1:hd_nodes
    for j=1:in_nodes
        final_wt_ih(i,j) = wt_ih(i,j)*beta_h/vih;
    end
end

fprintf("initial values of input to hidden weights are: \n");
disp(wt_ih);
fprintf("final values of input to hidden weights are: \n");
disp(final_wt_ih);


%final initialization from hidden to output layer
final_wt_ho = zeros(hd_nodes,output_nodes);
for i=1:hd_nodes
    for j=1:output_nodes
        final_wt_ho(i,j) = wt_ho(i,j)*beta_o/vho;
    end
end


fprintf("initial values of  hidden to output weights are: \n");
disp(wt_ho);
fprintf("final values of hidden to output weights are: \n");
disp(final_wt_ho);