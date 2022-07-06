function [nums,series] = primeSeries2(n,x)
    primes  = calculate_primes_upto(n);
    len = length(primes);
    series = zeros(1,len);
    series(1) = 2*x;
    nums = 1:1:len;

    for i = 2:1:len 
        x = x*x;
        series(i) = series(i-1) + primes(i)*x;
    end
end