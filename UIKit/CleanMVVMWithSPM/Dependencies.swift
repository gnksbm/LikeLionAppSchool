//
//  Dependencies.swift
//  CleanMVVMWithSPM
//
//  Created by gnksbm on 2023/12/22.
//

import PackageDescription

let package = Package(
    name: "Dependencies",
    products: [
        .library(
            name: "Dependencies",
            targets: ["Domain", "Data", "Presentation"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: [
                "Domain"
            ]
        ),
    ]
)

