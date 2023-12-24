//
//  InfoPlist+UIKit.swift
//  SetupPlugin
//
//  Created by gnksbm on 2023/12/22.
//

import ProjectDescription

public extension InfoPlist {
    private static func basic(
        appName: String,
        shortVersion: Double,
        version: Double
    ) -> [String: InfoPlist.Value] {
        [
            "CFBundleDisplayName": .string(appName),
            "CFBundleShortVersionString": .real(shortVersion),
            "CFBundleVersion": .real(version),
            "UILaunchStoryboardName": "LaunchScreen"
        ]
    }
    
    
    static func uiKit(
        appName: String,
        shortVersion: Double = 1,
        version: Double = 1
    ) -> Self {
        .dictionary(
            basic(
                appName: appName,
                shortVersion: shortVersion,
                version: version
            ).merging(
                [
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
            ) { oldValue, newValue in
                newValue
            }
        )
    }
    
    static func swiftUI(
        appName: String,
        shortVersion: Double = 1,
        version: Double = 1
    ) -> Self {
        .dictionary(
            basic(
                appName: appName,
                shortVersion: shortVersion,
                version: version
            ).merging([:]) { oldValue, newValue in
                newValue
            }
        )
    }
}
