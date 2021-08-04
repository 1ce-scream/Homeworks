//
//  Enums.swift
//  L7_TalalayVV
//
//  Created by Виталий Талалай on 03.08.2021.
//

import Foundation

///Перечисление для возможных ошибок в методах авто
enum CarError: Error {
    case notEnoughFreeSpace
    case notEnoughCargoVolume
    case incorrectCargoVolume
    
    /*
    Локализация кейсов для последующей имплементации
    протокола CustomStringConvertible
    */
    var localizedDescription: String {
        switch self {
        case .notEnoughFreeSpace:
            return "Недостаточно свободного места в багажнике"
        case .notEnoughCargoVolume:
            return "Недостаточный объем груза в багажнике"
        case .incorrectCargoVolume:
            return "Неправильно введен объем груза"
        }
    }
}
