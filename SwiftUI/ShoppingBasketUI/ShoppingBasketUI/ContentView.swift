//
//  ContentView.swift
//  ShoppingBasketUI
//
//  Created by gnksbm on 2023/08/04.
//

import SwiftUI

struct ShoppingData: Identifiable {
    static let emptyData: Self = ShoppingData(name: "", imageName: "", price: 0, url: "")
    var id = UUID()
    var name: String
    var imageName: String
    var price: Int
    var url: URL {
        return URL(string: "https://\(urlString)")!
    }
    var priceString: String {
        get {
            let numformatter = NumberFormatter()
            numformatter.currencyCode = "krw"
            numformatter.numberStyle = .currency
            return numformatter.string(from: NSNumber(value: price))!
        }
        set {
            let numformatter = NumberFormatter()
            numformatter.numberStyle = .none
            var result = newValue
            result.remove(at: result.firstIndex(of: "₩")!)
            while result.firstIndex(of: ",") != nil {
                if let has = result.firstIndex(of: ",") {
                    result.remove(at: has)
                }
            }
            guard let priceNum = numformatter.number(from: result) else { return }
            price = Int(truncating: priceNum)
        }
    }
    var urlString: String
    
    init(name: String, imageName: String, price: Int, url: String) {
        self.name = name
        self.imageName = imageName
        self.price = price
        self.urlString = url
    }
}
class ShoppingStore: ObservableObject {
    @Published var datas: [ShoppingData] = [
        ShoppingData(name: "MacPro", imageName: "macpro.gen1", price: 1000000, url: "www.apple.com/kr/shop/buy-mac/mac-pro")
    ]
    
    func addItem(newItem: ShoppingData) {
        datas.append(newItem)
    }
    func removeItem(atOffsets: IndexSet) {
        datas.remove(atOffsets: atOffsets)
        print(datas)
    }
}

struct ContentView: View {
    @StateObject var shoppingStore = ShoppingStore()
    @State var isPresented = true
    @State var emptyData = ShoppingData.emptyData
    @State var emptyData2 = ShoppingData(name: "유하은", imageName: "", price: 0, url: "")
//    @Binding var binding: String
    var body: some View {
        
        NavigationStack {
            NavigationLink {
//                PageView(string: $binding)
            } label: {
                Text("SwiftUI")
            }
            NewItemView(emptyData: $emptyData)
            NewItemView(emptyData: $emptyData2)
            NewItemView(emptyData: $emptyData)
            NewItemView(emptyData: $emptyData2)
            NewItemView(emptyData: $emptyData)
            
        }
    }
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(shoppingStore.datas) { data in
//                    HStack {
//                        NavigationLink {
//                            SafariView(url: data.url)
//                        } label: {
//                            Image(systemName: data.imageName)
//                            Text(data.name)
//                            Text(data.priceString)
//                        }
//                    }
//                }
//                .onDelete(perform: shoppingStore.removeItem)
//                .listRowBackground(Color.orange)
//                .listRowSeparatorTint(.white)
//            }
//            .scrollContentBackground(.hidden)
//            .navigationTitle("장바구니")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        emptyData = ShoppingData.emptyData
//                        isPresented = true
//                    } label: {
//                        Image(systemName: "plus")
//                            .foregroundColor(.orange)
//                    }
//                }
//            }
//        }
//        .padding()
//        .font(.system(.title2, weight: .bold))
//        .foregroundColor(.white)
//        .sheet(isPresented: $isPresented) {
//            NavigationStack {
//                NewItemView(emptyData: $emptyData)
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarLeading) {
//                            Button {
//                                isPresented = false
//                            } label: {
//                                Text("취소")
//                                    .foregroundColor(.orange)
//                            }
//
//                        }
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            Button {
//                                shoppingStore.addItem(newItem: emptyData)
//                                isPresented = false
//                            } label: {
//                                Text("추가하기")
//                                    .foregroundColor(.orange)
//                            }
//
//                        }
//                    }
//            }
//        }
//    }
}

struct NewItemView: View {
    @Binding var emptyData: ShoppingData
    
    var body: some View {
        GroupBox {
            TextField("Name", text: $emptyData.name)
            TextField("Price", text: $emptyData.priceString)
                .keyboardType(.numberPad)
            TextField("SystemImageName", text: $emptyData.imageName)
            TextField("URL", text: $emptyData.urlString)
                .textContentType(.URL)
        }
        .textInputAutocapitalization(.never)
        .textFieldStyle(.roundedBorder)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        NewItemView(emptyData: .constant(ShoppingData.emptyData))
        
        ContentView()
//        ContentView(binding: .constant("123"))
    }
}
