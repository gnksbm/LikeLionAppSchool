//
//  Student.swift
//  StudentUI
//
//  Created by gnksbm on 2023/06/14.
//

import Foundation


struct Student: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var nickName: String
}

var students: [Student] = [
    Student(name: "정석호", nickName: "덤보"),
    Student(name: "김건섭", nickName: "건빵"),
    Student(name: "박재민", nickName: "재민빡"),
    Student(name: "박지성", nickName: "조니"),
    Student(name: "안효명", nickName: "ahn"),
    Student(name: "원강묵", nickName: "무커"),
    Student(name: "한아리", nickName: "아리랑"),
]

func studentsAppend(completion: () -> (name: String, nickName: String)) {
    let nameNickName = completion()
    let newStudent = Student(name: nameNickName.name, nickName: nameNickName.nickName)
    students.append(newStudent)
}
