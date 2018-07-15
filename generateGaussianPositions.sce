/**
* Calculates point positions from gaussian distribution. Provides numerical solution for exercise 1 b).
*
* @param amount - number of positions
* @author Jakub Szota
*/

function [x, y] = generateGaussianPositions(amount)
    if amount < 0 then
        error('amount must be greater than 0');
    end
    rand('seed', getdate('s'));
    rand('normal');
    x = [1 : amount];
    y = x;
    for i = 2 : amount
       x(i) = x(i - 1) + rand();
       y(i) = y(i - 1) + rand();
    end
endfunction
