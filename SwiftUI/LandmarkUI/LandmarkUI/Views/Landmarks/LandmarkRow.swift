//
//  LandmarkRow.swift
//  LandmarkUI
//
//  Created by gnksbm on 2023/07/31.
//

import SwiftUI

struct LandmarkRow: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            Button {
                modelData.updateLandmark(landmark: landmark)
            } label: {
                Image(systemName: landmark.isFavorite ? "star.fill" : "star")
                    .foregroundColor(landmark.isFavorite ? .yellow : .gray)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: ModelData().landmarks[0])
            .environmentObject(ModelData(landmarks: loadJson("landmarkData.json")))
    }
}
