function label = Knn(testData, trainingData, k, labels)
   
    format short g
   
    v1 = [cell2mat(trainingData(:, 1)), cell2mat(trainingData(:, 2))];
    v2 = [cell2mat(testData(1, 1)), cell2mat(testData(1, 2))];
    
    dataLength = numel(v1(:, 1));
    distData = zeros(dataLength);
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculate distance between test vector and all training
    % vectors
    for i = 1 : dataLength
        
        currectVector = [v1(i, 1), v1(i, 2)];
        
        % Euclidean Distance
        dist  = sqrt(sum((v2 - currectVector) .^ 2));
        
        distData(i) = dist;
            
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Sort all vectors in ascending order to get the closest ones
    % Keep previous index so we can use it to get relevant labels
    [~, unsorted] = sort(distData , 'ascend');
    
    nearestLabels = cell(k, 1);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Get labels of k nearest vector points
    for i = 1 : k
       
        unsortedVal = unsorted(1, i);
        
        nearestLabels{i, 1} = labels{unsortedVal, 1};
        
    end
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % find highest occurence of a cell from a list of cells
    y = unique(nearestLabels);
    
    n = zeros(length(y), 1);
    
    for iy = 1:length(y)
        
      n(iy) = length(find(strcmp(y{iy}, nearestLabels)));
      
    end
    
    [~, itemp] = max(n);

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % return final value
    label = y(itemp);
    
    
    disp('prediction');
    disp(label);

end