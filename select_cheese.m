function [profit, cheeses] = select_cheese(weights, profits, capacity)
% SELECT_CHEESE the company wants to select the cheeses which 
% will maximize profit, because they cannnot take all the cheese at once.
% [profit, cheeses] = select_cheese(weights, profits, capacity) calculates
% the maximum profit and the amount of weight that should be put in the van

n = length(weights); 
    %a vector of length n
index = 1:n; 
cheese = zeros(1, n); 
ratio = [profits ./ weights]; 

 A = [weights; profits; ratio; index]; 
    % Matrix A gives the number of weights, profits, the ratio and the
    % indices of the cheeses
newA = sortrows(A', 3, 'descend'); 
    % New matrix newA after sorting the rows of A in descending order
maxProfit = 0; 
    % Starting with a value of zero 
    
    for i = 1:n
        capacity = capacity - newA(i, 1);

        if capacity > 0 
                % If the van is full, so the van cannot take the full stock
                % at once
            cheese(newA(i, 4)) = newA(i, 1);
            maxProfit = maxProfit + newA(i, 2);

        else
            capacity < 0 
                % The van is filled with the entire stock, but there is still
                % room for more cheese
            space = capacity + newA(i, 1);
            cheese(newA(i, 4)) = space;
            maxProfit = maxProfit + (space * newA(i, 3)); 
                % Capacity time the ratio gives the profits
            break 
                % stop searching further for maximum profit
        end
    end

profit = maxProfit; 
cheeses = cheese; 
end