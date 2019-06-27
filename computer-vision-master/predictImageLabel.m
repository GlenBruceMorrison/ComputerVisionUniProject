% This implementation works but relies heavily on matlabs provided
% functions

% Added for testing/comparison reasons etc.

% Tests a given image on a given set of training images

function labelName = predictImageLabel(img, trainingSet)

    setDir  = fullfile(trainingSet);

    imds = imageDatastore(setDir,'IncludeSubfolders',true,'LabelSource','foldernames');

    [trainingSet,testSet] = splitEachLabel(imds,0.3,'randomize');

    disp('Generating Bag Of Features');
    bag = bagOfFeatures(trainingSet);

    disp('Training Image Classifier');
    categoryClassifier = trainImageCategoryClassifier(trainingSet,bag);

    disp('Evaluating Classifier');
    confMatrix = evaluate(categoryClassifier,testSet);
    mean(diag(confMatrix));


    disp('Testing Selected Image');
    [labelIdx, scores] = predict(categoryClassifier, img);


    disp(categoryClassifier.Labels(labelIdx));
    labelName = categoryClassifier.Labels(labelIdx);

end