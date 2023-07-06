//
//  ToDoData.swift
//  ToDoUI
//
//  Created by gnksbm on 2023/06/16.
//

import Foundation

class ToDoList: ObservableObject {
    @Published var list: [ToDoData] = [
        ToDoData(toDoText: "할 일을 추가해보세요"),
        ToDoData(toDoText: "완료한 일은 체크버튼을 눌러주세요"),
        ToDoData(toDoText: "삭제하고 싶은 일은 X 버튼을 눌러주세요"),
    ]
}

struct ToDoData: Identifiable {
    let id: UUID = UUID()
    
    var toDoText: String
    var isChecked: Bool = false
}
