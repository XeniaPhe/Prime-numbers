function [primes] = calculate_primes(n)

    if n < 1
        return
    end
    primes = 2;
%     disp(1);
    if n == 1
        return
    end
    primes = [primes,3];
%     disp(2);
    if n == 2
        return
    end
    primes = [primes,5];
%     disp(3);
    if n == 3
        return
    end

    increment = 4;
    number = 7;
    sqrtIndex = 2;
    primeCounter = 3;
    checkCounter = 0;
    primes = [primes , zeros(1,n-3)];
    isPrime = true;

    while primeCounter < n 

        if primes(sqrtIndex+1) <= sqrt(number)
            sqrtIndex = sqrtIndex + 1;
        end

        isPrime = true;
        for j = 1:1:sqrtIndex
            if mod(number,primes(j)) == 0
                isPrime = false;
                break
            end
        end

        if isPrime == true
            primeCounter = primeCounter + 1;
%             disp(primeCounter);
            primes(primeCounter) = number;
        end
        
        checkCounter = checkCounter + 1;
        number = number + increment;
        increment = increment + 2*((-1)^mod(checkCounter,2));
    end
end