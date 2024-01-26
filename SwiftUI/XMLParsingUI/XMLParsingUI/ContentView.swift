//
//  ContentView.swift
//  XMLParsingUI
//
//  Created by gnksbm on 1/26/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var repository = StationArrivalInfoRepository()
    
    var body: some View {
        ScrollView {
            ForEach(
                repository.items,
                id: \.busRouteAbrv
            ) {
                Text($0.busRouteAbrv)
                Text($0.arrmsg1)
                Text($0.arrmsg2)
            }
        }
        .onAppear {
            repository.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
