import Foundation
// Суть понятна, но ничего интереснее этого примера не смог придумать


enum Connection{
    case good, bad
}

enum Errors: Error{
    case noConnection, storageIsFull
}


class Phone{
    var connection = Connection.good
    var maxStorage = 100
    var storageIsBusy = 0
    
    func saveFromInternet(size: Int) -> (Int?, Errors?){
        guard size + storageIsBusy <= maxStorage else{
            return (nil, Errors.storageIsFull)
        }
        guard connection == .good else {
            return(nil, Errors.noConnection)
        }
        storageIsBusy += size
        return(storageIsBusy, nil)
    }
}

class Phone1{
    var connection = Connection.good
    var maxStorage = 100
    var storageIsBusy = 0
    
    func saveFromInternet(size: Int) throws -> Int{
        guard size + storageIsBusy <= maxStorage else{
            throw Errors.storageIsFull
        }
        guard connection == .good else {
            throw Errors.noConnection
        }
        return storageIsBusy
    }
}

var phone = Phone()
phone.connection = .good
phone.saveFromInternet(size: 99)

phone.saveFromInternet(size: 99)
phone.connection = .bad
phone.saveFromInternet(size: 1)

var phone1 = Phone1()
do {
    try phone1.saveFromInternet(size: 200)
}catch let error{
    print(error)
}
