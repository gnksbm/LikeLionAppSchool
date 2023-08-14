//
//  MusicData.swift
//  MusicAPIUI
//
//  Created by gnksbm on 2023/08/14.
//

import Foundation

class MusicData {
    let networkManager = NetworkManager.shared
    
    var myMusics: [MyMusic] = []
    
    func fetchData(_ completion: @escaping () -> ()) {
        Task {
            let result: Result<Music, NetworkError> = await networkManager.request(urlString: "https://itunes.apple.com/search?term=newjeans")
            switch result {
            case .success(let music):
                DispatchQueue.main.async {
                    self.myMusics = music.results.map { MyMusic(urlString: $0.artworkUrl100) }
                    completion()
                }
            case .failure(let error):
                print(#function + "\(error) error")
            }
        }
    }
}

//class NetworkManager2 {
//    static let shared = NetworkManager2()
//    
//    func request(urlString: String) -> [MyMusic] {
//        guard let url = URL(string: urlString) else {
//            print(#function + "url 바인딩 실패")
//            return []
//        }
//        var results: [MyMusic]
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data else {
//                print(#function + "data 바인딩 실패")
//                return
//            }
//            do {
//                let results = try JSONDecoder().decode(Music.self, from: data).results.map({ MyMusic(urlString: $0.artworkUrl100) })
//                print(results)
////                return results
//            } catch {
//                print(#function + "decoding 실패")
//            }
//            
//        }.resume()
//        return results
//    }
//    
//    private init() { }
//}
