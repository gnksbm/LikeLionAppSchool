//
//  FirstPartyView.swift
//  XMLParsingUI
//
//  Created by gnksbm on 1/30/24.
//

import SwiftUI

struct FirstPartyView: View {
    @ObservedObject var repository = FirstPartyRepository()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(
                    repository.items,
                    id: \.busRouteAbrv
                ) { item in
                    HStack {
                        Text(item.busRouteAbrv)
                        Text(item.busRouteId)
                        Text(item.routeType)
                        Text(item.arrmsg2)
                        Text(item.arrmsg2)
                    }
                    Divider()
                }
            }
        }
        .onAppear {
            repository.fetchData()
        }
    }
}

#Preview {
    FirstPartyView()
}
