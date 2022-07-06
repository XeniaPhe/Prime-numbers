function [nums,primes,ratios,differences,means,sins,coses,cossins] = prime_experiments(n)
    primes = calculate_primes_upto(n);
    count = length(primes);
    ratios = ones(0,count);
    differences = zeros(0,count);
    means = zeros(0,count);
    nums = 1:1:count-1;
    sins = zeros(0,count);
    coses = zeros(0,count);
    cossins = zeros(0,count);

    for i = nums
        ratios(i) = primes(i+1)/primes(i);
        differences(i) = primes(i+1)-primes(i);
        means(i) = mean(primes(1:i));
        sins(i) = sin(primes(i));
        coses(i) = cos(primes(i));
        cossins(i) = sins(i)*coses(i);
    end
    
    sins(count) = sin(primes(count));
    coses(count) = cos(primes(count));
    cossins(count) = sins(count)*coses(count);
    means(count) = mean(primes);
    nums = [nums,count];
    ratios(count) = ratios(count-1);
    differences(count) = differences(count-1);
end