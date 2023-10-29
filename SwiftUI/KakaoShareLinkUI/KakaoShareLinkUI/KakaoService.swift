//
//  KakaoService.swift
//  KakaoShareLinkUI
//
//  Created by gnksbm on 2023/10/16.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKTalk
import KakaoSDKTemplate
import KakaoSDKShare

class KakaoService {
    func kakao() {
        // 웹 링크입니다. 카카오톡 인앱 브라우저에서 열립니다.
//        let link = Link(webUrl: URL(string: "https://developers.kakao.com"),
//                        mobileWebUrl: URL(string: "https://developers.kakao.com"))
        let link = Link(webUrl: URL(string: "zenoapp://invite?commID=698EBE33-359E-4052-A7AF-7B62096DB485"),
                        mobileWebUrl: URL(string: "zenoapp://invite?commID=698EBE33-359E-4052-A7AF-7B62096DB485"))

        // 앱 링크입니다. 파라미터를 함께 전달하여 앱으로 들어왔을 때 특정 페이지로 이동할 수 있는 역할을 합니다.
        let appLink = Link(androidExecutionParams: ["key1": "value1", "key2": "value2"],
                           iosExecutionParams: ["key1": "value1", "key2": "value2"])
        
        // 버튼들 입니다.
        let webButton = Button(title: "웹으로 보기", link: link)
        let appButton = Button(title: "앱으로 보기", link: appLink)
        
        // 메인이 되는 사진, 이미지 URL, 클릭 시 이동하는 링크를 설정합니다.
        let content = Content(title: "신생젋은이",
                              imageUrl: URL(string: "https://firebasestorage.googleapis.com/v0/b/zeno-8cf4b.appspot.com/o/ZenoAppIcon.png?alt=media&token=267e57e0-bbf4-4864-874d-e79c61770fe2&_gl=1*14qx05*_ga*MTM1OTM4NTAwNi4xNjkyMzMxODc2*_ga_CW55HF8NVT*MTY5NzQ2MDgyMS4xMDIuMS4xNjk3NDYwODc2LjUuMC4w")!,
                              link: link)
            
        let template = FeedTemplate(content: content, buttons: [webButton, appButton])
            
        // 메시지 템플릿 encode
        if let templateJsonData = (try? SdkJSONEncoder.custom.encode(template)) {
            // 생성한 메시지 템플릿 객체를 jsonObject로 변환
            if let templateJsonObject = SdkUtils.toJsonObject(templateJsonData) {
                // 카카오톡 앱이 있는지 체크합니다.
                if ShareApi.isKakaoTalkSharingAvailable() {
                    ShareApi.shared.shareDefault(templateObject:templateJsonObject) {(linkResult, error) in
                        if let error = error {
                            print("error : \(error)")
                        }
                        else {
                            print("defaultLink(templateObject:templateJsonObject) success.")
                            guard let linkResult = linkResult else { return }
                            UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                        }
                    }
                } else {
                    // 없을 경우 카카오톡 앱스토어로 이동합니다. (이거 하려면 URL Scheme에 itms-apps 추가 해야함)
                    let url = "itms-apps://itunes.apple.com/app/362057947"
                    if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    }
                }
            }
        }
    }
}
