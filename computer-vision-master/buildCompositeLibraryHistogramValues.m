function histogramValues = buildCompositeLibraryHistogramValues(imageSet, tileWidth, tileHeight)
    % Function shall caculate a given image sets histogram values and return for
    % later use
    
    histogramValues = cell(1, imageSet.Count);
    
    for i = 1 : length(histogramValues)
        I = imresize(imageSet.read(i),[tileWidth, tileHeight]);
        
        histR = imhist(I(:,:,1));
        normHistR = histR ./ sum(histR(:)); % normalisation
        
        histG = imhist(I(:,:,2));
        normHistG = histG ./ sum(histG(:)); % normalisation
        
        histB = imhist(I(:,:,3));
        normHistB = histB ./ sum(histB(:)); % normalisation
        
        histogramValues{i} = [normHistR, normHistG, normHistB];
    end
end

