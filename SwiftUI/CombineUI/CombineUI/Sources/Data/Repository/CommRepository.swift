//
//  CommRepository.swift
//  CombineUI
//
//  Created by gnksbm on 2023/10/31.
//

import Combine

final class CommRepository: ObservableObject {
    @Published var joinedComm: Community = .defaultComm // home, zeno, comm, myPage
    @Published var user: User = .defaultUser
    private var cancelBag: Set<AnyCancellable> = []
    
    init(joinedComm: Community, user: User) {
        self.joinedComm = joinedComm
    }
    
    func sinkUser() {
        let subscriber = UserRepository.shared.$user
            .sink {
                self.user = $0
            }
        subscriber
            .store(in: &cancelBag)
    }
}
