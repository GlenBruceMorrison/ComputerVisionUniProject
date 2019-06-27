function [tileWidth, tileHeight] = setTileSizes(totalTileCount,numPixelsX, numPixelsY)
    % Set the application tile sizes based on user inputs
    dimension = sqrt(str2double(totalTileCount));

    tileWidth = numPixelsY/dimension;
    tileHeight = numPixelsX/dimension;
end