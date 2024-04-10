samplesDir = 'D:/mmt23/Assignment 2&3/samples';
musicFiles = {'michael_jackson.mp3', 'dream_theater.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swft.mp3'};

for k = 1:length(musicFiles)
    filePath = fullfile(samplesDir, musicFiles{k}); 
    
    
    audio = miraudio(filePath);
    chroma = mirchromagram(audio, 'Frame', 0.2, 0.1); 
    chromaData = mirgetdata(chroma);
    numFrames = size(chromaData, 2); 
    similarityMatrix = zeros(numFrames, numFrames);

    for i = 1:numFrames
        for j = 1:numFrames
            similarityMatrix(i, j) = norm(chromaData(:, i) - chromaData(:, j));
        end
    end
    

    similarityMatrix = 1 - (similarityMatrix ./ max(similarityMatrix(:)));
    figure;
    imagesc(similarityMatrix);
    title(['Manually Computed Similarity Matrix of "', musicFiles{k}, '"']);
    xlabel('Frame Index');
    ylabel('Frame Index');
    colorbar;
end
