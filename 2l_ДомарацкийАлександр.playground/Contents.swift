import Foundation

//Функция четная или нет

func isEven(n:Int) -> Bool{
    return n % 2 == 0
}

//функция делимости на 3

func isDividedBy3(n:Int) -> Bool{
    return n % 3 == 0
}

//Массив из 100 чисел

var array = Array(1...100)

//Удаляем из массива все что делится на 2 и не делится на 3

var arrayIsDivided = array.filter {$0 % 2 != 0 && $0 % 3 == 0}
print(arrayIsDivided)

//Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

func fibonaci() -> [Decimal]{
    var arrayFibonaci:[Decimal] = [0,1]
    for i in 2...100{
        arrayFibonaci.append(arrayFibonaci[i-2] + arrayFibonaci[i-1])
    }
    return arrayFibonaci
}
print(fibonaci())

//Заполнить массив из 100 элементов различными простыми числами

func isPrime(_ number: Int) -> Bool {
    return !(2..<number).contains { number % $0 == 0 }
}

var arrayOfPrime = [Int]()
var i = 2
while arrayOfPrime.count < 100 {
    if isPrime(i) {
        arrayOfPrime.append(i)
        i += 1
    }else{
        i += 1
    }
}
print(arrayOfPrime)




