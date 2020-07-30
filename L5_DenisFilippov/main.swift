//
//  main.swift
//  L5_DenisFilippov
//
//  Created by Denis Filippov on 31/7/20.
//  Copyright © 2020 Denis Filippov. All rights reserved.
//

import Foundation

enum windows{
    case open
    case closed
}
enum clickStart{
    case on
    case off
}
enum sound{
    case On
    case Off
}
enum bootState{
    case Full
    case Empty
}
protocol Car {
    var brand: String {get}
    var release: Int {get}
    var engineState: clickStart {get set}
    var windowsState: windows {get set}
}
extension Car {
    mutating func changeEngineState(engineState: clickStart){
        self.engineState = engineState
    }
    mutating func chageWindowsState(windowsState: windows){
        self.windowsState = windowsState
    }
}
class usualyCar: Car{
    var brand: String
    var release: Int
    var engineState: clickStart = .off
    var windowsState: windows = .closed
    init(brand: String, release: Int) {
        self.brand = brand
        self.release = release
    }
}
class sportCar: usualyCar, CustomStringConvertible{
    var sound: sound = .Off
    var description: String{
        return "engine is \(engineState), windows is \(windowsState), sound is \(sound), release date is \(release)"
    }
}
class trunkCar: usualyCar, CustomStringConvertible{
    var trunkState: bootState = .Empty
    var description: String{
        return "engine is \(engineState), windows is \(windowsState), trunk is \(trunkState), release date is \(release)"
    }
}
var bmw = sportCar(brand: "BMW", release: 2016)
var man = trunkCar(brand: "MAN", release: 1985)
bmw.changeEngineState(engineState: .on)
bmw.sound = .On
man.chageWindowsState(windowsState: .open)
man.trunkState = .Full
print(bmw.description)
print(man.description)
