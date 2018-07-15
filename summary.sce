/**
* Summarizes generation method properites like mean of point and their standard deviation.
*
* @param generationMethod - callback used for points generation. 
* Currently supported: generateGaussianPositions, generateFixedPositions, generateCauchyPositions
* @param numOfParticles - number of particles
* @param amount - number of positions for each particle
* @author Jakub Szota
*/

function [meanX, meanY, stDeviation] = summary(generationMethod, numOfParticles, amount)
    if amount < 0 then
        error('amount must be greater than 0');
    end
    if numOfParticles < 1 then
        error('numOfParticles must be greater or equal to 1');
    end
    meanX = zeros(1, amount);
    meanY = zeros(1, amount);
    stDeviation = zeros(1, amount);
    for i = 1 : numOfParticles
        [x, y] = generationMethod(amount);
        for j = 1 : amount
            meanX(j) = meanX(j) + mean(x(1:j));
            meanY(j) = meanY(j) + mean(y(1:j));
            stDeviation(j) = sqrt(stdev(x(1 : j))^2 + stdev(y(1 : j))^2);
         end
    end
    meanX = meanX / numOfParticles;
    meanY = meanY / numOfParticles;
    stDeviation = stDeviation / numOfParticles;
endfunction
