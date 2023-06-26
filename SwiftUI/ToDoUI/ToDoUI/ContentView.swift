//
//  ContentView.swift
//  ToDoUI
//
//  Created by gnksbm on 2023/06/16.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var dataList = ToDoList()
    @State var newToDo = ""
    
    var body: some View {
        VStack {
            Text("ToDoList")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            HStack {
                TextField("새로운 ToDo", text: $newToDo)
                
                Button("추가하기") {
                    guard !newToDo.isEmpty else { return }
                    dataList.list.insert(ToDoData(toDoText: newToDo), at: 0)
                    newToDo = ""
                }
            }
            .padding()
            ForEach(Array(zip(dataList.list.indices, dataList.list)), id: \.0) { index, item in
                if !item.isChecked {
                    HStack {
                        Button {
                            dataList.list[index].isChecked.toggle()
                        } label: {
                            Label("", systemImage: "checkmark.square")
                        }
                        Text(item.toDoText)
                        Spacer()
                        Button("X") {
                            dataList.list.remove(at: index)
                        }
                    }
                    .padding()
                }
            }
            ForEach(Array(zip(dataList.list.indices, dataList.list)), id: \.0) { index, item in
                if item.isChecked {
                    HStack {
                        Button {
                            dataList.list[index].isChecked.toggle()
                        } label: {
                            Label("", systemImage: "checkmark.square.fill")
                        }
                        Text(item.toDoText)
                        Spacer()
                        Button("X") {
                            dataList.list.remove(at: index)
                        }
                    }
                    .padding()
                }
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
