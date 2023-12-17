//
//  Dependencies.swift
//  Config
//
//  Created by gnksbm on 2023/12/17.
//

import ProjectDescription
let spm = SwiftPackageManagerDependencies(
    [
        .remote(
            url: "https://github.com/ReactiveX/RxSwift",
            requirement: .upToNextMinor(from: "6.0.0")
        )
    ]
)
let dependencies = Dependencies(
    swiftPackageManager: spm
)
