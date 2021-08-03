/*

1.    Придумать класс, методы которого могут завершаться неудачей
        и возвращать либо значение, либо ошибку Error?. Реализовать их вызов
        и обработать результат метода при помощи конструкции if let,
        или guard let.
2.    Придумать класс, методы которого могут выбрасывать ошибки.
        Реализуйте несколько throws-функций. Вызовите их и обработайте
        результат вызова при помощи конструкции try/catch.
*/


import Foundation

//Пункт 1

//инициализация экземпляра класса Car
var car = Car(model: "Mazda", trunkVolume: 200)

//Вывод информации о экземпляре авто и состоянии объема багажника
print(car!)
car!.printTrunkSpaceState()

print("=============================")

//Оброботка результатов метода loadCargo при помощи конструкции if let
if let error = car!.loadCargo(cargoVolume: 300) {
    print("Произошла ошибка: \(error) \n")
} else {
    car!.printTrunkSpaceState()
}

if let error = car!.loadCargo(cargoVolume: -100) {
    print("Произошла ошибка: \(error) \n")
} else {
    car!.printTrunkSpaceState()
}

if let error = car!.loadCargo(cargoVolume: 100) {
    print("Произошла ошибка: \(error) \n")
} else {
    car!.printTrunkSpaceState()
}

print("=============================")

//Оброботка результатов метода  unloadCargo при помощи конструкции if let
if let error = car!.unloadCargo(cargoVolume: 200) {
    print("Произошла ошибка: \(error) \n")
} else {
    car!.printTrunkSpaceState()
}

if let error = car!.unloadCargo(cargoVolume: -100) {
    print("Произошла ошибка: \(error) \n")
} else {
    car!.printTrunkSpaceState()
}

if let error = car!.unloadCargo(cargoVolume: 100) {
    print("Произошла ошибка: \(error) \n")
} else {
    car!.printTrunkSpaceState()
}

print("=============================")


//Пункт 2

//Оброботка результатов метода unsafeLoadCargo при помощи конструкции try/catch
do {
    try car!.unsafeLoadCargo(cargoVolume: 300)
    car!.printTrunkSpaceState()
} catch let error {
    print("\(error) \n")
}

do {
    try car!.unsafeLoadCargo(cargoVolume: -100)
    car!.printTrunkSpaceState()
} catch let error {
    print("\(error) \n")
}

do {
    try car!.unsafeLoadCargo(cargoVolume: 100)
    car!.printTrunkSpaceState()
} catch let error {
    print("\(error) \n")
}

print("=============================")

//Оброботка результатов метода unsafeUnloadCargo при помощи конструкции try/catch
do {
    try car!.unsafeUnloadCargo(cargoVolume: -100)
    car!.printTrunkSpaceState()
} catch let error {
    print("\(error) \n")
}

do {
    try car!.unsafeUnloadCargo(cargoVolume: 200)
    car!.printTrunkSpaceState()
} catch let error {
    print("\(error) \n")
}

do {
    try car!.unsafeUnloadCargo(cargoVolume: 100)
    car!.printTrunkSpaceState()
} catch let error {
    print("\(error) \n")
}

print("=============================")
