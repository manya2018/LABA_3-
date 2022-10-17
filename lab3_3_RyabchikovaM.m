%% Filters design

freqArray = [31, 62, 125, 250, 500, 1000, 2000, 4000, 8000,16000];
order = 1024; % должен быть четным
fS = 44100;
bBank=CreateFilters(freqArray,order,fS);


%% Filtering of signals
signal=audioread("song1.mp3");
gain=ones(10,1);
typeOfFilter='filter';
tic
signalOut=FilteringBanks(signal,bBank,typeOfFilter,gain);
toc
type= 'fftfilter';
 tic
signalOuT=FilteringBanks(signal,bBank,type,gain); 
toc