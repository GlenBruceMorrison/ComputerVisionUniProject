function ccvCompositeBlock = buildCCVComposite(imblock, ccvValues, imageSet, tileWidth, tileHeight)
    % Used with blockproc to process a block and substitute for it's ccv
    % value best match
    
    bestCCVMatch = 10000;
    bestCCVMatchIndex = 1;
    
    blockCCVValue = reshape(getICCV(imblock), [], 4);
    
    for i = 1 : length(ccvValues)
        c = min(abs(ccvValues{i})-blockCCVValue);

        if c <= bestCCVMatch
            bestCCVMatch = c;
            bestCCVMatchIndex = i;
        end
    end
    
    bestCCVMatchImage = imageSet.read(bestCCVMatchIndex);
    
    ccvCompositeBlock = resizeImageBlock(bestCCVMatchImage, tileWidth, tileHeight);
end

