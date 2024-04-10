samplesDir = 'C:\Users\91950\OneDrive\Desktop\MMT\2020101021\MMT_Assignment_2-3\samples';
musicFiles = {'michael_jackson.mp3', 'dream_theater.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swft.mp3'};

for i = 1:length(musicFiles)
    filePath = fullfile(samplesDir, musicFiles{i});
    audio = miraudio(filePath);
    tempo = mirtempo(audio);
    fprintf('Estimated tempo for %s: ', musicFiles{i});
    mirgetdata(tempo)
    
end
