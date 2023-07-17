//
//  OsProtocol.swift
//  AppleDeviceUI
//
//  Created by gnksbm on 2023/07/04.
//

import Foundation

protocol OperatingSystem {
    var os: Platform { get set }
    var latestOSVersion: Double { get }
}

extension OperatingSystem {
    var latestOSVersion: Double {
        os.latestVersion
    }
}
