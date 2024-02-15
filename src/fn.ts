function isPrime(num: number): boolean {

    let i = Math.floor(num / 2)

    for (; i >= 2; i--) {
        if (num % i === 0) {
            return false;
        }
    }

    return true;
}

export function getPrimes(limit: number): number[] {

    let i: number;
    let term: number;

    const primes: number[] = [];

    for (i = 2, term = 0; term < limit; i++) {
        if (isPrime(i)) {
            term++;
            primes.push(i);
        }
    }

    return primes;
}

export function fib(num: number): number {
    if (num < 2) return num;
    return fib(num - 1) + fib(num - 2);
}
