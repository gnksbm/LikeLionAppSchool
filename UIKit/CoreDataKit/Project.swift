import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

let appName = "CoreDataKit"
let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleDisplayName": .string(appName),
    "CFBundleShortVersionString": "1",
    "CFBundleVersion": "1",
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

let target = Target(
    name: appName,
    platform: .iOS,
    product: .app,
    bundleId: "com.practice.coredata",
    deploymentTarget: .iOS(
        targetVersion: "16.0",
        devices: .iphone
    ),
    infoPlist: .extendingDefault(with: infoPlist),
    sources: ["\(appName)/Sources/**"],
    resources: ["\(appName)/Resources/**"],
    dependencies: [
        .external(name: "RxSwift"),
        .external(name: "RxCocoa")
    ],
    coreDataModels: [.init("\(appName)/Resources/Model.xcdatamodeld")]
)

let project = Project(
    name: appName,
    organizationName: "gnksbm",
    targets: [target]
)
