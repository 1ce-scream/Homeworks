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
    private var elements: [T] = []
    
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
    
    ///метод для трасформации массива
    ///- parameter predicate: принимает замыкание
    func map<Output>(_ predicate: (T) -> Output) -> [Output] {
        var tmpArray: [Output] = []
        for element in elements {
            let newElement = predicate(element)
            tmpArray.append(newElement)
        }
        return tmpArray
    }
    
    ///просмотр элемента в очереди
    ///- parameter index: номер элемента в очереди
    subscript(index: Int) -> T? {
        guard index < elements.count && index >= 0 else { return nil }
        return elements[index]
    }
}
