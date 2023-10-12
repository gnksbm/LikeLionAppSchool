//
//  ContentView.swift
//  URLImageUI
//
//  Created by gnksbm on 2023/10/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm: ViewModel = .init()
    private let imgSize = UIScreen.main.bounds.width * 0.9
    private let columns = Array(repeating: GridItem(), count: 1)
    private let spacing = UIScreen.main.bounds.width * 0.05
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(vm.myModels) {
                    if let uiImage = UIImage(data: $0.imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: imgSize, height: imgSize)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
