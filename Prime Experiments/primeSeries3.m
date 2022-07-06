function [nums,series] = primeSeries3(n)
    primes  = calculate_primes_upto(n);
    len = length(primes);
    series = zeros(1,len);
    series(1) = 1/2;
    nums = 1:1:len;
    parity = true;

    for i = 2:1:len 
        if parity
            series(i) = series(i-1) - 1/primes(i);
        else
            series(i) = series(i-1) + 1/primes(i);
        end
        parity = ~parity;
    end
end