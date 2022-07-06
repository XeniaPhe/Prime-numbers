function [nums,series,ratio] = primeSeries(n)
    primes = calculate_primes_upto(n);
    n = length(primes);
    nums = 1:1:n;
    ratio = zeros(1,n);
    series = zeros(1,n);

    sum = 0;
    add = true;

    for i = 1:1:n
        if add
            sum = sum + primes(i);
            add = false;
        else
            sum = sum - primes(i);
            add = true;
        end

        series(i) = sum;
        ratio(i)  = abs(sum/primes(i));
    end
end