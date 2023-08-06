function X=simulate1(N,k,a,b,p)
    
X=ones(1,N);
X=X.*.0;
%a=2.2;       %self excitation
%b=.2;      %mutual inhibition
%Xm=X;

dt = .01;         % set the time step interval
time = 0;         % set the start time=0
tfinal = 30;      % end time of the simulation
Nsteps = round(tfinal/dt);

% k: number of cells recieving input signal
% it(input time): duration for recieving input signal

it=50;             % it(input time): duration for recieving input signal
it=100;             % it(input time): duration for recieving input signal

i=.33 ;              % amount of input signal at a timestep
noise=.3.*randn(Nsteps,N);  % noise
I=zeros(Nsteps,N);   % empty array for input signal
I(1:it , 1:k)=i;    % value=i for 'k' cell for  'it' amount of time 



Y=zeros(Nsteps,N);
%Ym=zeros(Nsteps,N);


for a=a

    for j=1:Nsteps            % iterate over time

        X=update2(j,X,I,noise,dt,a,b);
        %Xm=update_mul(j,Xm,I,dt,a,b);


        Y(j,:)=X;           % store cell activation values after each time step
        %Ym(j,:)=Xm;
    end
    if p==1
        Nsteps=3000;
        Y=Y(1:Nsteps,:);
        
        plot(1:Nsteps,Y(:,1),':',1:Nsteps,Y(:,3),':',1:Nsteps,Y(:,N-3),':',1:Nsteps,Y(:,N-1),':',1:Nsteps,Y(:,N),'-');
        plot(1:Nsteps,Y,'-');
        hold on;
        
        %plot for multiplicative variant
        %plot(1:Nsteps,Ym(:,1),'--',1:Nsteps,Ym(:,3),'--',1:Nsteps,Ym(:,N-3),'--',1:Nsteps,Ym(:,N-1),':',1:Nsteps,Ym(:,N),'-');
        %plot(1:Nsteps,Ym,'-');
        %hold on;
        
        xlabel('time')
        ylabel('activation');
        title(['RNN numerosity model, a= ', a ,' b=',b,"dt=",dt,"i=",i,]);%,b,"dt=",dt,"i=",i,end
    end

end
end