//
//  main.swift
//  L4_TalalayVV
//
//  Created by Виталий Талалай on 22.07.2021.
//

import Foundation

//инициализирую экземпляр родительского класса
var car1 = Car(carModel: "Lada Kalina", manufactureYear: 2020,
               trunkVolume: 300.0, engineState: .off,
               windowState: .isClose, filledVolume: 88.0)
print("===Экземпляр родительского класса=== \n")

//выполняю действия с экземпляром родительского класса
car1!.switchEngineState(engineAction: .startEngine)
car1!.switchWindowsState(windowsAction: .openWindows)
print("Машина \(car1!.carModel) \(car1!.manufactureYear) года выпуска.",
      "Объем багажника \(car1!.trunkVolume) л,",
      "занято в багажнике \(car1!.filledVolume) л.",
      "Оставщееся свободное место в багажнике \(car1!.freeSpace) л.",
      "\(car1!.engineState.rawValue). \(car1!.windowState.rawValue).\n")

/*
инициализирую экземпляр первого наследника SportCar
и проверяю работоспособность инициализатора родительского класса,
 в случае ввода некорректных значений для свойств наследника.
*/

print("===Проверка инициализатора с вводом некорректных значений=== \n")
var sportCar1 = SportCar(carModel: "UAZ", manufactureYear: 1890,
                         trunkVolume: 200, engineState: .on,
                         windowState: .isOpen, filledVolume: 100,
                         hatchState: .isOpen, engineType: .v12t)

/*
инициализирую экземпляр первого наследника SportCar
с корректно введенными значениями свойств
*/

var sportCar2 = SportCar(carModel: "Ferrari F8", manufactureYear: 2020,
                         trunkVolume: 50, engineState: .on,
                         windowState: .isClose, filledVolume: 12,
                         hatchState: .isClose, engineType: .v12t)
print("===Экземпляр наследник SportCar=== \n")

//выполняю действия с экземпляром
sportCar2!.switchHatchState(hatchAction: .openHatch)
sportCar2!.switchEngineState(engineAction: .stopEngine)
sportCar2!.switchWindowsState(windowsAction: .openWindows)
sportCar2!.loadOrUnload(cargoActions: .load100Liters)

print("Машина \(sportCar2!.carModel) \(sportCar2!.manufactureYear) года выпуска.",
      "Двигатель \(sportCar2!.engineType.rawValue).",
      "Объем багажника \(sportCar2!.trunkVolume) л,",
      "занято в багажнике \(sportCar2!.filledVolume) л.",
      "Оставщееся свободное место в багажнике \(sportCar2!.freeSpace) л.",
      "\(sportCar2!.engineState.rawValue). \(sportCar2!.windowState.rawValue).",
      "\(sportCar2!.hatchState.rawValue).\n")

print("Количество инициализированных экземпляров авто: \(Car.carCount) \n")

// инициализирую экземпляр первого наследника SportCar
var trunkCar1 = TrunkCar(carModel: "Ford F100", manufactureYear: 2200,
                         trunkVolume: 200, engineState: .on,
                         windowState: .isOpen, filledVolume: 100,
                         tankLevel: .isFull, supportAWD: true)
print("===Экземпляр наследник TrunkCar=== \n")

//выполняю действия с экземпляром
trunkCar1!.switchWindowsState(windowsAction: .openWindows)
print(trunkCar1!.tankLevel.rawValue)
trunkCar1!.switchTankState(tankAction: .emptyTank)
print(trunkCar1!.tankLevel.rawValue)
trunkCar1!.engineState = .off

print("Машина \(trunkCar1!.carModel) \(trunkCar1!.manufactureYear) года выпуска.",
      "Объем багажника \(trunkCar1!.trunkVolume) л,",
      "занято в багажнике \(trunkCar1!.filledVolume) л.",
      "Оставщееся свободное место в багажнике \(trunkCar1!.freeSpace) л.",
      "\(trunkCar1!.engineState.rawValue). \(trunkCar1!.windowState.rawValue).",
      "\(trunkCar1!.tankLevel.rawValue).",
      "Поддержка полного привода: \(trunkCar1!.supportAWD). \n")

print("Количество инициализированных экземпляров авто: \(Car.carCount) \n")

//Удаляем экземпляры авто
print("===Проверка удалились ли экземпляры из памяти=== \n")
car1 = nil
sportCar2 = nil
trunkCar1 = nil
print("Количество инициализированных экземпляров авто: \(Car.carCount) \n")
