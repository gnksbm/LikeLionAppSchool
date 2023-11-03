//
//  ImageViewModel.swift
//  URLImageKit
//
//  Created by gnksbm on 2023/11/03.
//  Copyright © 2023 https://github.com/gnksbm/LikeLionAppSchool. All rights reserved.
//

import UIKit

class ViewModel {
    private let networkManager = NetworkManager.shared
    private let cacheManager = CacheManager<UIImage>()
    
    var myModels: [MyModel] = []
    
    private let urlStrings: [String] = [
        "https://wallpaperaccess.com/download/europe-4k-1369012",
        "https://wallpaperaccess.com/download/europe-4k-1318341"
    ]
    
    private var onComplete: () -> Void = { }
    
    @MainActor
    func getImages() async {
        await urlStrings.asyncForEach { [weak self] urlString in
            await self?.getImage(urlString: urlString)
        }
    }
    
    func refreshImages() async {
        myModels.removeAll()
        await getImages()
    }
    
    func setOnCompleteAction(_ handler: @escaping () -> Void) {
        onComplete = handler
    }
    
    @MainActor
    private func getImage(urlString: String) async {
        guard let url = URL(string: urlString) else { return }
        guard let cachedImage = cacheManager.loadImage(url: url) else {
            await fetchImage(url: url)
            return
        }
        myModels.append(.init(imageData: cachedImage))
        onComplete()
    }
    
    @MainActor
    private func fetchImage(url: URL) async {
        let result = await networkManager.fetchData(url: url)
        switch result {
        case .success(let success):
            guard let image = UIImage(data: success) else { return }
            cacheManager.saveImage(url: url, data: image)
            myModels.append(.init(imageData: image))
            onComplete()
        case .failure:
            break
        }
    }
}
