function  signalOut=FilteringBanks(signal,bBank,typeOfFilter,gain)
A=gain.*bBank;
B=sum(A, 1);
    
switch typeOfFilter
   case 'filter'
       signalOut = filter(B, 1, signal);
   case 'fftfilter'
        signalOut = fftfilt(B, signal);
    case 'convFilter'
        signalOut = convFilter(B, signal);
end
end

function signalOut=convFilter(B,signal)
        N =size(signal);
        m=N(2);
        signalOut=[];
        for k=1:m
            signalO = conv(B,signal(:,k));
            signalOut = [signalOut, signalO];
        end
    end