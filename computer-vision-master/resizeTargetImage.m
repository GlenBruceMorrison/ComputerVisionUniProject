function resizedTargetImage = resizeTargetImage(targetImage, rows, columns)
    % Resize the target image to user defined scale
    resizedTargetImage = imresize(targetImage, [rows, columns]);
end