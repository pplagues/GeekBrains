import Foundation

func quadratic(a: Double, b: Double, c: Double){
    let d: Double = pow(b,2) - 4 * a * c
    switch d{
    case 0... :
        let x1: Double = (-b - sqrt(d)) / 2 * a
        let x2: Double = (-b + sqrt(d)) / 2 * a
        print("Уравнение имеет 2 корня: \(x1) и \(x2)")
    case 0:
        let x: Double = (-b) / 2 * a
        print("Уравнение имеет один корень: \(x)")
    default:
        print("Уравнение корней не имеет")
    }
}

func triangel(cathetA: Double, cathetB: Double){
    let square = (cathetA * cathetB) / 2
    let gipothen = ((sqrt(pow(cathetA, 2) + pow(cathetB, 2))) * 100).rounded() / 100
    let perimeter = cathetA + cathetB + gipothen
    print("Площадь = \(square), гипотенуза = \(gipothen), периметр = \(perimeter)")
}

func deposit(money: Double, years: Int, interest: Double){
    var money = money
    for _ in 1...years{
        money += money * (interest / 100)
    }
    print("Вклад =  \((money * 100).rounded() / 100)")
}


quadratic(a: 3, b: 5, c: 2)
triangel(cathetA: 3, cathetB: 5)
deposit(money: 1000, years: 5, interest: 12.8)
