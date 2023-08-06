%% calculates average mean activation from n data points. N=networksize(64)

function S=avrg_all(N,n)
S=zeros(15,64,n+1);
a=2.2;
B_end=15;
k_end = 64;
for i=1:n
for B=1:1:B_end  %for inhibition value
    b=  B/100;
    for k=1:1:k_end %for number set
          %number of data points to take average
            [X]=simulate1(N,k,a,b,0);
            s = sum(X)/N;  %average activation in a given trail
            S(B,k,i+1)=s;
            S(B,k,1)=S(B,k,1)+s/n;
         
    end
    
end
n
save('avrg_data3_a2.2_n302.mat','S');
end
end