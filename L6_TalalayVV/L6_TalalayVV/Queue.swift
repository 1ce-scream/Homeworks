//
//  Queue.swift
//  L6_TalalayVV
//
//  Created by Виталий Талалай on 28.07.2021.
//

import Foundation

///Дженерик для очереди (FIFO)
struct Queue<T> {
    //массив элементов
    var elements: [T] = []

    ///метод для добавления элемента в очередь
    ///- parameter element: принимает элемент
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    ///метод для удаления первого элемента из очереди
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
    
    ///метод для фильтрации очереди
    ///- parameter predicate: принимает замыкание
    func filter(_ predicate: (T) -> Bool) -> [T] {
        var tmpArray: [T] = []
        for element in elements {
            if predicate(element) {
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
    
    ///метод для вывода в консоль количества элементов в очереди
    func elementsInQueue() { print("Длина очереди: \(elements.count) \n") }
    
    /*
    Андрей, подскажите, пожалуйста, можно ли как-то избежать использования
     типа Any в методе map?
     
     Я понимаю, что если в очередь будут добавляться "простые" элементы
     одного типа (цифры или строки), а не экземпляры класса с кучей свойств
     разных типов, то проблем с типизацией не будет и метод будет выглядеть так:
     
     func map(_ predicate: (T) -> T) -> [T] {
         var tmpArray: [T] = []
         for element in elements {
             let newElement = predicate(element)
             tmpArray.append(newElement)
         }
         return tmpArray
     }
     
     Либо в данном конкретном случае можно ограничить дженерик классом Car и для
     каждого типа данных писать свой метод. Что не очень удобно.
    */
    
    ///экспериментальный метод для трасформации массива
    ///- parameter predicate: принимает замыкание
    func map(_ predicate: (T) -> Any) -> [Any] {
        var tmpArray: [Any] = []
        for element in elements {
            let newElement = predicate(element)
            tmpArray.append(newElement)
        }
        return tmpArray
    }
}
