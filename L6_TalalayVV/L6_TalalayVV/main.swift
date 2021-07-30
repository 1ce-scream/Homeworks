//
//  main.swift
//  L6_TalalayVV
//
//  Created by Виталий Талалай on 28.07.2021.
//

import Foundation

//инициализация очереди
var someQueue = Queue<Car>()

//инициализация 2х экземпляров класса Car для добавления в очередь
var car1 = Car(carModel: "Ford", manufactureYear: 1990,
               trunkVolume: 300, filledVolume: 200)
var car2 = Car(carModel: "Dodge", manufactureYear: 1997,
               trunkVolume: 400, filledVolume: 200)

//добавление инициализированных экземпляров в очередь
someQueue.push(car1!)
someQueue.push(car2!)

//добавление экземпляров в очередь без предворительной инициализации
someQueue.push(Car(carModel: "Ferrari", manufactureYear: 2021,
                   trunkVolume: 100, filledVolume: 0)!)
someQueue.push(Car(carModel: "BMW", manufactureYear: 2012,
                   trunkVolume: 200, filledVolume: 50)!)

//проверка работы метода elementsInQueue
someQueue.elementsInQueue()
print("====================== \n")

//проверка работы сабскрипта
print(someQueue[3] ?? "Элемента с заданным индексом не существует \n")
print(someQueue[6] ?? "Элемента с заданным индексом не существует \n")
print("====================== \n")

//удаление элемента из очереди
let testLet = someQueue.pop()
print("Из очереди изъят следующий элемент: \n \(testLet!)")
someQueue.elementsInQueue()
print("====================== \n")

//проверка работы метода фильтр с замыканием
print(someQueue.filter { element in element.manufactureYear > 2000 })
print("====================== \n")
print(someQueue.filter { $0.freeSpace < 200 })
print("====================== \n")


//тестовый метод, сделанный ради интереса. По нему есть вопрос в файле Queue.
var test = someQueue.map { $0.freeSpace }
print(test)

var someQueue2 = Queue<String>()
someQueue2.push("Alice")
someQueue2.push("Alice")
someQueue2.push("Alice")
someQueue2.push("Bryan")
someQueue2.push("Bryan")
someQueue2.push("Bryan")
var test2 = someQueue2.map { $0.uppercased() }
print(test2)

