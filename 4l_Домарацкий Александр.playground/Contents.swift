import Foundation
//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum EngineState: String{
    case on, off
}
enum WindowState: String{
    case open, close
}
enum Nitro: String{
        case on, off
    }
enum Carrying: String{
    case low, medium, high
    }

class Car{
    var model: String
    var year: Int
    var capacity: Int
    var engineState: EngineState
    var windowState: WindowState
    
    init (model: String, year: Int, capacity: Int, engineState: EngineState, windowState: WindowState){
        self.model = model
        self.year = year
        self.capacity = capacity
        self.engineState = engineState
        self.windowState = windowState
    }
    func changeWindowState(){
        self.windowState = self.windowState == .open ? .close : .open
    }
    func changeEngineState(){
        self.engineState = self.engineState == .on ? .off : .on
    }
    func someAction() {}
    func description() {
        print(model, year, capacity, engineState, windowState)
    }
}

class SportCar: Car{
    
    var nitro: Nitro
    static var carCount = 0
    
    init (nitro: Nitro, model: String, year: Int, capacity: Int, engineState: EngineState, windowState: WindowState){
        self.nitro = nitro
        super.init(model: model, year: year, capacity: capacity, engineState: engineState, windowState: windowState)
        SportCar.carCount += 1
    }
    override func someAction() {
        print("Закись озота \(nitro)")
    }
    override func description() {
        print("Модель: \(model),Год: \(year),Объем: \(capacity),Двигатель: \(engineState),Окна: \(windowState),Нитро: \(nitro)")
    }
}
class TrunkCar: Car{
    
    var carrying: Carrying
    static var carCount = 0
    
    init (carrying: Carrying, model: String, year: Int, capacity: Int, engineState: EngineState, windowState: WindowState){
        self.carrying = carrying
        super.init(model: model, year: year, capacity: capacity, engineState: engineState, windowState: windowState)
        TrunkCar.carCount += 1
    }
    override func someAction() {
        print("Грузоподьемность \(carrying)")
    }
    override func description() {
        print("Модель: \(model),Год: \(year),Объем: \(capacity),Двигатель: \(engineState),Окна: \(windowState),Грузоподъемность: \(carrying)")
    }
}

var car1 = SportCar(nitro: Nitro.on, model: "Mazda", year: 2005, capacity: 360, engineState: EngineState.off, windowState: WindowState.open)
car1.someAction()
car1.nitro = .off
car1.nitro = .on
var car2 = TrunkCar(carrying: Carrying.high, model: "Kamaz", year: 1999, capacity: 40000, engineState: EngineState.off, windowState: WindowState.close)
car2.someAction()
car2.engineState = .on
car2.carrying = .low
car1.description()
car2.description()
SportCar.carCount
TrunkCar.carCount
car1.changeEngineState()

print(car1.engineState)


