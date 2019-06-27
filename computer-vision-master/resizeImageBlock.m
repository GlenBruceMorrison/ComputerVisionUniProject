function resizedImageBlock = resizeImageBlock(image, rows, columns)
    
    resizedImageBlock = imresize(image, [rows, columns]);
end