//
//
//  SwiftUIView.swift
//  AppleDeviceUI
//
//  Created by gnksbm on 2023/07/04.
//

import SwiftUI

struct IPadDetailView: View {
    var device: IPad
    
    var body: some View {
        VStack {
            AppleDeviceView(imageUrl: "", deviceName: device.deviceName, devicePrice: device.devicePrice)
            Form {
                Text("인치: \(device.displayInch)")
                Text("카메라 개수: \(device.cameraCount)")
                Text("배터리 용량: \(device.batteryCapacity)")
                Text("충전케이블: \(device.chargingCable.rawValue)")
                Text("OS: \(device.os.rawValue)")
                Text("무선 충전: \(device.wirelessChargeable ? "가능" : "불가능")")
                Text("최신OS 버전" + String(format: "%.1f", device.latestOSVersion))
            }
        }
        .font(.system(size: 30))
    }
}

struct IPadDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IPadDetailView(device: iPadPro)
    }
}
