import UIKit

//Задание №1 решение квадратного уравнения x^2 - 2x - 3 = 0

let coefficientA: Double = 1
let coefficientB: Double = -2
let coefficientC: Double = -3
let discriminant: Double = pow(coefficientB,2) - 4 * coefficientA * coefficientC
let rootX1: Double = (-coefficientB - sqrt(discriminant)) / 2 * coefficientA
let rootX2: Double = (-coefficientB + sqrt(discriminant)) / 2 * coefficientA
print("Первый корень равен:  \(rootX1), Второй корень равен: \(rootX2)")


//Задание №2 вычислить площадь, периметр и гипотенузу в прямоугольном треугольнике с катетами a = 5.5 b = 8

let cathetusA: Double = 5.5
let cathetusB: Double = 8
let triangleArea: Double = cathetusA * cathetusB / 2
let hypotenuse: Double = sqrt(pow(cathetusA,2) + pow(cathetusB,2))
let trianglePerimeter: Double = cathetusA + cathetusB + hypotenuse
print ("Площадь треугольника равна: \(triangleArea), Периметр треугольника равен: \(trianglePerimeter), гипотенуза треугольника равна: \(hypotenuse)")

//Задание №3 вычисление суммы вклада через 5 лет. Стартовая сумма 1000, годовой процент 6%

var deposit: Float  = 1000
let percent: Float  = 6 / 100
var i:Int = 0
while i < 5 {
    deposit = deposit + deposit * percent
    i += 1
}
print ("Через 5 лет на счету будет: \(deposit)")

/* Задание №3 с интерактивом в качестве косольного приложения
Пользователь вводит сумму вклада и годовой процент. Программа выводит сумму вклада через 5 лет
*/

/*
 
 //  Created by Виталий Талалай on 13.07.2021.
 //

 import Foundation

 print ("Введите сумму вклада ")
 var deposit = Float(readLine()!) // в переменную deposite записываем значение введенное в консоли и принудительно приводим ее к типу float

 //проверяем ввел ли пользователь число и повторяем это до тех пор пока пользователь не введет число
 while deposit == nil {
         print ("Введенное значение не является числом. Введите сумму вклада цифрами.")
         deposit = Float(readLine()!)
 }

 print ("Введите годовой процент ")
 var percent = Float(readLine()!) // все тоже самое по аналогии с переменной deposit только для процентов

 // опять проверяем введено число или что-то другое
 while percent == nil {
         print ("Введенное значение не является числом. Введите годовой процент цифрами.")
         percent = Float(readLine()!)
 }
 percent = percent! / 100

 //считаем прогрессивный процент за 5 лет
 var i:Int = 0
 while i < 5 {
     deposit = deposit! + deposit! * percent!
     i += 1
 }
 print ("Через 5 лет на счету будет: \(deposit!)")
 
 
 */
