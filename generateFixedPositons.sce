/**
* Calculates point positions. Provides numerical solution for exercise 1 a).
*
* @param amount - number of positions
* @author Jakub Szota
*/

function [x, y] = generateFixedPositions(amount)
    
    /**
    * Generates pair of numbers fulfilling following requirement: 
    * a ^ 2 + b ^ 2 == 1
    */
    
    function [a, b] = generateRandomPair()
        temp = rand() * 360;
        a = sind(temp);
        b = cosd(temp);
    endfunction
    
    if amount < 0 then
        error('amount must be greater than 0');
    end
    rand('seed', getdate('s'));
    rand('uniform');
    x = [1 : amount];
    y = x;
    for i = 2 : amount
      [p, q] = generateRandomPair();
       x(i) = x(i - 1) + p;
       y(i) = y(i - 1) + q;
    end
endfunction
