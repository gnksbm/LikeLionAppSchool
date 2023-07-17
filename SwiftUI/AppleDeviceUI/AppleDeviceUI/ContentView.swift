//
//  ContentView.swift
//  AppleDeviceUI
//
//  Created by gnksbm on 2023/07/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("iPhone") {
                    ForEach(iPhoneList) { device in
                        NavigationLink {
                            IPhoneDetailView(device: device)
                        } label: {
                            Text(device.deviceName)
                        }
                    }
                }
                Section("iPad") {
                    ForEach(iPadList) { device in
                        NavigationLink {
                            IPadDetailView(device: device)
                        } label: {
                            Text(device.deviceName)
                        }
                    }
                }
                Section("Macbook") {
                    ForEach(macBookList) { device in
                        NavigationLink {
                            MacbookDetailView(imageUrl: "", deviceName: device.deviceName, devicePrice: device.devicePrice)
                        } label: {
                            Text(device.deviceName)
                        }
                    }
                }
                Section("Desktop") {
                    ForEach(desktopList) { device in
                        NavigationLink {
                            DesktopDetailView(imageUrl: "", deviceName: device.deviceName, devicePrice: device.devicePrice)
                        } label: {
                            Text(device.deviceName)
                        }
                    }
                }
                Section("AppleDisplay") {
                    ForEach(displayList) { device in
                        NavigationLink {
                            AppleDisplayDetailView(imageUrl: "", deviceName: device.deviceName, devicePrice: device.devicePrice)
                        } label: {
                            Text(device.deviceName)
                        }
                    }
                }
                Section("AppleWatch") {
                    ForEach(appleWatchList) { device in
                        NavigationLink {
                            AppleWatchDetailView(imageUrl: "", deviceName: device.deviceName, devicePrice: device.devicePrice)
                        } label: {
                            Text(device.deviceName)
                        }
                    }
                }
                Section("HomePod") {
                    ForEach(homePodList) { device in
                        NavigationLink {
                            HomePodDetailView(imageUrl: "", deviceName: device.deviceName, devicePrice: device.devicePrice)
                        } label: {
                            Text(device.deviceName)
                        }
                    }
                }
                Section("AppleTV") {
                    ForEach(appleTVList) { device in
                        NavigationLink {
                            AppleTVDetailView(imageUrl: "", deviceName: device.deviceName, devicePrice: device.devicePrice)
                        } label: {
                            Text(device.deviceName)
                        }
                    }
                }
            }
            .navigationTitle("Apple")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
