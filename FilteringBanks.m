function  signalOut=FilteringBanks(signal,bBank,typeOfFilter,gain)
A=gain.*bBank;
B=diff(A,length(A)-1,2);
typeOfFilter='filter';
switch typeOfFilter
   case 'filter'
       signalOut = filter(B, 1, signal);
   case 'fftfilter'
        signalOut = fftfilt(B, signal);
    case 'convFilter'
        signalOut = convFilter(B, signal);
end