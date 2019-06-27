function edgeIntensity = getEdgeIntensity(image)

    I = rgb2gray(image);
    
    imresize(I, [150, 150]);

    BW = edge(I,'zerocross');

    edgeIntensity = sum(BW(:) == 1);

end