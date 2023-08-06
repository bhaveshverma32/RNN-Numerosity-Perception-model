%% generates number estimation and estimation-error data for all possible combinations of beta and
%set size. generates the data : relative_error_monotonus_Pre_calc.mat

% at every interation instead of simulating the mean activation for a given
% combination of beta and set-size we get the information by loading a
% presimulated mean activation data ; 'avrg_data3_a2.2_n30.mat'

% we load the parameters of the linear fits from 'C_data_monotonus.mat'

%%
function  relative_error = get_back_num_monotonus(M,B)
mean_activ=load('avrg_data3_a2.2_n30.mat');
S = mean_activ.S;
cc = load('C_data_monotonus.mat');
C_data = cc.C_data_monotonus;
% N=64; a=2.2; p=0; 
times=3 ;
if M==0
M = [1,2,3,4,5,6,7,8,9,10,15,20,25,30,35,40,45,50] ;
end
if B==0
B=1:15; 
end

nump = zeros(length(M),length(B),2) ;
relative_error = zeros(length(M),length(B),5) ;
for j=1:length(M)
    m=M(j);
for i=1:length(B)
    b100=B(i)./100 ;
    relative_error(j,i,1) = m ;     %saves current set size
    relative_error(j,i,2) = b100 ;  % saves current inhibition strength
for n = 1:times
%    Ptime=100;
%     [X]=simulate1_inp_Ptime(N,m,a,b100,p,0,Ptime) ;  
%         s = sum(X(X>.08))/N ;
        s=S(B(i),M(j),1); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%pre calculated
        nnn = [1,s] ;
        aa = C_data(B(i),1);  bb = C_data(B(i),2) ;
        nump(j,i,1) = m ;      
        nump(j,i,2) = nnn*[aa;bb] ; % number estimation for current i and j estimation
        relative_error(j,i,3) = relative_error(j,i,3)+nump(j,i,2)./times ; % saves avg estimation
        relative_error(j,i,4) = relative_error(j,i,4)+(abs(nump(j,i,2)-m)/m)./times ;    % saves avg error  
end
end
end
save('relative_error_monotonus_Pre_calc','relative_error');
% beep
% pause(1)
% beep
% pause(1)
% beep
end