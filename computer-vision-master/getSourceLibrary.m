function sourceLibrary = getSourceLibrary()
    % User diaglouge for gathering source image for composite creation
    sourceDirectory = uigetdir;

    sourceLibrary = imageSet(fullfile(sourceDirectory));
end