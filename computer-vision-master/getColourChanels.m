function [R, G, B] = getColourChanels(img)

    
    lab = rgb2lab(img);
    
    %lab = img;
    
    R = lab(:, :, 1); 
    G = lab(:, :, 2); 
    B = lab(:, :, 3);
    
    R = mean(mean(R));
    G = mean(mean(G));
    B = mean(mean(B));
    
    %R = double(R);
    %G = double(G);
    %B = double(B);
    
end