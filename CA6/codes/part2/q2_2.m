keys = ["A","A","B","A","D","C#","A","A","B","A","E","D","A","A","A","F#","D","C#","B","G","G","F#","D","E","D"];
pushTimes = ["T/2","T/2","T","T/2","T","T","T/2","T/2","T","T/2","T","T","T/2","T/2","T","T","T","T","T","T/2","T/2","T","T","T","T"];
songSignal = createSong(keys, pushTimes);
fs = 8000;
sound(songSignal, fs);
audiowrite("mysong.wav",songSignal,fs);
