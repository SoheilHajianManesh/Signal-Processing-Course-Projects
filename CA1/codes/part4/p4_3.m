function p4_3(voice,speed,ferq)
    if(speed==2)
        fprintf('errors value is not correct')

        doubleVoice = zeros(round(size(voice,1)/2),2);
        for i=1:size(doubleVoice,1)
            doubleVoice(i)=voice(2*i);
        end
        sound(doubleVoice,ferq);
    elseif(speed==0.5)
        halfVoice=zeros(round(size(voice,1)*2),2);
        for i=1:size(voice,1)
          halfVoice(2*i-1)=voice(i);
          halfVoice(2*i)=(voice(i)+voice(i+1))/2;
        end
        sound(halfVoice,ferq);
    else
        fprintf('errors value is not correct');
    end 
end

