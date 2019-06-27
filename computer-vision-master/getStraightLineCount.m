function val = getStraightLineCount(img)
    
    i = 3;

    BW = rgb2gray(img);
    
    BW = edge(BW,'log', 0.01);
    

    [H,T,R] = hough(BW);
    
    
    if i == 1
            imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');xlabel('\theta'), ylabel('\rho');axis on, axis normal, hold on;
    end
            
    
    P = houghpeaks(H, 20);
    
    x = T(P(:,2)); y = R(P(:,1));
    
    
    %
    if i == 1
           plot(x,y,'s','color','white');
    end
    %
    
    
    lines = houghlines(BW,T,R,P);
    
    
    %
    if i == 1
            figure, imshow(BW), hold on
    end
    %
    

    for k = 1:length(lines)

       xy = [lines(k).point1; lines(k).point2];
       
        %
        if i == 1
            plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','green');plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
        end
        %

    end
    
    g = [];
        
    for i = 1: numel(lines)
        
        t = lines(i).theta;
        
        g = [g t];
    end

    val = numel(lines);%g;
    
end

