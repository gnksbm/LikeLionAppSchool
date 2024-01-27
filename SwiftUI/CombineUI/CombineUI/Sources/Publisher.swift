//
//  Publisher.swift
//  CombineUI
//
//  Created by gnksbm on 2023/11/07.
//

import Combine

class UserSubScriber: Subscriber {
    
    typealias Input = User
    
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    func receive(_ input: User) -> Subscribers.Demand {
        return .max(1)
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        
    }
}
