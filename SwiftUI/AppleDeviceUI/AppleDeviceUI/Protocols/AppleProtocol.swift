//
//  AppleProtocol.swift
//  AppleDeviceUI
//
//  Created by gnksbm on 2023/07/04.
//

import Foundation

protocol AppleDevice {
    var deviceName: String { get set }
    var devicePrice: Int { get set }
}

protocol OperatingSystem {
    var osName: String { get set }
    var latestOSVersion: Double { get set }
}

protocol Visilble {
    var displayInch: Double { get set }
    var cameraCount: Int { get set }
}

enum ChargingCable {
    case cType, lightning, none
}

protocol Battery {
    var batteryCapacity: Int { get set }
    var chargingCable: ChargingCable { get set }
    var wirelessChargeable: Bool { get set }
}

