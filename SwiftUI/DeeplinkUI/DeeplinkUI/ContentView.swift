//
//  ContentView.swift
//  DeeplinkUI
//
//  Created by gnksbm on 2023/10/08.
//

import SwiftUI

struct ContentView: View {

    /// We store the opened recipe name as a state property to redraw our view accordingly.
    @State private var openedRecipeName: String?
    @State private var isPresented = false

    var body: some View {
        VStack {
            ShareLink("이름공유", item: "DeeplinkUIApp://open-recipe?name=recipename")
            ShareLink("불값공유", item: "DeeplinkUIApp://open-recipe?bool=true")
            Text("Hello, recipe!")

            if let openedRecipeName {
                Text("Opened recipe: \(openedRecipeName)")
            }
        }
        .padding()
        /// Responds to any URLs opened with our app. In this case, the URLs
        /// defined inside the URL Types section.
        .onOpenURL { incomingURL in
            print("App was opened via URL: \(incomingURL)")
            handleIncomingURL(incomingURL)
        }
        .sheet(isPresented: $isPresented) {
            Text("불값공유 성공")
        }
    }

    /// Handles the incoming URL and performs validations before acknowledging.
    private func handleIncomingURL(_ url: URL) {
        guard url.scheme == "DeeplinkUIApp" else {
            return
        }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            print("Invalid URL")
            return
        }

        guard let action = components.host, action == "open-recipe" else {
            print("Unknown URL, we can't handle this one!")
            return
        }
        
        guard let queryItem = components.queryItems else {
            return
        }
        if let name = queryItem.first(where: { $0.name == "name" })?.value {
            openedRecipeName = name
        } else if let bool = queryItem.first(where: { $0.name == "bool" })?.value,
                  let result = Bool(bool) {
            isPresented = result
        }
//        let a = queryItem.first(where: { $0.name == "name" })?.value
//        guard let recipeName = components.queryItems?.first(where: { $0.name == "name" })?.value else {
//            print("Recipe name not found")
//            return
//        }
//
//        openedRecipeName = recipeName
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
