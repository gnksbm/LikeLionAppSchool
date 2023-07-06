//
//  VisibleProtocol.swift
//  AppleDeviceUI
//
//  Created by gnksbm on 2023/07/04.
//

import Foundation

/*
 아이폰    기본
         프로
         se
 아이패드   기본
         프로
         에어
         미니
 노트북    에어
         프로
 데스크톱   아이맥 -> 배터리 X
         미니 -> 디스플레이 X, 배터리 X
         스튜디오 -> 디스플레이 X, 배터리 X
         프로 -> 디스플레이 X, 배터리 X
 디스플레이  애플디스플레이 -> 배터리 X
 애플워치    기본
          se
          울트라
 음향기기   홈팟미니 -> 배터리 X
         에어팟
         에어팟 프로
         에어팟 맥스
 애플TV -> 디스플레이 X, 배터리 X
 */
protocol Visilble {
    var displayInch: Double { get set }
    var cameraCount: Int { get set }
}
