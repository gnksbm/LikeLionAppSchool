//
//  LandmarkDetailView.swift
//  LandmarkUI
//
//  Created by gnksbm on 2023/07/31.
//

import SwiftUI

struct LandmarkDetailView: View {
    var landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            CircleImageView(image: landmark.image)
                .offset(y: -150)
                .padding(.bottom, -150)
            LandmarkContentView()
                .padding()
            Spacer()
        }
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmark: ModelData().landmarks[0])
    }
}
