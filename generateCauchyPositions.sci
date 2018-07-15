/**
* Calculates point positions from cauchy distribution. Provides numerical solution for exercise 1 c).
*
* @param amount - number of positions
* @author Jakub Szota
*/

function [x, y] = generateCauchyPositions(amount)
    if amount < 0 then
        error('amount must be greater than 0');
    end
    rand('seed', getdate('s'));
    rand('uniform');
    x = [1 : amount];
    y = x;
    for i = 2 : amount
       x(i) = x(i - 1) + tan(-%pi / 2 + %pi * rand());
       y(i) = y(i - 1) + tan(-%pi / 2 + %pi * rand());
    end
endfunction
