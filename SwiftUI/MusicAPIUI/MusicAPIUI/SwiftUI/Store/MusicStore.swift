//
//  MusicStore.swift
//  MusicAPIUI
//
//  Created by gnksbm on 2023/08/14.
//

import Foundation

struct MyMusic: Identifiable {
    var id = UUID()
    var urlString: URL
    
    init(urlString: String) {
        self.urlString = URL(string: urlString) ?? URL(string: "https://static.vecteezy.com/system/resources/previews/002/520/838/original/apple-logo-black-isolated-on-transparent-background-free-vector.jpg")!
    }
}

class MusicStore: ObservableObject {
    @Published var musicData: [MyMusic] = []
    
    @Published var searchString = ""
    
    let networkManager = NetworkManager.shared
    
    func fetchData(_ completion: @escaping () -> ()) async {
        let data: Result<Music, NetworkError> = await networkManager.request(urlString: "https://itunes.apple.com/search?term=billevans")
        switch data {
        case .success(let music):
            DispatchQueue.main.async {
                self.musicData = music.results.map({ MyMusic(urlString: $0.artworkUrl100) })
                completion()
            }
        case .failure(let error):
            print(#function + "\(error) error")
        }
    }
    
    func fetchData(searchString: String, _ completion: @escaping () -> ()) async {
        let data: Result<Music, NetworkError> = await networkManager.request(urlString: "https://itunes.apple.com/search?term=\(searchString)")
        switch data {
        case .success(let music):
            DispatchQueue.main.async {
                self.musicData = music.results.map({ MyMusic(urlString: $0.artworkUrl100) })
                completion()
            }
        case .failure(let error):
            print(#function + "\(error) error")
        }
    }
}


