function [stds] = primeStd(n)
    primes = calculate_primes_upto(n);
    n = length(primes);
    stds = zeros(1,n);
    mean = 0;
    sum = 0;
    sumOfSquares = 0;
    variance = 0;
    std = 0;

    for i = 1:1:n
        sum = sum + primes(i);
        mean = sum/i;
        sumOfSquares = 0;

        for j = 1:1:i
            sumOfSquares = sumOfSquares + (primes(j)-mean)^2;
        end

        variance = sumOfSquares/i;
        std = sqrt(variance);

        stds(i) = std;
    end
end