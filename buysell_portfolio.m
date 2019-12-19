function [buyday, sellday, profit] = buysell_portfolio(file1, file2, file3)
% BUYSELL_PORTFOLIO 
%  [buyday, sellday, profit] = buysell_portfolio(file1, file2, file3)
%  

[days1 prices1] = csvread('file1.csv',columns,{'days1', 'prices1'});
[days2 prices2] = csvread('file2.csv',columns,{'days2', 'prices2'});
[days3 prices3] = csvread('file3.csv',columns,{'days3', 'prices3'});

eerste = 0;
laatste=0;
for i =1:length(days2)
   
    if days2(i)==days1(i)
        
        eerste = prices(i);
        break    
end
end
 for j=i+1:length(days2)
     if days2(i)==days(1)
         
         laatste= days2(i);
 end
function [buy, sell, profit] = optimal_buysell(prices)


% OPTIMAL_BUYSELL computes buy and sell times
%  [buy, sell, profit] = optimal_buysell(prices) decides when 
%  to buy and when to sell to maximize profit (or minimize loss)

vectorlengte= length(prices);
laagste = prices(1);
hoogste = prices (2);
profit = hoogste-laagste;
buy=1;
sell=2;

for j=1:vectorlengte-1              %check all possibilities
    
    for i=j+1:vectorlengte
        
        potentialprofit = prices(i) - prices(j);
        
        if potentialprofit > profit      % if greater profit --> update variables
             
            
            profit = potentialprofit;
            sell=i;
            buy=j;
            
        end
    end
end
end