//
//  Car.swift
//  L6_TalalayVV
//
//  Created by Виталий Талалай on 28.07.2021.
//

import Foundation

//Класс Car для проверки работоспособности дженерика очереди
///Класс для описания авто
class Car {
    ///Марка и модель авто
    let carModel: String
    ///Год выпуска авто
    let manufactureYear: Int
    ///Объем багажника
    let trunkVolume: Double
    ///Занятый объем багажника
    var filledVolume: Double
    ///Свободный объем багажника
    var freeSpace: Double {
        return trunkVolume - filledVolume
    }
    ///Свойство класса для подсчета количества экземпляров
    static var carCount = 0
    
    //Инициализатор
    ///- parameter carModel: Марка и модель авто
    ///- parameter manufactureYear: Год выпуска авто
    ///- parameter trunkVolume: Объем багажника авто
    ///- parameter filledVolume: Занятый объем багажника
    init?(carModel: String, manufactureYear: Int,
         trunkVolume: Double, filledVolume: Double) {
        guard manufactureYear >= 1900 && filledVolume <= trunkVolume else {
            print("Невозможно инициализировать экземпляр.",
                  "Один из параметров введен неверно.",
                  "manufactureYear должен быть >= 1900",
                  "filledVolume не должен превышать trunkVolume \n")
            return nil
        }
        self.carModel = carModel
        self.manufactureYear = manufactureYear
        self.trunkVolume = trunkVolume
        self.filledVolume = filledVolume
        Car.carCount += 1
    }
    
    //Деинициализатор
    deinit {
        Car.carCount -= 1
    }
}
