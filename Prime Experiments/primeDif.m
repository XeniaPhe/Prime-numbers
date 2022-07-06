function [diffRatio1,diffRatio2] = primeDif(n)
    primes = calculate_primes_upto(n);
    n = length(primes);
    diffRatio1 = zeros(1,n);
    diffRatio2 = zeros(1,n);
    p1 = 0;
    p2 = 0;
    dif = 0;
    
    for i = 1:1:n-1
        p1 = primes(i);
        p2 = primes(i+1);
        dif = p2-p1;
        diffRatio1(i) = (dif)/p1;
        diffRatio2(i) = (dif)/p2;
    end
end