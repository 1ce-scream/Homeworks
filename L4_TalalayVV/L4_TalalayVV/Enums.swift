//
//  enums.swift
//  L4_TalalayVV
//
//  Created by Виталий Талалай on 22.07.2021.
//

import Foundation

//перечисления для родительского класса
///Состояние двигателя
enum EngineState: String {
    case on = "Двигатель запущен"
    case off = "Двигатель заглушен"
}

///Состояние окон
enum WindowsState: String {
    case isOpen = "Окна открыты"
    case isClose = "Окна закрыты"
}

///Действия с окнами: открыть,закрыть
enum WindowsActions {
    case openWindows, closeWindows
}

///Действия с двигателем: завести, заглушить
enum EngineActions {
    case startEngine, stopEngine
}

///Действия с грузом в 100 литров: погрузить, выгрузить
enum CargoActions {
    case load100Liters, unload100Liters
}

//Перечисления для первого наследника класса Car
///Состояние люка
enum HatchState: String {
    case isOpen = "Люк открыт"
    case isClose = "Люк закрыт"
}

///Разновидность двигателя
enum EngineType: String {
    case v12t = "12 циллиндров Biturbo"
    case v8t = "8 цилиндров Turbo"
    case v6t = "6 цилиндров Turbo"
}

///Действия с люком: открыть, закрыть
enum HatchActions {
    case openHatch, closeHatch
}


//перечисления для второго наследника класса Car
///Состояние бака
enum TankLevel: String {
   case isEmpty = "Бак пустой"
   case isFull = "Бак полный"
}

///Действия с баком: опустошить, заполнить
enum TankActions {
    case emptyTank, fillTank
}
