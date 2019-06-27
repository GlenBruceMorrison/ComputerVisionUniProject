function targetImage = getTargetImage()
    % User diaglouge for gathering target image for composite creation
    [filename, pathname] = uigetfile( ...
        {'*.jpg';'*.png';'*.bmp';'*.*'}, ...
        'Pick an file');

    targetImage = imread(strcat(pathname, filename));
end