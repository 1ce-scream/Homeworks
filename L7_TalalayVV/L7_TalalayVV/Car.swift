//
//  Car.swift
//  L7_TalalayVV
//
//  Created by Виталий Талалай on 03.08.2021.
//

import Foundation

///Класс авто
class Car {
    ///Марка  авто
    let model: String
    ///Объем багажника
    let trunkVolume: Double
    //Занятый объем багажника
    private var filledVolume = 0.0
    //Оставшееся свободное место
    private var freeSpace: Double {
        return trunkVolume - filledVolume
    }
    
    //инициализатор c проверкой корректности введенных значений свойств
    /// - parameter model: Марка авто
    /// - parameter trunkVolume: Объем багажника
    init?(model: String, trunkVolume: Double) {
        guard trunkVolume > 0 else {
            print("Невозможно инициализировать экземпляр,",
                  "объем багажника некорректен")
            return nil
        }
        self.model = model
        self.trunkVolume = trunkVolume
    }
    
    ///Метод для вывода информации о состоянии объема багажника
    func printTrunkSpaceState() {
        print("""
              Свободный объем багажника \(freeSpace) л.
              Занятый объем багажника \(filledVolume) л. \n
              """)
    }
    
    //Методы для выполнения пункта 1
    
    ///Метод для погрузки в багажник
    /// - parameter cargoVolume: Объем груза для погрузки
    func loadCargo(cargoVolume: Double) -> CarErrors? {
        guard cargoVolume > 0 else {
            return CarErrors.incorrectCargoVolume
        }
        guard cargoVolume <= freeSpace else {
            return CarErrors.notEnoughFreeSpace
        }
        filledVolume += cargoVolume
        print("Груз объемом \(cargoVolume) л. погружен")
        return nil
    }
    
    ///Метод для выгрузки из багажника
    /// - parameter cargoVolume: Объем груза для выгрузки
    func unloadCargo(cargoVolume: Double) -> CarErrors? {
        guard cargoVolume > 0 else {
            return CarErrors.incorrectCargoVolume
        }
        guard cargoVolume <= filledVolume else {
            return CarErrors.notEnoughCargoVolume
        }
        filledVolume -= cargoVolume
        print("Груз объемом \(cargoVolume) л. выгружен")
        return nil
    }
    
    //Методы для выполнения пункта 2
    
    ///Метод для погрузки в багажник,  выбрасывающий ошибку
    /// - parameter cargoVolume: Объем груза для погрузки
    func unsafeLoadCargo(cargoVolume: Double) throws {
        guard cargoVolume > 0 else {
            throw CarErrors.incorrectCargoVolume
        }
        guard cargoVolume <= freeSpace else {
            throw CarErrors.notEnoughFreeSpace
        }
        filledVolume += cargoVolume
        print("Груз объемом \(cargoVolume) л. погружен")
    }
    
    ///Метод для выгрузки из багажника
    /// - parameter cargoVolume: Объем груза для выгрузки
    func unsafeUnloadCargo(cargoVolume: Double) throws {
        guard cargoVolume > 0 else {
            throw CarErrors.incorrectCargoVolume
        }
        guard cargoVolume <= filledVolume else {
            throw CarErrors.notEnoughCargoVolume
        }
        filledVolume -= cargoVolume
        print("Груз объемом \(cargoVolume) л. выгружен")
    }
}
