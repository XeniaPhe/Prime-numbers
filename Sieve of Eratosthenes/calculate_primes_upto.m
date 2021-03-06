function [primes] = calculate_primes_upto(n)
    if n < 2
        return
    end
    builderPrimes = 2;
    if n == 2
        return
    end
    builderPrimes = [builderPrimes,3];
    if n == 3
        return
    end
    builderPrimes = [builderPrimes,5];
    if n == 5
        return
    end

    sqrtn = floor(sqrt(n));
    primeBatchSize = ceil(sqrtn/(log(sqrtn)-1));
    primeLimit = primeBatchSize;
    primeCounter = 3;
    builderPrimes = [builderPrimes , zeros(1,primeBatchSize-3)];
    
    sqrtIndex = 2;
    increment = 4;
    isPrime = true;
    number = 7;

    while number <= sqrtn
        if builderPrimes(sqrtIndex+1) <= sqrt(number)
            sqrtIndex = sqrtIndex + 1;
        end

        isPrime = true;

        for j = 1:1:sqrtIndex
            if mod(number,builderPrimes(j)) == 0
                isPrime = false;
                break
            end
        end

        if isPrime
            primeCounter = primeCounter + 1;
            builderPrimes(primeCounter) = number;

            if primeCounter == primeLimit
                primeLimit = primeLimit + primeBatchSize;
                builderPrimes = [builderPrimes,zeros(1,primeBatchSize)];
            end
        end

        number = number + increment;

        if increment == 4
            increment = 2;
        else
            increment = 4;
        end
    end

    builderPrimes = builderPrimes(1:1:primeCounter);
    primeBatchSize = ceil(n/(log(n)-1))-primeCounter;
    eratosthenesBatchSize = 100000;
    primeLimit = primeBatchSize;
    primeCounter = 0;
    primes = zeros(1,primeBatchSize);
    prime = 2;
    primeSquare = 4;
    eratosthenesNumbers = [0];
    startNumber = sqrtn+1;
    endNumber = 0;

    while startNumber <= n       
        if startNumber + eratosthenesBatchSize < n
            endNumber = startNumber + eratosthenesBatchSize-1;
        else
            eratosthenesBatchSize = n - startNumber;
            endNumber = n;
        end
        
        eratosthenesNumbers = ones(1,eratosthenesBatchSize);
        
        for i = 1:1:length(builderPrimes)
            prime = builderPrimes(i);
            primeSquare = prime^2;

            if primeSquare < startNumber
                number = startNumber - mod(startNumber,prime);
                if number < startNumber
                    number = number + prime;
                end
            else
                number = primeSquare;
            end
            
            number = number - startNumber + 1;
            
            while number <= eratosthenesBatchSize
                eratosthenesNumbers(number) = 0;
                number = number + prime;
            end
        end

        startNumber = startNumber - 1;
        for i = 1:1:eratosthenesBatchSize
            if eratosthenesNumbers(i)
                primeCounter = primeCounter + 1;
                primes(primeCounter) = i + startNumber;

                if primeCounter == primeLimit
                    primeLimit = primeLimit + primeBatchSize;
                    primes = [primes,zeros(1,primeBatchSize)];
                end
            end
        end

        startNumber = endNumber + 1;
    end

    primes = [builderPrimes,primes(1:1:primeCounter)];  
end