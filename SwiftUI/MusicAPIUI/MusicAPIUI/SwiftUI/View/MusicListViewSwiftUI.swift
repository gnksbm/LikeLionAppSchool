//
//  MusicListViewSwiftUI.swift
//  MusicAPIUI
//
//  Created by gnksbm on 2023/08/14.
//

import SwiftUI

struct MusicListViewSwiftUI: View {
    @StateObject var musicStore = MusicStore()
    
    let columns = [
        GridItem(.flexible(), spacing: 20, alignment: .center),
        GridItem(.flexible(), spacing: 20, alignment: .top),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(musicStore.musicData) { data in
                    AsyncImage(url: data.urlString) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
//                        ProgressView()
                    }
                    
                }
            }
        }
        .padding()
        .task {
            await musicStore.fetchData {
//                print("fetch완료")
            }
        }
//        .searchable(text: $musicStore.searchString, placement: .toolbar)
//        .onSubmit(of: .search) {
//            Task {
//                await musicStore.fetchData(searchString: musicStore.searchString) {
//                    print("단어검색")
//                    print(musicStore.musicData.count)
//                }
//            }
//        }
//        .onAppear {
//            Task {
//                await musicStore.fetchData {
//                    print("fetch완료")
//                }
//            }
//        }
    }
}

struct MusicListViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MusicListViewSwiftUI()
        }
    }
}
