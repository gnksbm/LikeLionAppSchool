//
//  ModelData.swift
//  LandmarkUI
//
//  Created by gnksbm on 2023/08/01.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = [] {
        didSet {
            starsLandmarks = landmarks.filter { $0.isFavorite }
        }
    }
    @Published var starsLandmarks: [Landmark] = []
    
    func updateLandmark(landmark: Landmark) {
        print(landmark)
        guard let index = landmarks.firstIndex(of: landmark) else { return }
        landmarks[index].isFavorite.toggle()
        landmarks.forEach { landmark in
            print(landmark.name)
            print(landmark.isFavorite)
        }
    }
    init() {}
    init(landmarks: [Landmark]) {
        self.landmarks = landmarks
    }
}

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func saveJson<T: Encodable>(data: T, filename: String){
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Error[\(#file)][\(#line)] \(#function): \(filename) is not found")
    }
    
    do {
        let jsonData = try JSONEncoder().encode(data)
        try jsonData.write(to: file)
    } catch {
        print("Error[\(#file)][\(#line)] \(#function): \(data) is unable to be saved into \(file) \(error.localizedDescription)")
    }
}
