function  [signalOut, initB]=FilteringBanks(signal,bBank,typeOfFilter,gain,initB)
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
[signalOut, initB] = filter(b, 1, signal, initB); 
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