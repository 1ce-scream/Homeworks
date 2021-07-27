//
//  SportCar.swift
//  L5_TalalayVV
//
//  Created by Виталий Талалай on 25.07.2021.
//

import Foundation

///Класс авто - спортивный автомобиль
class SportCar: CarProtocol {
    let carModel: String
    let manufactureYear: Int
    let trunkVolume: Double
    var filledVolume: Double
    var engineState: EngineState
    var windowState: WindowsState
    //дополнительное свойство класса SportCar
    ///состояние люка: открыт, закрыт
    var hatchState: HatchState
    //вычисляемое свойство
    var freeSpace: Double {
        get {
            return trunkVolume - filledVolume
        }
    }
    ///Свойство класса для подсчета количества авто
    static var carCount = 0 //свойство присущее только классу
    
    //инициализатор
    ///- parameter carModel: Марка и модель авто
    ///- parameter manufactureYear: Год выпуска авто
    ///- parameter trunkVolume: Объем багажника авто
    ///- parameter engineState: Состояние двигателя: заглушен или заведен
    ///- parameter windowState: Состояние окон: открыты или закрыты
    ///- parameter filledVolume: Занятый объем багажника
    ///- parameter hatchState: Состояние люка авто
    init?(carModel: String, manufactureYear: Int,
          trunkVolume: Double, engineState: EngineState,
          windowState: WindowsState, hatchState: HatchState,
          filledVolume: Double) {
        //Проверяем корректность ввода значений свойств
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
        self.engineState = engineState
        self.windowState = windowState
        self.hatchState = hatchState
        //увеличиваем количество авто на 1 с каждым инициализированным экземпляром
        SportCar.carCount += 1
    }
    
    //Деинициализатор
    deinit {
        SportCar.carCount -= 1 //уменьшаем количество авто на 1
    }
    
    ///Изменить состояние люка
    func switchState() {
        if hatchState == .isOpen {
            print("Люк будет закрыт")
            hatchState = .isClose
        } else {
            print("Люк будет открыт")
            hatchState = .isOpen
        }
    }
}
