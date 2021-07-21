import UIKit

//Первый вариант структуры на примере мониторов. Более простой. Никаких проверок нет. Инициализатор стандартный.

enum resolution: String {
    case res4K = "3840 x 2160 пикселей"
    case res2K = "2560 x 1440 пикселей"
    case FullHD = "1920 x 1080 пикселей"
    case HD = "1280 x 720 пикселей"
}
enum screenState: String {
    case on = "Экран включен"
    case off = "Экран выключен"
}
enum currentBrightness: Int {
    case min = 10
    case mid = 50
    case max = 100
}

struct Monitor {
    let manufacturer: String
    let model: String
    let diagonal: Double
    let resolution: resolution
    var screenState: screenState
    var currentBrightness: currentBrightness
    
    mutating func screenOn(_: screenState) {
        self.screenState = .on
    }
    mutating func screenOff(_: screenState) {
        self.screenState = .off
    }
    mutating func brightnessMin(_: currentBrightness) {
        self.currentBrightness = .min
    }
    mutating func brightnessMid(_: currentBrightness) {
        self.currentBrightness = .mid
    }
    mutating func brightnessMax(_: currentBrightness) {
        self.currentBrightness = .max
    }
}

var monitor1 = Monitor(manufacturer: "Samsung", model: "D15FHD", diagonal: 15.4, resolution: .FullHD, screenState: .off, currentBrightness: .min)
monitor1.screenState.rawValue
monitor1.screenOn(.on)
monitor1.screenState.rawValue
monitor1.currentBrightness.rawValue
monitor1.brightnessMax(.max)
monitor1.currentBrightness.rawValue

print("Монитор фирмы \(monitor1.manufacturer), модель: \(monitor1.model). Диагональ монитора \(monitor1.diagonal) дюймов. Разрешение монитора \(monitor1.resolution.rawValue). \(monitor1.screenState.rawValue). Текущая яркость экрана \(monitor1.currentBrightness.rawValue)% \n")


/*
 Второй вариант структуры на примере автомобилей. Более сложный. Одно свойство имеет наблюдатель. Одно свойство вычисляемое.
 У метода есть проверка исходных значений перед переключением. Написан инициализатор для проверки корректности введенных значений для свойств структуры.
*/

enum engineState: String {
    case on = "Двигатель запущен"
    case off = "Двигатель заглушен"
}
enum windowState: String {
    case isOpen = "Окна открыты"
    case isClose = "Окна закрыты"
}
enum carActions {
    case windowsOpen, windowsClose, engineStart, engineStop, load100LitersCargo, unload100LitersCargo
}
  
struct SportCar {
    let carModel: String
    let manufactureYear: Int
    let trunkVolume: Double
    var engineState: engineState
    var windowState: windowState
    
    //свойство с наблюдателем
    var filledVolume: Double {
        didSet {
            print("Занятый объем багажника изменился на \(abs(filledVolume - oldValue)) литров")
        }
    }
    
    //вычисляемое свойство
    var freeSpace: Double {
        get {
            return trunkVolume - filledVolume
        }
    }
    
    //метод для всех действий с автомобилем
    mutating func carActions(carActions: carActions) {
        switch carActions {
        case .windowsOpen:
            guard windowState == .isOpen else {
                return self.windowState = .isOpen
            }
        case .windowsClose:
            guard windowState == .isClose else {
                return self.windowState = .isClose
            }
        case .engineStart:
            guard engineState == .on else {
                return self.engineState = .on
            }
        case .engineStop:
            guard engineState == .off else {
                return self.engineState = .off
            }
        case .load100LitersCargo:
            if freeSpace >= 100 {
                self.filledVolume += 100
                print("Груз в 100л погружен в багажник")
            } else {
                print("Недостаточно свободного места в багажнике для погрузки")
            }
        case .unload100LitersCargo:
            if filledVolume > 100 {
                self.filledVolume -= 100
                print("Груз в 100л выгружен из багажника")
            } else {
                print("Недостаточный объем груза в багажнике для выгрузки")
            }
        }
    }
    
    //инициализатор для проверки корректности введенных значений свойств
    init?(carModel: String, manufactureYear: Int, trunkVolume: Double, engineState: engineState, windowState: windowState, filledVolume: Double) {
        guard manufactureYear >= 1900 && filledVolume <= trunkVolume else {
            print("Невозможно инициализировать экземпляр. Один из параметров введен неверно. manufactureYear должен быть >= 1900, filledVolume не должен превышать trunkVolume \n")
            return nil
        }
        self.carModel = carModel
        self.manufactureYear = manufactureYear
        self.trunkVolume = trunkVolume
        self.engineState = engineState
        self.windowState = windowState
        self.filledVolume = filledVolume
    }
}

var car1 = SportCar(carModel: "Ferrari F8 Tributo", manufactureYear: 2020, trunkVolume: 30.0, engineState: .off, windowState: .isClose, filledVolume: 29.0)
car1!.engineState.rawValue
car1!.carActions(carActions: .engineStart)
car1!.engineState.rawValue
car1!.carActions(carActions: .windowsOpen)
car1!.filledVolume = 20
car1!.freeSpace
print("Машина \(car1!.carModel) \(car1!.manufactureYear) года выпуска. Объем багажника \(car1!.trunkVolume) л, занято в багажнике \(car1!.filledVolume) л. Оставщееся свободное место в багажнике \(car1!.freeSpace) л. \(car1!.engineState.rawValue). \(car1!.windowState.rawValue). \n")

var car2 = SportCar(carModel: "Porshe Panamera", manufactureYear: 2019, trunkVolume: 100.0, engineState: .on, windowState: .isOpen, filledVolume: 0)
car2!.carActions(carActions: .windowsClose)
car2!.windowState.rawValue
car2!.carActions(carActions: .load100LitersCargo)
print("Машина \(car2!.carModel) \(car2!.manufactureYear) года выпуска. Объем багажника \(car2!.trunkVolume) л, занято в багажнике \(car2!.filledVolume) л. Оставщееся свободное место в багажнике \(car2!.freeSpace) л. \(car2!.engineState.rawValue). \(car2!.windowState.rawValue). \n")

var car3 = SportCar(carModel: "some car", manufactureYear: 1800, trunkVolume: 100, engineState: .off, windowState: .isClose, filledVolume: 50)
