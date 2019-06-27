function [images, labels ] = getImagesFromDirectory(directoryName, imgType)

disp('collecting images');

directory = dir(directoryName);
dirFlags = [directory.isdir];
subFolders = directory(dirFlags);

directory_images = {};

labels = {};

% get sub folders to use as labels
for k = 1 : length(subFolders)
    
    % the first two directories returned in MAtlab are always '.' & '..'
    % we don't want these values
    if k > 2
        
        directoryName_ = strcat(directoryName, '/', subFolders(k).name);
        
        subDir = dir( strcat(directoryName_, '/*', imgType) );
        
        currentLength = numel(directory_images);
        
        for l = 1 : length(subDir)
            
            disp(subFolders(k).name);
            
        	labels = [labels; subFolders(k).name];
            
            file = fullfile(directoryName_, subDir(l).name);
            
            disp(strcat('reading in image ', file));
            
            img = imread(file);
            
            directory_images{l + currentLength} = img;
            
        end
        
    end
    
end

images = directory_images;

end
