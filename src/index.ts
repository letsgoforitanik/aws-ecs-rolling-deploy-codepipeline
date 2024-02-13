import http from "http";
import express from "express";

const app = express();

function isPrime(num: number): boolean {

    let i = Math.floor(num / 2)

    for (; i >= 2; i--) {
        if (num % i === 0) {
            return false;
        }
    }

    return true;
}

function getPrimes(limit: number): number[] {

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

function fib(num: number): number {
    if (num < 2) return num;
    return fib(num - 1) + fib(num - 2);
}


app.get('/primes/:num', (req, res) => {
    const num = Number(req.params.num);
    const primes = getPrimes(num);
    return res.send(`First ${num} prime numbers are [${primes.join(',')}]`);
});


app.get('/fib/:num', (req, res) => {
    const num = Number(req.params.num);
    const answer = fib(num - 1) + fib(num - 2);
    return res.send(`Fibonacci(${num}) number is ${answer}`);
});

app.get('/author', (req, res) => res.send(`Author is Aniruddha Banerjee`));

app.get('/', (req, res) => console.log('Welcome from Anik Banerjee'));

const server = http.createServer(app);
server.listen(3000, () => console.log(`Server is listening on port 3000`));