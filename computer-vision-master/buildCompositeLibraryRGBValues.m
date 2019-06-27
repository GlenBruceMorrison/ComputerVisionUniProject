function rgbValues = buildCompositeLibraryRGBValues(imageSet, tileWidth, tileHeight)
    % Function shall caculate a given image sets rgb value means and return for
    % later use

    % https://www.mathworks.com/matlabcentral/answers/160076-how-to-read-multiple-images-and-calculate-mean
    meanEachImage = arrayfun(@(x) mean(reshape(imresize(imageSet.read(x),[tileWidth, tileHeight]),[],3)), (1:imageSet.Count)','UniformOutput',false);

    rgbValues = zeros(1, imageSet.Count);

    for i = 1 : size(meanEachImage)
        rgbValues(i) = mean(cell2mat(meanEachImage(i)));
    end
end