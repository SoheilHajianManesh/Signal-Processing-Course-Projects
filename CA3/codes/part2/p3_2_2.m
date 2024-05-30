[a,Fs]=audioread("y.wav");
Ton=0.1;
Toff=0.1;
num_intervals = floor(length(a) / ((Ton+Toff) * Fs));
intervals = cell(1, num_intervals);
for i = 1:num_intervals
    if(i==1)
        startIdx=1;
    else
        startIdx = startIdx+((Ton+Toff) * Fs);
    end
    endIdx = startIdx+round((Ton+Toff) * Fs)-1;
    intervals{i} = a(startIdx:endIdx)';
end
identifier=cell(1, 12);
i=1;
for r=1:4
    for c=1:3
        identifier{i}=makeDigitSignal(r,c);
        i=i+1;
    end
end
result="";
for i = 1:length(intervals)
    maxCorr = -inf;
    maxCorrIndex = -1;
    for j = 1:length(identifier)
        correlation = corr2(intervals{i}, identifier{j});
        if correlation > maxCorr
            maxCorr = correlation;
            maxCorrIndex = j;
        end
    end
    if(maxCorrIndex==10)
            result=result+'*';
    elseif(maxCorrIndex==11)
            result=result+'0';
    elseif(maxCorrIndex==12)
            result=result+'#';
    else
            result=result+maxCorrIndex;
    end
end
figure
plot(a);
disp(result);




