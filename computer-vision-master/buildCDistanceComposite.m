function cDistanceBlock = buildCDistanceComposite(imblock, histValues, imageSet, tileWidth, tileHeight)
    % Used with blockproc to process a block and substitute for it's
    % Chi-Squared distance best match    
    
    histR = imhist(imblock(:,:,1));
    normHistR = histR ./ sum(histR(:)); % normalisation

    histG = imhist(imblock(:,:,2));
    normHistG = histG ./ sum(histG(:)); % normalisation

    histB = imhist(imblock(:,:,3));
    normHistB = histB ./ sum(histB(:)); % normalisation
        
    for i = 1 : length(histValues)
        imageHist = cell2mat(histValues(i));
        
        cRDistance = normHistR+imageHist(:,1);
        cRDistance(cRDistance==0) = 1;
        rDistance(:,i) = 0.5*sum((normHistR-imageHist(:,1)).^2./cRDistance);
        
        cGDistance = normHistG+imageHist(:,2);
        cGDistance(cGDistance==0) = 1;
        gDistance(:,i) = 0.5*sum((normHistG-imageHist(:,2)).^2./cGDistance);
        
        cBDistance = normHistB+imageHist(:,3);
        cBDistance(cBDistance==0) = 1;
        bDistance(:,i) = 0.5*sum((normHistB-imageHist(:,3)).^2./cBDistance);
    end
    
    totalDistances = rDistance + gDistance + bDistance;
    
    [c, index] = min(totalDistances);
    
    bestCDistanceMatchImage = imageSet.read(index);
    
    cDistanceBlock = resizeImageBlock(bestCDistanceMatchImage, tileWidth, tileHeight);
end