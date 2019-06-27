function eDistanceBlock = buildEDistanceComposite(imblock, histValues, imageSet, tileWidth, tileHeight)
    % Used with blockproc to process a block and substitute for it's
    % Euclidean distance best match    
    
    histR = imhist(imblock(:,:,1));
    normHistR = histR ./ sum(histR(:)); % normalisation

    histG = imhist(imblock(:,:,2));
    normHistG = histG ./ sum(histG(:)); % normalisation

    histB = imhist(imblock(:,:,3));
    normHistB = histB ./ sum(histB(:)); % normalisation
        
    for i = 1 : length(histValues)
        imageHist = cell2mat(histValues(i));
        
        rDistance(:,i) = sum((normHistR-imageHist(:,1)).^2);
        gDistance(:,i) = sum((normHistG-imageHist(:,2)).^2);
        bDistance(:,i) = sum((normHistB-imageHist(:,3)).^2);
    end
    
    totalDistances = rDistance + gDistance + bDistance;
    
    [c, index] = min(totalDistances);
    
    bestEDistanceMatchImage = imageSet.read(index);
    
    eDistanceBlock = resizeImageBlock(bestEDistanceMatchImage, tileWidth, tileHeight);
end