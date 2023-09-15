//
//  ContentView.swift
//  PhotosPickerUI
//
//  Created by gnksbm on 2023/08/30.
//

import SwiftUI
import PhotosUI
import CoreTransferable
enum TransferError: Error {
    case importFailed
}

struct ProfileImage: Transferable {
    let image: Image
    
    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(importedContentType: .image) { data in
        #if canImport(AppKit)
            guard let nsImage = NSImage(data: data) else {
                throw TransferError.importFailed
            }
            let image = Image(nsImage: nsImage)
            return ProfileImage(image: image)
        #elseif canImport(UIKit)
            guard let uiImage = UIImage(data: data) else {
                throw TransferError.importFailed
            }
            let image = Image(uiImage: uiImage)
            return ProfileImage(image: image)
        #else
            throw TransferError.importFailed
        #endif
        }
    }
}

struct ContentView: View {
    @State var selection: [PhotosPickerItem] = []
    
    var body: some View {
        PhotosPicker(
            selection: $selection,
            matching: .images
        ) {
            Text("Select Photos")
        }
        .onChange(of: selection) { newValue in
            newValue.forEach {
                $0.loadTransferable(type: ProfileImage.self) { result in
                switch result {
                    
                case .success(_):
                    break
                case .failure(let error):
                    print(error)
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
