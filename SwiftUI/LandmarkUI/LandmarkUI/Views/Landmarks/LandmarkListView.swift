//
//  LandmarkListView.swift
//  LandmarkUI
//
//  Created by gnksbm on 2023/07/31.
//

import SwiftUI

struct LandmarkListView: View {
    @EnvironmentObject var modelData: ModelData
    @State var isStarsOnly = false
    
    var filteredList: [Landmark] {
        return modelData.landmarks.filter { $0.isFavorite || !isStarsOnly
        }
    }
    
    var body: some View {
        ScrollView {
            Toggle("Stars Only", isOn: $isStarsOnly)
            ForEach(!isStarsOnly ? modelData.landmarks : modelData.starsLandmarks, id: \.self) { landmark in
                GroupBox {
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            modelData.landmarks = loadJson("landmarkData.json")
            print(modelData.landmarks.count)
            print(modelData.starsLandmarks.count)
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LandmarkListView()
                .environmentObject(ModelData())
        }
    }
}
