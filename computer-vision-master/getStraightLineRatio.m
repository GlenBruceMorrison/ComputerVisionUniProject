function ratio = getStraightLineRatio(image)

    BW = rgb2gray(image);
    
    BW = edge(BW,'log', 0.01);
    
    [H,T,R] = hough(BW);
    
    
    P = houghpeaks(H, 20);
    
    lines = houghlines(BW,T,R,P);
   
    count = 0;
   
    for i = 1: numel(lines)
        t = lines(i).theta;
        if  t == 0 || t == 360 ||t == -360 || t == 180 || t == -180
          count = count + 1;
       end
    end

    ratio = count / numel(P);

end