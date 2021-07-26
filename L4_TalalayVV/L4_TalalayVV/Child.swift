//
//  childClasses.swift
//  L4_TalalayVV
//
//  Created by Виталий Талалай on 22.07.2021.
//

import Foundation

//Описываю первого наследника класса Car

///первый подкласс SportCar для класса Car
class SportCar: Car {
    ///Разновидность  двигателя авто
    let engineType: EngineType
    ///Состояние люка авто
    var hatchState: HatchState
    
    //инициализатор наследника
    ///- parameter carModel: Марка и модель авто
    ///- parameter manufactureYear: Год выпуска авто
    ///- parameter trunkVolume: Объем багажника авто
    ///- parameter engineState: Состояние двигателя: заглушен или заведен
    ///- parameter windowState: Состояние окон: открыты или закрыты
    ///- parameter filledVolume: Занятый объем багажника
    ///- parameter hatchState: Состояние люка авто
    ///- parameter engineType: Разновидность  двигателя авто
    init?(carModel: String, manufactureYear: Int,
          trunkVolume: Double, engineState: EngineState,
          windowState: WindowsState, filledVolume: Double,
          hatchState: HatchState, engineType: EngineType) {
        self.hatchState = hatchState
        self.engineType = engineType
        //передаем значения в инициализатор родителя
        super.init(carModel: carModel, manufactureYear: manufactureYear,
                   trunkVolume: trunkVolume, engineState: engineState,
                   windowState: windowState, filledVolume: filledVolume)
    }
    
    ///Изменить состояние люка
    /// - parameter hatchAction: открыть, закрыть
    func switchHatchState(hatchAction: HatchActions) {
        switch hatchAction {
        case .openHatch:
            guard hatchState == .isOpen else {
                return self.hatchState = .isOpen
            }
        case .closeHatch:
            guard hatchState == .isClose else {
                return self.hatchState = .isClose
            }
        }
    }
}


/*
 описываю второго наследника класса Car и запрещаю создание новых наследников
 от текущего
*/

///второй подкласс TrunkCar для класса Car
final class TrunkCar: Car {
    ///Наличие поддержки полного привода
    let supportAWD: Bool
    ///Состояние бака
    var tankLevel: TankLevel {
        willSet {
            if newValue == .isFull {
                print("Бак будет заполнен")
            } else {
                print("Бак будет опустошен")
            }
        }
    }
    
    //инициализатор наследника
    ///- parameter carModel: Марка и модель авто
    ///- parameter manufactureYear: Год выпуска авто
    ///- parameter trunkVolume: Объем багажника авто
    ///- parameter engineState: Состояние двигателя: заглушен или заведен
    ///- parameter windowState: Состояние окон: открыты или закрыты
    ///- parameter filledVolume: Занятый объем багажника
    ///- parameter tankLevel: Состояние бака авто
    ///- parameter supportAWD: Наличие поддержки полного привода
    init?(carModel: String, manufactureYear: Int,
          trunkVolume: Double, engineState: EngineState,
          windowState: WindowsState, filledVolume: Double,
          tankLevel: TankLevel, supportAWD: Bool) {
        self.tankLevel = tankLevel
        self.supportAWD = supportAWD
        //передаем значения в инициализатор родителя
        super.init(carModel: carModel, manufactureYear: manufactureYear,
                   trunkVolume: trunkVolume, engineState: engineState,
                   windowState: windowState, filledVolume: filledVolume)
    }
    
    ///Изменение состояния бака
    /// - parameter tankAction: опустошить бак, заполнить бак
    func switchTankState(tankAction: TankActions) {
        switch tankAction {
        case .emptyTank:
            self.tankLevel = .isEmpty
        case .fillTank:
            self.tankLevel = .isFull
        }
    }
}
