audioFilePath = 'C:\Users\91950\OneDrive\Desktop\MMT\2020101021\MMT_Assignment_2-3\data\01.wav';
audio = miraudio(audioFilePath);

chroma = mirchromagram(audio, 'Frame', 0.2, 0.1); 

chromaData = mirgetdata(chroma);


if any(isinf(chromaData(:))) || any(isnan(chromaData(:)))
    error('Chroma data contains infinite or NaN values.');
else
    disp('Chroma data looks good. Proceeding with manual similarity matrix calculation...');
end


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
title('Computed Similarity Matrix of "0.wav"');
xlabel('Frame Index');
ylabel('Frame Index');
colorbar;
