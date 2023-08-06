%% generates the parameters of linear fits only from the largest monotonic regions of the
% relation between set-size and mean activation.
%generates : C_data_monotonus.mat

% at every interation instead of simulating the mean activation for a given
% combination of beta and set-size we get the information by loading a
% presimulated mean activation data ; 'avrg_data3_a2.2_n30.mat'

% for each inhibition gives only one curve corresponding to the longest
% monotonic region
%%
mean_activ=load('avrg_data3_a2.2_n30.mat');
S = mean_activ.S;
% S=ones(size(S));
M = 1:50 ;
B=1:15;
monolist=zeros(15,50);
for b100=B
%    b100 %for inhibition value
%    normA = S(b100,:,1) - min(S(b100,:,1));
%    normA = normA ./ max(S(b100,:,1)); 
    for m = M
        m_last = m;
        for m_next = m+1:50
            if  S(b100,m_last,1) < S(b100,m_next,1)
                monolist(b100,m)= m_next-m;   %  monolist=length of monotonc region after each m, for each b
                m_last = m_next;
            else
                break;
            end
        end
        
    end
end
[maxmono,I] = max(monolist,[],2);  % finds maximum length monotonic region
C_data_monotonus=zeros(15,2);
for b100 = B
    mdl = fitlm(S(b100,I(  b100):I(b100)+maxmono(b100),1) ,  I(b100):I(b100)+maxmono(b100) );
    C = mdl.Coefficients.Estimate;
    C_data_monotonus(b100,1:2) = C; 
end
% for b100 = B
%     mdl2 = fitlm( I(b100):I(b100)+maxmono(b100),S(b100,I(  b100):I(b100)+maxmono(b100),1) );
%     C2 = mdl2.Coefficients.Estimate;
%     C_data_monotonus2(b100,1:2) = C2; 
% end

save('C_data_monotonus.mat','C_data_monotonus');
%end

