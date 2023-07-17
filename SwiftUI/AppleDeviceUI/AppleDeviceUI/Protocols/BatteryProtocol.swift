//
//  BatteryProtocol.swift
//  AppleDeviceUI
//
//  Created by gnksbm on 2023/07/04.
//

import Foundation

protocol Battery {
    var batteryCapacity: Int { get set }
    var chargingCable: ChargingCable { get set }
    var wirelessChargeable: Bool { get set }
}
