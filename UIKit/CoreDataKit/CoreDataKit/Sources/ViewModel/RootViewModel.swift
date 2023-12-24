//
//  RootViewModel.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/16.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import Foundation
import RxSwift

final class RootViewModel: ViewModel {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let viewWillAppear: Observable<Void>
        let currentMemoContent: Observable<String>
        let saveBtnTapped: Observable<Void>
    }
    
    struct Output {
        let savedMemo: Observable<[Memo]>
    }
    
    func transform(input: Input) -> Output {
        return .init(savedMemo: .just([]))
    }
}
