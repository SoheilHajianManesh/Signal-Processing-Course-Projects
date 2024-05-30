melodyNotes = ["D", "D", "G", "F#", "D", "D", "E", "E", "D", "F#", "D", "E", "D", "E", "F#", "E", ...
               "D", "E", "E", "D", "F#", "D", "E", "D", "E", "D", "F#", "E", "D", "E", "D", "F#", ...
               "E", "D", "D", "E", "F#", "E", "F#", "F#", "E", "F#", "F#", "D"];
durationSymbols = ["T/2", "T/2", "T", "T", "T", "T/2", "T/2", "T/2", "T/2", "T/2", "T/2", "T", ...
                   "T", "T", "T", "T", "T/2", "T/2", "T/2", "T/2", "T/2", "T/2", "T", "T", "T/2", ...
                   "T/2", "T", "T", "T", "T/2", "T/2", "T", "T", "T/2", "T/2", "T", "T/2", "T/2", ...
                   "T", "T/2", "T/2", "T", "T", "T"];

pitchNames = {'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'};
pitchFrequencies = [523.25, 554.37, 587.33, 622.25, 659.25, 698.46, 739.99, 783.99, 830.61, 880, 932.33, 987.77];

sampleRate = 8000; 
noteDurationTime = 0.5; 
pauseDuration = 0.025;

audioSignal = createSong(melodyNotes, durationSymbols);
audiowrite("final_song.wav", audioSignal, sampleRate);  

actualDurations = zeros(size(durationSymbols));
for idx = 1:length(durationSymbols)
    if strcmp(durationSymbols{idx}, 'T')
        actualDurations(idx) = noteDurationTime;
    elseif strcmp(durationSymbols{idx}, 'T/2')
        actualDurations(idx) = noteDurationTime/2;
    end
end

for noteIdx = 1:length(melodyNotes)
    startSample = round((sum(actualDurations(1:noteIdx-1)) + (noteIdx-1) * pauseDuration) * sampleRate) + 1;
    endSample = round((sum(actualDurations(1:noteIdx-1)) + actualDurations(noteIdx) + (noteIdx-1) * pauseDuration) * sampleRate);
    noteSegment = audioSignal(startSample:endSample);
    noteFourier = fftshift(fft(noteSegment));
    noteMagnitude = abs(noteFourier);   
    freqVector = (-sampleRate/2):(sampleRate/length(noteSegment)):(sampleRate/2)-(sampleRate/length(noteSegment));
    [maxValue, peakIndex] = max(noteMagnitude);
    dominantFrequency = abs(freqVector(peakIndex)); 
    freqDiff = abs(pitchFrequencies - dominantFrequency);
    [minDifference, closestPitchIdx] = min(freqDiff);
    detectedNote = pitchNames{closestPitchIdx};
    
    fprintf("Detect Note: %s ,", detectedNote);
end