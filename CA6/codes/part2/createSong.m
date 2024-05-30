function song = createSong(keys, pushTimes)
    noteMap = {'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'};
    freqs = [523.25, 554.37, 587.33, 622.25, 659.25, 698.46, 739.99, 783.99, 830.61, 880, 932.33, 987.77];
    netMap = [noteMap; num2cell(freqs)];
    
    song = [];
    fs = 8000;
    T=0.5;
    tEnd = T;             
    ts = 1/fs;               
    tha = 0.025;           

    for i = 1:length(keys)
        noteIndex = find(strcmp(netMap(1, :), keys(i))); 
        if isempty(noteIndex)
            error('Invalid key: %s', keys{i});
        end
        fc = freqs(noteIndex);  

        if pushTimes(i) == "T"
            t = 0:ts:tEnd-ts;
        else   pushTimes(i) == "T/2"
            t = 0:ts:(tEnd/2)-ts;
        end

        signal = sin(2*pi*fc*t);
        
        song = [song, signal, zeros(1, tha*fs)];
    end
end
