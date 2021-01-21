import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

enum WindowState {
    case open, close
}

enum EngineState {
    case on, off
}

protocol Car {
    var brand: String {get}
    var weight: Int {get}
    var year: Int {get}
    var engineState: EngineState {get set}
    var windowState: WindowState {get set}
    func makeNoise()
    mutating func changeEngineState()
    mutating func changeWindowsState()
}
extension Car {
    mutating func changeEngineState(){
        self.engineState = self.engineState == EngineState.on ? EngineState.off : EngineState.on
    }
    mutating func changeWindowsState(){
        self.windowState = self.windowState == WindowState.open ? WindowState.close : WindowState.open
    }
}

class SportCar: Car{
    
    var brand: String
    var weight: Int
    var year: Int
    var engineState: EngineState
    var windowState: WindowState
    func makeNoise() {
        print("Рев мотора")
    }
    init(brand: String, weight: Int, year: Int, engineState: EngineState, windowState: WindowState){
        self.brand = brand
        self.weight = weight
        self.year = year
        self.engineState = engineState
        self.windowState = windowState
    }
    
}
extension SportCar: CustomStringConvertible{
    private func windowStateString() -> String{
        return self.windowState == WindowState.close ? "Закрыты" : "Открыты"
    }
    private func engineStateString() -> String{
        return self.engineState == EngineState.on ? "Запущен" : "Заглушен"
    }
    var description: String{
        return "Брэнд: \(self.brand), Масса: \(self.weight), Год выпуска: \(self.year), Окна: \(windowStateString()), Двигатель: \(engineStateString())"
    }
}

class TrunkCar: Car{
    
    var brand: String
    var weight: Int
    var year: Int
    var engineState: EngineState
    var windowState: WindowState
    func makeNoise() {
        print("Громкий гудок")
    }
    init(brand: String, weight: Int, year: Int, engineState: EngineState, windowState: WindowState){
        self.brand = brand
        self.weight = weight
        self.year = year
        self.engineState = engineState
        self.windowState = windowState
    }
    
}
extension TrunkCar: CustomStringConvertible{
    private func windowStateString() -> String{
        return self.windowState == WindowState.close ? "Закрыты" : "Открыты"
    }
    private func engineStateString() -> String{
        return self.engineState == EngineState.on ? "Запущен" : "Заглушен"
    }
    var description: String{
        return "Брэнд: \(self.brand), Масса: \(self.weight), Год выпуска: \(self.year), Окна: \(windowStateString()), Двигатель: \(engineStateString())"
    }
}

var sportCar1 = SportCar(brand: "audi", weight: 1600, year: 2010, engineState: EngineState.off, windowState: WindowState.close)
var sportCar2 = SportCar(brand: "bmw", weight: 1450, year: 2020, engineState: EngineState.on, windowState: WindowState.open)
var trunkCar1 = TrunkCar(brand: "kamaz", weight: 12000, year: 2012, engineState: EngineState.on, windowState: WindowState.close)
var trunkCar2 = TrunkCar(brand: "skania", weight: 14000, year: 2015, engineState: EngineState.off, windowState: WindowState.open)
sportCar2.makeNoise()
sportCar1.changeEngineState()
trunkCar2.changeWindowsState()
trunkCar1.makeNoise()
print(sportCar1, sportCar2,trunkCar1, trunkCar2, separator:"\n")


