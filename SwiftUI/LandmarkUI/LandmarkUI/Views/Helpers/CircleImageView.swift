//
//  CircleImageView.swift
//  LandmarkUI
//
//  Created by gnksbm on 2023/07/31.
//

import SwiftUI

struct CircleImageView: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.green, lineWidth: 4)
            }
            .onTapGesture {
                
            }
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image(systemName: "person"))
    }
}
