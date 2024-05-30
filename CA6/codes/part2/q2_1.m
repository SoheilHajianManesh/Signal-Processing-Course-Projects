keys = ["D","D","G","F#","D","D","E","E","D","F#","D","E","D","E","F#","E","D","E","E","D","F#","D","E","D","E","D","F#","E","D","E","D","F#","E","D","D","E","F#","E","F#","F#","E","F#","F#","D"];
pushTimes = ["T/2","T/2","T","T","T","T/2","T/2","T/2","T/2","T/2","T/2","T","T","T","T","T","T/2","T/2","T/2","T/2","T/2","T/2","T","T","T/2","T/2","T","T","T","T/2","T/2","T","T","T/2","T/2","T","T/2","T/2","T","T/2","T/2","T","T","T"];
songSignal = createSong(keys, pushTimes);
fs = 8000;
sound(songSignal, fs);