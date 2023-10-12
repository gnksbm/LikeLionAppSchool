import ProjectDescription

let projectName = "URLImageUI"
let orgName = "https://github.com/gnksbm/LikeLionAppSchool"
let bundleID = "com.GeonSeobKim.URLImageUI"
let infoPlist: [String: InfoPlist.Value] = [
    "BundleDisplayName": "URLImageUI",
    "BundleShortVersionString": "1.0",
    "BundleVersion": "1.0.0",
    "UILaunchStoryboardName": "LaunchScreen",
]

let project = Project(
    name: projectName,
    organizationName: orgName,
    packages: [
    ],
    targets: [
        .init(
            name: "Zeno",
            platform: .iOS,
            product: .app,
            bundleId: bundleID,
            deploymentTarget: .iOS(targetVersion: "16.4", devices: .iphone),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            scripts: [
                .pre(path: "Scripts/SwiftLintRunScript.sh", arguments: [], name: "SwiftLint"),
            ],
            dependencies: [
            ]
        )
    ]
)
