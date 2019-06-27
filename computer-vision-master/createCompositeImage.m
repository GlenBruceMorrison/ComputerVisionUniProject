function compositeImage = createCompositeImage(targetImage, tileWidth, tileHeight, compositeFunction)
    % Create the composite image using the blockproc function and our
    % desired comptite type
    
    compositeImage = blockproc(targetImage, [tileWidth, tileHeight], compositeFunction, 'UseParallel', true);
end