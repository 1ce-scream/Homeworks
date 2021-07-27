//
//  TrunkCar.swift
//  L5_TalalayVV
//
//  Created by Виталий Талалай on 25.07.2021.
//

import Foundation

///Класс авто - автоцистерна
class TrunkCar: CarProtocol {
    let carModel: String
    let manufactureYear: Int
    let trunkVolume: Double
    var filledVolume: Double
    var engineState: EngineState
    var windowState: WindowsState
    //дополнительное свойство класса TrunkCar
    ///состояние бака: полон, пуст
    var tankLevel: TankLevel
    //вычисляемое свойство
    var freeSpace: Double {
        get {
            return trunkVolume - filledVolume
        }
    }
    static var carCount = 0 //свойство присущее только классу
    
    //инициализатор
    ///- parameter carModel: Марка и модель авто
    ///- parameter manufactureYear: Год выпуска авто
    ///- parameter trunkVolume: Объем багажника авто
    ///- parameter engineState: Состояние двигателя: заглушен или заведен
    ///- parameter windowState: Состояние окон: открыты или закрыты
    ///- parameter tankLevel: Состояние бака авто: полон или пуст
    ///- parameter filledVolume: Занятый объем багажника
    init?(carModel: String, manufactureYear: Int,
          trunkVolume: Double, engineState: EngineState,
          windowState: WindowsState, tankLevel: TankLevel,
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
        self.tankLevel = tankLevel
        //увеличиваем количество авто на 1 с каждым инициализированным экземпляром
        TrunkCar.carCount += 1
    }
    
    //Деинициализатор
    deinit {
        TrunkCar.carCount -= 1 //уменьшаем количество авто на 1
    }
    
    ///Изменение состояния бака
    func switchState() {
        if tankLevel == .isFull {
            print("Бак будет опустошен")
            tankLevel = .isEmpty
        } else {
            print("Бак будет заполнен")
            tankLevel = .isFull
        }
    }
}
