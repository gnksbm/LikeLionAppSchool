import ProjectDescription

let name = "CleanMVVMWithSPM"
let shortVersion = 1.0
let version = 1.0

let target = Target(
    name: name,
    platform: .iOS,
    product: .app,
    bundleId: "com.gnksbm",
    infoPlist: .dictionary(
        [
            "CFBundleDisplayName": .string(name),
            "CFBundleShortVersionString": .real(shortVersion),
            "CFBundleVersion": .real(version),
            "UILaunchStoryboardName": "LaunchScreen",
            "UIApplicationSceneManifest": [
                "UIApplicationSupportsMultipleScenes": false,
                "UISceneConfigurations": [
                    "UIWindowSceneSessionRoleApplication": [
                        [
                            "UISceneConfigurationName": "Default Configuration",
                            "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                        ],
                    ]
                ]
            ],
        ]
    ),
    sources: ["\(name)/Sources/**"],
    resources: ["\(name)/Resources/**"],
    dependencies: [
        .package(product: "Domain"),
        .package(product: "Data"),
        .package(product: "Presentation"),
        .package(product: "Network"),
        .package(product: "Core"),
    ]
)

let project = Project(
    name: name,
    organizationName: "gnksbm",
    packages: [
        .local(path: "Dependencies")
    ],
//    settings: <#T##Settings?#>,
    targets: [
        target
    ]
)
