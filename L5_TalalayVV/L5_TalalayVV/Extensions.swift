//
//  Extensions.swift
//  L5_TalalayVV
//
//  Created by Виталий Талалай on 25.07.2021.
//

import Foundation

//расширение протокола Car с методом для переключения состояния окон
extension CarProtocol {
    ///метод для переключения состояния окон
    ///- parameter windowsAction: открыть, закрыть
    mutating func switchWindowsState(windowsAction: WindowsActions) {
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
}


//расширение протокола Car с методом для переключения состояния двигателя
extension CarProtocol {
    ///метод для переключения состояния двигателя
    ///- parameter engineAction: запустить, заглушить
    mutating func switchEngineState(engineAction: EngineActions) {
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
}

//Расширение класса SportCar имплементирующее протокол «CustomStringConvertible»
extension SportCar: CustomStringConvertible {
    var description: String {
        return
            """
            Машина \(carModel) \(manufactureYear) года выпуска.
            Объем багажника \(trunkVolume) л.
            Занято в багажнике \(filledVolume) л.
            Оставщееся свободное место в багажнике \(freeSpace) л.
            \(engineState.rawValue). \(windowState.rawValue).
            \(hatchState.rawValue).\n
            """
    }
}

//Расширение класса TrunkCar имплементирующее протокол «CustomStringConvertible»
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return
            """
            Машина \(carModel) \(manufactureYear) года выпуска.
            Объем багажника \(trunkVolume) л.
            Занято в багажнике \(filledVolume) л.
            Оставщееся свободное место в багажнике \(freeSpace) л.
            \(engineState.rawValue). \(windowState.rawValue).
            \(tankLevel.rawValue).\n
            """
    }
}
