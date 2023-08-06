%% activation function

function s = activ(x)
s=zeros(size(x)); 
for i=1:length(x)
    if x(i)>0
        s(i)=x(i)/(1+x(i));
    end
end
end