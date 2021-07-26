//
//  parentClass.swift
//  L4_TalalayVV
//
//  Created by Виталий Талалай on 22.07.2021.
//

import Foundation

///Родительский класс для авто
class Car {
    ///Марка и модель авто
    let carModel: String
    ///Год выпуска авто
    let manufactureYear: Int
    ///Объем багажника авто
    let trunkVolume: Double
    ///Состояние двигателя: заглушен или заведен
    var engineState: EngineState
    ///Состояние окон: открыты или закрыты
    var windowState: WindowsState
    ///Занятый объем багажника
    var filledVolume: Double {
        didSet {
            print("Занятый объем багажника изменился на",
                  "\(abs(filledVolume - oldValue)) литров")
        }
    }
    ///Свободный объем багажника
    var freeSpace: Double {
        get {
            return trunkVolume - filledVolume
        }
    }
    ///Свойство класса для подсчета количества авто
    static var carCount = 0 //свойство присущее только классу
    
    //инициализатор c проверкой корректности введенных значений свойств
    ///- parameter carModel: Марка и модель авто
    ///- parameter manufactureYear: Год выпуска авто
    ///- parameter trunkVolume: Объем багажника авто
    ///- parameter engineState: Состояние двигателя: заглушен или заведен
    ///- parameter windowState: Состояние окон: открыты или закрыты
    ///- parameter filledVolume: Занятый объем багажника
    init?(carModel: String, manufactureYear: Int,
          trunkVolume: Double, engineState: EngineState,
          windowState: WindowsState, filledVolume: Double) {
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
        self.engineState = engineState
        self.windowState = windowState
        self.filledVolume = filledVolume
        //увеличиваем количество авто на 1 с каждым инициализированным экземпляром
        Car.carCount += 1
    }
    
    //Деинициализатор
    deinit {
        Car.carCount -= 1 //уменьшаем количество авто на 1
    }
    
    ///Изменение состояния окон
    /// - parameter windowsAction: открыть, закрыть
    func switchWindowsState(windowsAction: WindowsActions) {
        switch windowsAction {
        case .openWindows:
            guard windowState == .isOpen else {
                return self.windowState = .isOpen
            }
        case .closeWindows:
            guard windowState == .isClose else {
                return self.windowState = .isClose
            }
        }
    }
    
    /// Зажигание двигателя
    /// - parameter engineAction: завести, заглушить
    func switchEngineState(engineAction: EngineActions) {
        switch engineAction {
        case .startEngine:
            guard engineState == .on else {
                return self.engineState = .on
            }
        case .stopEngine:
            guard engineState == .off else {
                return self.engineState = .off
            }
        }
    }
    
    ///Узнать поместится груз в 100 литров в багажник авто или нет
    /// - parameter cargoActions: попытаться погрузить 100л груз, попытаться выгрузить 100л груз
    func loadOrUnload(cargoActions: CargoActions) {
        switch cargoActions {
        case .load100Liters:
            if freeSpace >= 100 {
                self.filledVolume += 100
                print("Груз в 100л погружен в багажник")
            } else {
                print("Недостаточно свободного места в багажнике для погрузки")
            }
        case .unload100Liters:
            if filledVolume > 100 {
                self.filledVolume -= 100
                print("Груз в 100л выгружен из багажника")
            } else {
                print("Недостаточный объем груза в багажнике для выгрузки")
            }
        }
    }
    
    ///Метод класса для вывода информации о количестве авто
    static func countOfCar(){
        print("Количество автомобилей \(carCount)")
    }
}
