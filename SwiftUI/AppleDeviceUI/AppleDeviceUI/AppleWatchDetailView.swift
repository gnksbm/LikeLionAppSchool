//
//
//  SwiftUIView.swift
//  AppleDeviceUI
//
//  Created by gnksbm on 2023/07/04.
//

import SwiftUI

struct AppleWatchDetailView: View {
    var imageUrl: String
    var deviceName: String
    var devicePrice: Int
    
    var body: some View {
        AppleDeviceView(imageUrl: imageUrl, deviceName: deviceName, devicePrice: devicePrice)
    }
}

struct AppleWatchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppleWatchDetailView(imageUrl: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQBu0wi1rSeSmrqqiOWVOCSKEc6rHFvly-cD65APXgJTGC1VdTPGLLWmO4WxIVb7OqxVzrvCt4&usqp=CAc", deviceName: "iPhone 14", devicePrice: 1340000)
    }
}
