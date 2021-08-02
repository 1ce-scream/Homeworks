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
