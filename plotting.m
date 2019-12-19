function plotting(flag)
% PLOTTING is a functoion which plots different graphs for different
% values of (flag)
% plotting(flag), here flag is the inputvalue for the fuucntion, which can be any integer between 1 and 7
   

%7 if-statements for the 7 possible integervalues.
   
    if flag == 1
        x = linspace(-5,5,11);% x between -5 and 5, with 11 evenly spaced points on the
                                % interval of x
        y = x.^2 - 3*x +8;%function
        plot(x,y);%plotting of the function
    end
        
    if flag == 2
        theta = linspace(0, 4*pi, 500);%range of theta
        r = sin(theta) + sin((5*theta)/2).^3;% r as function of theta
        x = r.*cos(theta);
        y = r.*sin(theta);
        plot(x,y);
    end
        
    if flag == 3
        t = linspace(0,10,31); %range of t with 31 evenly spaced points
        y = (10.^3) * (1.05.^t); %function
        plot(t,y);
        xlabel('time (days)');
        ylabel('bacteria');
        title('Bacteria growth over time');
            %labeling the axis and title
    end
    
    if flag == 4
         x = linspace(-5, 5, 101); %range of x with 101 evenly spaced points
         y = x.^2 + 0.5; 
         z = (sin(4 * x)/ 8) + 0.25; 
         w = -exp(-1 * (x.^2)/3); 
         hold on 
         axis([-5 5 -1 1]) %range of the x-asis and y-asis
         plot(x, y, 'r'); %red solid line
         plot(x, z, '--g'); %green dashed line
         plot(x, w, '-.k'); %black dash-dotted line
         hold off;
    end
    
    if flag == 5
        x = linspace(-10, 10, 101); %range of x
        y = linspace(-10, 10, 101); %range of y
        [X, Y] = meshgrid(x, y); %from 2D to 3D
        Z = ((4 .* (X.^2) - ((X.^2) .* (Y.^2)) - 1) ./ (((X.^2) + (Y.^2) + 1).^2)); %function
        surf(X, Y, Z); %3D drawing of Z
    end
    
    if flag == 6
        x = primes(10.^6);
        hist(x,100);
            %histogram
    end
    
    if flag == 7
      t = [1:15];
      y(1) = 0.5;
      
      %4 subplots, means we need a 2 by 2 area
      %make 4 seperate subplots, with a for-loop for each one
      
      subplot(2,2,1);%left top plot
          for i = 2:15
               y(i) = 0.7*y(i-1)*(1-y(i-1));
               %recursive relation for r = 0.7
          end
      plot(t,y);
      
      subplot(2,2,2);%right top plot
          for i = 2:15
               y(i) = 2.3*y(i-1)*(1-y(i-1));
               %recursive relation for r = 2.3
         end
      plot(t,y);
      
      subplot(2,2,3);%left down plot
          for i = 2:15
               y(i) = 3.4*y(i-1)*(1-y(i-1));
               %recursive relation for r = 3.4
          end
      plot(t,y);
     
      subplot(2,2,4);%right down plot
          for i = 2:15
               y(i) = 3.7*y(i-1)*(1-y(i-1));
               %recursive relation forr r = 3.7
          end
      plot(t,y);
    end  
end

    
    
        
