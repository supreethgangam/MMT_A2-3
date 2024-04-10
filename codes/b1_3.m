samplesDir = 'C:\Users\91950\OneDrive\Desktop\MMT\2020101021\MMT_Assignment_2-3\samples';
musicFiles = {'michael_jackson.mp3', 'dream_theater.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swft.mp3'};

for i = 1:length(musicFiles)
    filePath = fullfile(samplesDir, musicFiles{i});
    audio = miraudio(filePath);

    frameLength = 2; 
    hopSize = 2; 
    tempo = mirtempo(audio, 'Frame', frameLength, hopSize);
    
    tempodata = mirgetdata(tempo);
    fprintf('Frame-based tempo estimation for %s:\n', musicFiles{i});
    disp(tempodata);
    fprintf('Tempo range for %s: %.2f BPM to %.2f BPM\n', musicFiles{i}, min(tempodata), max(tempodata));
    
    % Plotting tempo variation over time
    figure;
    t = (0:length(tempodata)-1) * hopSize; % Time points
    plot(t, tempodata);
    xlabel('Time (s)');
    ylabel('Tempo (BPM)');
    title(['Tempo Variation for ' musicFiles{i}]);
    grid on;
end
