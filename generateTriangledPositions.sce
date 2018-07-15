/**
 * Calculates point positions. Provides numerical solution for second exercise.
 *
 * @param amount - number of positions
 * @param A, B, C - triangle vertices
 * @returns x, y - vectors of calculated points coordinates 
 * @author Jakub Szota
*/

function [x, y] = generateTriangledPositions(amount, A, B, C)
    
    /**
    * Returns random number represtening vertex A, B or C.
    */
    
    function vertex = getRandomVertex()
        rand('uniform');
        vertex = ceil(rand() * 3);
    endfunction
    
    /**
    * Calculates midpoint between two numbers,
    * useful when seeking for a middle of a line.
    */
    
    function mid = findMidpoint(start, destination)
        mid = (start + destination) / 2;
    endfunction
    
    /**
    * Calculates center of given triangle.
    */
    
    function [centerX, centerY] = findCenteroid(A, B, C)
        centerX = (A(1) + B(1) + C(1)) / 3;
        centerY = (A(2) + B(2) + C(2)) / 3;
    endfunction
    
    /**
    * Returns 0 when it is not possible to draw a triangle with given vertices,
    * returns 1 otherwise.
    */
    
    function bool = isTriangle(A, B, C)
        if ((B(1) - A(1)) * (C(2) - A(2)) - (B(2) - A(2)) * (C(1) - A(1))) == 0 then
            bool = 0;
        else
            bool = 1;
        end
    endfunction  
    
    //end of utility functions
    
    if isTriangle(A, B, C) == 0 then
        error('not a valid triangle!');
    end
    if amount < 0 then
        error('amount must be greater than 0');
    end
    x = [1 : amount];
    y = x;
    [x1, y1] = findCenteroid(A, B, C);
    x(1) = x1;
    y(1) = y1;
    for i = 2 : amount
        vertex = getRandomVertex();
        if vertex == 1 then
            x(i) = findMidpoint(x(i - 1), A(1));
            y(i) = findMidpoint(y(i - 1), A(2));
        elseif vertex == 2 then
            x(i) = findMidpoint(x(i - 1), B(1));
            y(i) = findMidpoint(y(i - 1), B(2));
        elseif vertex == 3 then
            x(i) = findMidpoint(x(i - 1), C(1));
            y(i) = findMidpoint(y(i - 1), C(2));
        end
    end
endfunction
