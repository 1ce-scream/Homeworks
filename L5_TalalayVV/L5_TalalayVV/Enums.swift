//
//  Enums.swift
//  L5_TalalayVV
//
//  Created by Виталий Талалай on 25.07.2021.
//

import Foundation


///Состояние двигателя: запущен, заглушен
enum EngineState: String {
    case on = "Двигатель запущен"
    case off = "Двигатель заглушен"
}

///Действия с двигателем: завести, заглушить
enum EngineActions {
    case startEngine, stopEngine
}

///Состояние окон: открыты, закрыты
enum WindowsState: String {
    case isOpen = "Окна открыты"
    case isClose = "Окна закрыты"
}

///Действия с окнами: открыть,закрыть
enum WindowsActions {
    case openWindows, closeWindows
}

///Состояние люка: открыт, закрыт
enum HatchState: String {
    case isOpen = "Люк открыт"
    case isClose = "Люк закрыт"
}

///Состояние бака: пуст, полон
enum TankLevel: String {
   case isEmpty = "Бак пустой"
   case isFull = "Бак полный"
}
