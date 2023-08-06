

function X = update2(j,X,I,noise,dt,a,b)

Y=X; %dummy variable
y=1;


for i=1:length(X)
    Ii=I(j,i);
    noise_i=noise(j,i);
    
    xi = X(i); 
    restX=[X(1:i-1) X(i+1:end)];
    
    %xi= y*xi + (1-y)*(a*activ(xi)-b*sum(activ(restX))+Ii);  % STM paper 
    %xi =  a*activ(xi)-b*sum(activ(restX))+Ii;              % RNN paper
    xi = xi + ( -xi + a*activ(xi) - b*sum(activ(restX)) + Ii + noise_i)*dt ; % general euler
    
    if xi<0
        xi=0;
    end
    Y(i)=xi;
end
X=Y;
end