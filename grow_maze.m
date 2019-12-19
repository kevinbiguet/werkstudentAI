function [B] = grow_maze(A, steps)
% GROW_MAZE is a function to build a maze of cells who survives or dies during the
% current generation. 
% [B] = grow_maze(A, steps) calculates new generations depending on the
% state(on or off) of the neighbour cells

if steps == 0 
   B = A;     
end
% If there need t be zero new genertions computed, the new generation will
% be the same as the last one.

for s = 1:steps 
         %Now there will be steps greater than zero, so after an arbitrary amount
         %of steps the new generation will be calculated.
 
    [m,n] = size(A); 
        % m and n; dimensions of the matrix A
    X = zeros(m+2, n+2); 
        % X is a zero matrix, with dimensions (m+2) and (n+2)
    X(2:m+1, 2:n+1) = A; 
    new = X; 
        % new is the new generation
    
    for i = 2:m+1 %range of i (rows)
        for j = 2:n+1 %range of j (columns)
            range = (i-1):(i+1);            
            Neighbours = sum(sum(X(range, j) + X(range, j-1) + X(range, j+1)));
                % this formula calculates the amount of neighbours of the cells
                % in matrix A
            if X(i,j) == 1
                if Neighbours - 1 >= 1 && Neighbours - 1 <= 4
                    % If the amount of neighbours is between 1 and 4, the cell goes to the next generation                   
                    new(i,j) = 1;
                else
                    new(i,j) = 0; % dead cell
                end
                    
            else
                if Neighbours == 3 
                    % If the status of a cell is 'off' and the number of neighbours is                   
                    % is 3, the cell will be on in the new generation
                    new(i,j) = 1;
                else
                    new(i,j) = 0; 
                    % else the cell stays off
                end
            end
        end
    end
B = new([2:end-1], [2:end-1]); 
        % B is the new matrix after the given amount of steps, this
        % shows the final generation
A = B;
end
end
