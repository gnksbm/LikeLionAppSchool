import ProjectDescription

let projectName = "URLImageKit"
let orgName = "https://github.com/gnksbm/LikeLionAppSchool"
let bundleID = "com.GeonSeobKim.URLImageKit"
let infoPlist: [String: InfoPlist.Value] = [
    "BundleDisplayName": "URLImageKit",
    "BundleShortVersionString": "1.0",
    "BundleVersion": "1.0.0",
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
    ]
]

let project = Project(
    name: projectName,
    organizationName: orgName,
    packages: [
    ],
    targets: [
        .init(
            name: projectName,
            platform: .iOS,
            product: .app,
            bundleId: bundleID,
            deploymentTarget: .iOS(targetVersion: "16.4", devices: .iphone),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
//            scripts: [
//                .pre(path: "Scripts/SwiftLintRunScript.sh", arguments: [], name: "SwiftLint"),
//            ],
            dependencies: [
            ]
        )
    ]
)
