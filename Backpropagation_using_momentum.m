clc
clear

in_value = [0 0;0 1;1 0;1 1] ;  %input values

t = [0 1 1 1] ;           %target values

input_size = size(in_value,1) ;
hd_layer = 02 ;

weight_ih = [0.6 -0.1;-0.3 0.4] ; 
weight_ih1 = zeros(2,2);
bias_ih = [0.3;0.5] ; 

weight_ho = [0.4 0.1] ;
weight_ho1=zeros(1,2);
bias_ho = -0.2 ;

m = 0.7;
lr = 0.5 ;

for epochs = 1:500
    for i = 1:input_size
        zin = weight_ih * in_value( i,:)' + bias_ih ;
        z = sigmoid_function(zin) ;
        %disp(size(z));
        
        yin = weight_ho * z' + bias_ho ;
        y = sigmoid_function(yin) ;
        %disp(y);
        
        error_fun_o = (t(i) - y) * (y*(1-y)) ;
        d_weight_ho = lr * error_fun_o * z + m * (weight_ho-weight_ho1) ;
        d_bias_ho = lr * error_fun_o ;
        
        for j = 1:size(z)
            error_fun_h = error_fun_o * weight_ho * (z(j)*(1-z(j))) ;
        end
        %disp(size(error_fun_h));
        
        d_weight_ih = lr * error_fun_h' * in_value(i,:) + m * (weight_ih-weight_ih1)  ; 
        d_bias_ih = lr * error_fun_h' ;
        weight_ho1 = weight_ho;
        weight_ih1=weight_ih;
        weight_ih = weight_ih + d_weight_ih ;
        bias_ih = bias_ih + d_bias_ih ;
        weight_ho = weight_ho + d_weight_ho ;
        bias_ho = bias_ho + d_bias_ho ;
        
        error = (t(i)-y) ;
        square_error(i) = error * error ;
    end
    mean_square_error(epochs) = mean(square_error) ;
    
end

fprintf( " Final  values from input  to hidden layer weights after %d epoch \n ",epochs ) ;
disp( weight_ih ) ;

fprintf( " Final values from bias at hidden layers after %d epoch \n ",epochs ) ;
disp( bias_ih ) ;

fprintf( " Final values from hidden layer to output layer weights after %d epoch \n ",epochs ) ;
disp( weight_ho ) ;

fprintf( " Final values from bias at output layers after %d epoch \n ",epochs ) ;
disp( bias_ho ) ;

fprintf( "  Error obtained  \n ", square_error ) ;
disp(  square_error ) ;

plot( mean_square_error,'b--','LineWidth',2 ) ;
xlabel("epoch");
ylabel("mean square Error");