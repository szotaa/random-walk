/**
* Draws a plot with generated positions inside a triangle. 
*
* @param generationMethod - callback used for points generation. 
* Currently supported: generateTriangledPositions
* @param amount - number of positions
* @param A, B, C - vertices of a triangle
* @author Jakub Szota
*/

function plotTriangle(generationMethod, amount, A, B, C)
    clf;
    xpoly([A(1), B(1), C(1)], [A(2), B(2), C(2)], 'lines', 1);
    e = gce();
    e.foreground = 5;
    e.thickness = 3;
    [x, y] = generationMethod(amount, A, B, C);
    plot2d(x, y, -1);
endfunction
