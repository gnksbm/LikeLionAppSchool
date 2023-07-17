//
//  AppleDeviceView.swift
//  AppleDeviceUI
//
//  Created by gnksbm on 2023/07/04.
//

import SwiftUI

struct AppleDeviceView: View {
    var imageUrl: String
    var deviceName: String
    var devicePrice: Int
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
            } placeholder: {
                ProgressView()
            }
            Text(deviceName)
            Text("\(devicePrice)")
        }
        .font(.system(size: 30, weight: .heavy))
    }
}

struct AppleDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        AppleDeviceView(imageUrl: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQBu0wi1rSeSmrqqiOWVOCSKEc6rHFvly-cD65APXgJTGC1VdTPGLLWmO4WxIVb7OqxVzrvCt4&usqp=CAc", deviceName: "iPhone 14", devicePrice: 1340000)
    }
}
