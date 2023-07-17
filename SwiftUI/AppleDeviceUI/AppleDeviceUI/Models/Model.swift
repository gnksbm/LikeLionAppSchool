//
//  Model.swift
//  AppleDeviceUI
//
//  Created by gnksbm on 2023/07/04.
//

import Foundation

let appleDeviceList: [[Any]] = [iPhoneList, iPadList, macBookList, desktopList, displayList, appleWatchList, homePodList, appleTVList]
let appleDeviceList2: [Any] = [iPhone, iPhonePro, iPad, iPadPro, macBookAir, macBookPro, appleWatch, appleWatchUltra]

let iPhoneList = [iPhone, iPhonePro]
let iPadList = [iPad, iPadPro]
let macBookList = [macBookAir, macBookPro]
let desktopList = [iMac, macMini]
let displayList = [studioDisplay]
let appleWatchList = [appleWatch, appleWatchUltra]
let homePodList = [homePod]
let appleTVList = [appleTV]

let iPhone: IPhone = IPhone(deviceName: "iPhone 14", devicePrice: 1250000, os: .iOS, displayInch: 6.1, cameraCount: 2, batteryCapacity: 3729, chargingCable: .lightning, wirelessChargeable: true)
let iPhonePro: IPhone = IPhone(deviceName: "iPhone 14 Pro", devicePrice: 1550000, os: .iOS, displayInch: 6.1, cameraCount: 3, batteryCapacity: 3200, chargingCable: .lightning, wirelessChargeable: true)

let iPad: IPad = IPad(deviceName: "iPad", devicePrice: 679000, os: .iPadOS, displayInch: 10.8, cameraCount: 1, batteryCapacity: 7538, chargingCable: .cType, wirelessChargeable: false)
let iPadPro: IPad = IPad(deviceName: "iPad Pro", devicePrice: 1729000, os: .iPadOS, displayInch: 12.9, cameraCount: 3, batteryCapacity: 9720, chargingCable: .cType, wirelessChargeable: false)

let macBookAir: MacBook = MacBook(deviceName: "Macbook Air", devicePrice: 1890000, os: .macOS, displayInch: 15.3, cameraCount: 1, batteryCapacity: 18119, chargingCable: .cType, wirelessChargeable: false)
let macBookPro: MacBook = MacBook(deviceName: "Macbook Pro 16", devicePrice: 3490000, os: .macOS, displayInch: 16, cameraCount: 1, batteryCapacity: 27027, chargingCable: .cType, wirelessChargeable: false)

let iMac: Desktop = Desktop(deviceName: "iMac", devicePrice: 1790000, os: .macOS)
let macMini: Desktop = Desktop(deviceName: "Mac mini", devicePrice: 8500000, os: .macOS)

let studioDisplay: Display = Display(deviceName: "studioDisplay", devicePrice: 2090000, displayInch: 27, cameraCount: 1)

let appleWatch: AppleWatch = AppleWatch(deviceName: "AppleWatch 8", devicePrice: 599000, os: .watchOS, displayInch: 1.6, cameraCount: 0, batteryCapacity: 282, chargingCable: .none, wirelessChargeable: true)
let appleWatchUltra: AppleWatch = AppleWatch(deviceName: "AppleWatch Ultra", devicePrice: 1149000, os: .watchOS, displayInch: 1.9, cameraCount: 0, batteryCapacity: 542, chargingCable: .none, wirelessChargeable: true)

let homePod: SoundDevice = SoundDevice(deviceName: "HomePod", devicePrice: 389000)

let appleTV: AppleTV = AppleTV(deviceName: "AppleTV", devicePrice: 219000, os: .tvOS)

enum Platform: String {
    case iOS, iPadOS, macOS, watchOS, tvOS
    
    var latestVersion: Double {
        switch self {
        case .iOS:
            return 16.5
        case .iPadOS:
            return 16.5
        case .macOS:
            return 13.4
        case .watchOS:
            return 9.5
        case .tvOS:
            return 16.5
        }
    }
}

enum ChargingCable: String {
    case cType, lightning, none
}

struct IPhone: AppleDevice, OperatingSystem, Visuable, Battery {
    var id: UUID = UUID()
    // AppleDevice
    var deviceName: String
    var devicePrice: Int
    // OperatingSystem
    var os: Platform
    // Visuable
    var displayInch: Double
    var cameraCount: Int
    // Battery
    var batteryCapacity: Int
    var chargingCable: ChargingCable
    var wirelessChargeable: Bool
}

struct IPad: AppleDevice, OperatingSystem, Visuable, Battery {
    var id: UUID = UUID()
    // AppleDevice
    var deviceName: String
    var devicePrice: Int
    // OperatingSystem
    var os: Platform
    // Visuable
    var displayInch: Double
    var cameraCount: Int
    // Battery
    var batteryCapacity: Int
    var chargingCable: ChargingCable
    var wirelessChargeable: Bool
}

struct MacBook: AppleDevice, OperatingSystem, Visuable, Battery {
    var id: UUID = UUID()
    // AppleDevice
    var deviceName: String
    var devicePrice: Int
    // OperatingSystem
    var os: Platform
    // Visuable
    var displayInch: Double
    var cameraCount: Int
    // Battery
    var batteryCapacity: Int
    var chargingCable: ChargingCable
    var wirelessChargeable: Bool
}

struct AppleWatch: AppleDevice, OperatingSystem, Visuable, Battery {
    var id: UUID = UUID()
    // AppleDevice
    var deviceName: String
    var devicePrice: Int
    // OperatingSystem
    var os: Platform
    // Visuable
    var displayInch: Double
    var cameraCount: Int
    // Battery
    var batteryCapacity: Int
    var chargingCable: ChargingCable
    var wirelessChargeable: Bool
}

struct Desktop: AppleDevice, OperatingSystem {
    var id: UUID = UUID()
    // AppleDevice
    var deviceName: String
    var devicePrice: Int
    // OperatingSystem
    var os: Platform
}

struct AppleTV: AppleDevice, OperatingSystem {
    var id: UUID = UUID()
    // AppleDevice
    var deviceName: String
    var devicePrice: Int
    // OperatingSystem
    var os: Platform
}

struct Display: AppleDevice, Visuable {
    var id: UUID = UUID()
    // AppleDevice
    var deviceName: String
    var devicePrice: Int
    // Visuable
    var displayInch: Double
    var cameraCount: Int
}

// 에어팟 - 배터리, 홈팟 - 채택X
// 포터블 논포터블을 분리 or 홈팟 삭제
struct SoundDevice: AppleDevice {
    var id: UUID = UUID()
    var deviceName: String
    var devicePrice: Int
}
