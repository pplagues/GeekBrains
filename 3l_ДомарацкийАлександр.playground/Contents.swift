import Foundation
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль
enum EngineState: String{
    case on, off
}
enum WindowState: String{
    case open, close
}
enum LoadUnload{
    case load(volume:  Int)
    case unload(volume: Int)
}

struct SportCar {
    var model: String
    var year: Int
    var capacity: Int
    var engineState: EngineState
    var windowState: WindowState
    var capacityIsBusy = 0{
        didSet{
            if self.capacityIsBusy > self.capacity{
                print("Багажник полный, \(self.capacityIsBusy - self.capacity) не уместилось")
                self.capacityIsBusy = self.capacity
                
            }else if self.capacityIsBusy < 0{
                self.capacityIsBusy = 0
                print("Багажник пуст")
            }
        }
    }
    
    mutating func changeEngineState(action: EngineState){
        self.engineState = action
    }
    mutating func changeWindowState(action: WindowState){
        self.windowState = action
    }
    mutating func loadAction(action: LoadUnload){
        switch action{
        case .load(let volumeToLoad):
            self.capacityIsBusy += volumeToLoad
        case .unload(let volumeToUnload):
            self.capacityIsBusy -= volumeToUnload
        }
    }
}

var honda = SportCar(model: "Civic", year: 1999, capacity: 370, engineState: .on, windowState: .close)
honda.windowState
honda.loadAction(action: .load(volume: 400))
honda.capacityIsBusy
honda.changeEngineState(action: .off)
honda.loadAction(action: .unload(volume: 600))
print(honda.engineState)
print(honda)

//со структурой TrunkCar по анологиии, заменить только багажник на кузов
