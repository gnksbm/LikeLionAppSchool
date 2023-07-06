//
//  OsProtocol.swift
//  AppleDeviceUI
//
//  Created by gnksbm on 2023/07/04.
//

import Foundation

protocol OperatingSystem {
    var osName: String { get set }
    var latestOSVersion: Double { get set }
}
