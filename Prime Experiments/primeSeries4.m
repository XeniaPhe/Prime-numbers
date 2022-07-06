function [nums,series] = primeSeries4(n)
    primes  = calculate_primes_upto(n);
    len = length(primes);
    series = zeros(1,len);
    series(1) = 1/2;
    nums = 1:1:len;

    for i = 2:1:len 
        series(i) = series(i-1) + 1/primes(i);
    end
end