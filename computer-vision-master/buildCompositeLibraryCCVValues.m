function ccvValues = buildCompositeLibraryCCVValues(imageSet, tileWidth, tileHeight)
    % Function shall caculate a given image sets ICCV values and return for
    % later use

    ccvValues = arrayfun(@(x) reshape(getICCV(imresize(imageSet.read(x), [tileWidth, tileHeight])), [], 4), (1:imageSet.Count)','UniformOutput',false);
end