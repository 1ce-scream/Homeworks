import UIKit

let number = 6 //константа для проверки работы функций

//Задание №1 написать функцию определяющую четное число или нечетное

func evenOrOdd (someNumber: Int) -> Bool {
    var divisibleByTwo = true
    if number % 2 == 0 {
        divisibleByTwo = true
    } else {
        divisibleByTwo = false
    }
    return divisibleByTwo
}

if evenOrOdd(someNumber: number) == true {
    print ("Число \(number) четное")
} else {
    print ("Число \(number) нечетное")
}

print ("=====================")


//Задание №2 написать функцию, которая определяет, делится ли число на 3 без остатка

func divisibleByThreeOrNot (someNumber: Int) -> Bool {
    var divisibleByThree = true
    if number % 3 == 0 {
        divisibleByThree = true
    } else {
        divisibleByThree = false
    }
    return divisibleByThree
}

if divisibleByThreeOrNot(someNumber: number) == true {
    print ("Число \(number) делится на 3 без остатка")
} else {
    print ("Число \(number) не делится на 3 без остатка")
}

print ("=====================")


//Задание №3 Создать возрастающий массив из 100 чисел.

var arrayOneHundred: [Int] = []

for index in (1...100) {
    arrayOneHundred.append(index)
}

/*
как вариант:
var arrayOneHundred = Array(1...100)
*/

print (arrayOneHundred)
print ("=====================")


//Задание №4 Удалить из этого массива все четные числа и все числа, которые не делятся на 3

for value in arrayOneHundred {
    if (value % 2) == 0 || (value % 3) != 0{
        arrayOneHundred.remove(at: arrayOneHundred.firstIndex(of: value)!)
    }
}
print(arrayOneHundred)
print ("=====================")


//Задание №5 Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов

var fibonacciArray = [0,1]

func addFibonacciNumbersToArray (_ someArray: [Int], amountOfFibonacciNumbers amount: Int) -> [Int] {
    var newArray = someArray
    for _ in (1...amount){
        if newArray.isEmpty == true {
            newArray = [0,1]
        } else {
            let count = newArray.count
            newArray.append(newArray[count-2] + newArray[count-1])
        }
    }
    return newArray
}

print (addFibonacciNumbersToArray(fibonacciArray, amountOfFibonacciNumbers: 50))
print ("=====================")


//Задание №6
/*
 Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

 a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 
Метод Эратосфена подразумевает фильтрацию всех чисел кроме простых.
*/

/*
 Что-то у меня совсем не получается реализовать предложенный алгоритм. Поэтому решил задачу по другому.
*/


//функция для создания массива из простых чисел
func getPrimeNumbers (amountOfPrimeNumbers: Int) -> [Int] {
    var primeArray = [2] //начальный массив состоящий из 1 числа
    var currentNumber = 3 //следующее число для проверки
    
    //цикл для создания необходимого количества простых чисел
    while primeArray.count < amountOfPrimeNumbers {
        var isNumberPrime = true //создаем флаг для указания надо число добавлять в массив или нет
        
        //проверяем есть ли у числа делители кроме самого себя
        for numberForCheck in 2...currentNumber - 1 {
            if currentNumber % numberForCheck == 0 { //если текущее число делится без остатка на число из диапазона, то меняем флаг на false и выходим
                isNumberPrime = false
                break
            }
        }
        if isNumberPrime == true { //если после проверки флаг остался true, то добавляем число в массив
            primeArray.append(currentNumber)
        }
        currentNumber += 1
    }
    return primeArray
}

print (getPrimeNumbers(amountOfPrimeNumbers: 100))


