//
//  ContentView.swift
//  URLImageUI
//
//  Created by gnksbm on 2023/10/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ViewModel = .init()
    private let imgSize = UIScreen.main.bounds.width * 0.9
    private let columns = Array(repeating: GridItem(), count: 1)
    private let spacing = UIScreen.main.bounds.width * 0.05

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(viewModel.myModels) {
                    Image(uiImage: $0.imageData)
                        .resizable()
                        .frame(width: imgSize, height: imgSize)
                }
                .animation(.linear, value: viewModel.myModels)
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("fetch 다시 실행") {
                    Task {
                        await viewModel.reFetch()
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
