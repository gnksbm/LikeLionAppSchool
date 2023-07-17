//
//  AppleProtocol.swift
//  AppleDeviceUI
//
//  Created by gnksbm on 2023/07/04.
//

import Foundation

protocol AppleDevice: Identifiable {
    var deviceName: String { get set }
    var devicePrice: Int { get set }
}
