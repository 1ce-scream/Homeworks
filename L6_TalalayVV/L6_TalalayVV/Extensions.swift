//
//  Extensions.swift
//  L6_TalalayVV
//
//  Created by Виталий Талалай on 28.07.2021.
//

import Foundation

//расширение имплементирующее классу Car протокол CustomStringConvertible
extension Car: CustomStringConvertible {
    var description: String {
        return
            """
                Машина \(carModel) \(manufactureYear) года выпуска.
                Объем багажника \(trunkVolume) л.
                Занято в багажнике \(filledVolume) л.
                Свободный объем багажника \(freeSpace) л. \n
            """
    }
}

//расширение добавляющее сабскрипт в очередь для исполнения ТЗ
extension Queue {
    ///просмотр элемента в очереди
    ///- parameter index: номер элемента в очереди
    subscript(index: Int) -> T? {
        guard index < elements.count && index >= 0 else { return nil }
        return elements[index]
    }
}
