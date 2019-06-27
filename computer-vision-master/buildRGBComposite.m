function rgbCompositeBlock = buildRGBComposite(imblock, rgbValues, imageSet, tileWidth, tileHeight)
    % Used with blockproc to process a block and substitute for it's rgb
    % mean value best match
    
    [c index] = min(abs(rgbValues-(mean2(imblock))));
    
    rgbCompositeBlock = resizeImageBlock(imageSet.read(index), tileWidth, tileHeight);
end