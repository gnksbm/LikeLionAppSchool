//
//  LandmarkContentView.swift
//  LandmarkUI
//
//  Created by gnksbm on 2023/07/31.
//

import SwiftUI

struct LandmarkContentView: View {
//    var landmark = Landmark(from: j)
    var body: some View {
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
            Divider()
            Text("About Turtle Rock")
                .font(.title2)
            Text("Descriptive text goes here.")
        }
    }
}

struct LandmarkContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkContentView()
    }
}
