/**
* Draws a plot with generated positions. 
*
* @param generationMethod - callback used for points generation. 
* Currently supported: generateGaussianPositions, generateFixedPositions, generateCauchyPositions
* @param amount - number of positions
* @author Jakub Szota
*/

function plotPositions(generationMethod, amount)
    clf;
    [x, y] = generationMethod(amount);
    plot2d(x, y);
endfunction
