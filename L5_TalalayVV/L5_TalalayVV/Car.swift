//
//  CarProtocol.swift
//  L5_TalalayVV
//
//  Created by Виталий Талалай on 25.07.2021.
//

import Foundation

protocol CarProtocol {
    ///Марка и модель авто
    var carModel: String { get }
    ///Год выпуска авто
    var manufactureYear: Int { get }
    ///Объем багажника авто
    var trunkVolume: Double { get }
    ///Занятый объем багажника
    var filledVolume: Double { get }
    ///Состояние двигателя: заглушен или заведен
    var engineState: EngineState { get set }
    ///Состояние окон: открыты или закрыты
    var windowState: WindowsState { get set }
    ///Своодный объем багажника
    var freeSpace: Double { get }
    //метод для исполнения ТЗ
    func switchState()
}
