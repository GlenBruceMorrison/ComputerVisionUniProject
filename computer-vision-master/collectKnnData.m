function data = collectKnnData(imageSet, xType, yType)

    disp('collecting data on images');
    
    imageSetSize = numel(imageSet);

    data = cell(20000,21);
    
    for i = 1 : imageSetSize

        disp(i);
        
        % get the image to be evaluated
        image = imageSet{i};

        switch xType
            case 'Color'
                [R, G, B] = getColourChanels(image);
                data{i, 1} = mean([R, G, B]);
            case 'Edge Intensity'
                data{i, 1} = getEdgeIntensity(image);
            case 'Straight Lines'
                data{i, 1} = numel(getStraightLineCount(image));
            case 'Entropy'
                I = rgb2gray(image);
                data{i, 1} = entropy(I);
            case 'Straight Line Ratio'
                data{i, 1} = getStraightLineRatio(image);
        end
        
        %if strcmp(yType, xType)
            
            %data{i, 1} = data{i, 2};
            
        %else
            
            switch yType
                case 'Color'
                    [R, G, B] = getColourChanels(image);
                    data{i, 2} = mean([R, G, B]);
                case 'Edge Intensity'
                    data{i, 2} = getEdgeIntensity(image);
                case 'Straight Lines'
                    data{i, 2} = numel(getStraightLineCount(image));
                case 'Entropy'
                    I = rgb2gray(image);
                    data{i, 2} = entropy(I);
                case 'Straight Line Ratio'
                    data{i, 2} = getStraightLineRatio(image);
            end
            
        %end
        
    end

end