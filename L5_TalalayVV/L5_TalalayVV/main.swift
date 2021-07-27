//
//  main.swift
//  L5_TalalayVV
//
//  Created by Виталий Талалай on 25.07.2021.
//

/*
 1.    Создать протокол «Car» и описать свойства, общие для автомобилей,
        а также метод действия.
 2.    Создать расширения для протокола «Car» и реализовать в них методы
        конкретных действий с автомобилем: открыть/закрыть окно,
        запустить/заглушить двигатель и т.д.
        (по одному методу на действие, реализовывать следует только те действия,
        реализация которых общая для всех автомобилей).
 3.    Создать два класса, имплементирующих протокол «Car»: trunkCar и sportCar.
        Описать в них свойства, отличающиеся для спортивного автомобиля
        и грузового автомобиля.
 4.    Для каждого класса написать расширение,
        имплементирующее протокол «CustomStringConvertible».
 5.    Создать несколько объектов каждого класса.
        Применить к ним различные действия.
 6.    Вывести сами объекты в консоль.
 */

import Foundation

//Инициализация объекта класса SportCar
var sportCar1 = SportCar(carModel: "Ferrari", manufactureYear: 2020,
                         trunkVolume: 100, engineState: .off,
                         windowState: .isClose, hatchState: .isClose,
                         filledVolume: 50)

//действия с двигателем
print("\(sportCar1!.engineState.rawValue)")
sportCar1!.switchEngineState(engineAction: .startEngine)
print("\(sportCar1!.engineState.rawValue) \n")
//действия с люком
print("\(sportCar1!.hatchState.rawValue)")
sportCar1!.switchState()
print("\(sportCar1!.hatchState.rawValue) \n")

//вывод объекта в консоль
print(sportCar1!)

//Инициализация объекта класса TrunkCar
var trunkCar1 = TrunkCar(carModel: "Ford", manufactureYear: 2010,
                         trunkVolume: 300, engineState: .off,
                         windowState: .isClose, tankLevel: .isFull,
                         filledVolume: 100)

//действия с окнами
print("\(trunkCar1!.windowState.rawValue)")
trunkCar1!.switchWindowsState(windowsAction: .openWindows)
print("\(trunkCar1!.windowState.rawValue) \n")
//действия с баком
print("\(trunkCar1!.tankLevel.rawValue)")
trunkCar1!.switchState()
print("\(trunkCar1!.tankLevel.rawValue) \n")

//вывод объекта в консоль
print(trunkCar1!)
