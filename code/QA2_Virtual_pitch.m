fs = 44100; 
duration = 0.5; 
t = 0:1/fs:duration-1/fs; 


notes = [293.5, 329.5, 392]; 
generateToneWithHarmonics = @(note, harmonics) sum(sin(2 * pi * note .* t' * harmonics) ./ harmonics, 2);


song_notes = [1, 2, 3, -1, 3, -1, 3, -1, 1, 2, 3, -1, 3, -1, 3, -1];

withoutFundamental = 2:10; 
withoutFirstAndSecond = 3:10; 
melodyNoFundamental = [];
melodyNoFirstAndSecond = [];


for idx = song_notes
    if idx == -1
        melodyNoFundamental = [melodyNoFundamental; zeros(length(t), 1)]; % Add silence for pauses
    else
        melodyNoFundamental = [melodyNoFundamental; generateToneWithHarmonics(notes(idx), withoutFundamental)];
    end
end


for idx = song_notes
    if idx == -1
        melodyNoFirstAndSecond = [melodyNoFirstAndSecond; zeros(length(t), 1)]; % Add silence for pauses
    else
        melodyNoFirstAndSecond = [melodyNoFirstAndSecond; generateToneWithHarmonics(notes(idx), withoutFirstAndSecond)];
    end
end


audiowrite('BabySharkMelodyWithoutFundamental.wav', melodyNoFundamental, fs);
audiowrite('BabySharkMelodyWithoutFirstAndSecondHarmonics.wav', melodyNoFirstAndSecond, fs);
