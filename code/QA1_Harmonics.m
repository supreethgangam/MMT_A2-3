fs = 44100; 
duration = 0.5; 
t = 0:1/fs:duration-1/fs; 

notes = [293.5, 329.5, 392]; 

generateToneWithHarmonics = @(note, harmonics) sum(sin(2 * pi * note .* t' * harmonics) ./ harmonics, 2);


allHarmonics = 1:10;
oddHarmonics = [3, 5, 7];
evenHarmonics = [2, 4, 6];
song_notes = [1, 2, 3, -1, 3, -1, 3, -1, 1, 2, 3, -1, 3, -1, 3, -1];

melodyAll = [];
melodyOdd = [];
melodyEven = [];


for idx = song_notes
    if idx == -1
        melodyAll = [melodyAll; zeros(length(t), 1)]; 
    else
        melodyAll = [melodyAll; generateToneWithHarmonics(notes(idx), allHarmonics)];
    end
end

for idx = song_notes
    if idx == -1
        melodyOdd = [melodyOdd; zeros(length(t), 1)]; 
    else
        melodyOdd = [melodyOdd; generateToneWithHarmonics(notes(idx), oddHarmonics)];
    end
end

for idx = song_notes
    if idx == -1
        melodyEven = [melodyEven; zeros(length(t), 1)]; 
    else
        melodyEven = [melodyEven; generateToneWithHarmonics(notes(idx), evenHarmonics)];
    end
end


audiowrite('BabySharkMelody.wav', melodyAll, fs);
audiowrite('BabySharkMelodyOdd.wav', melodyOdd, fs);
audiowrite('BabySharkMelodyEven.wav', melodyEven, fs);
