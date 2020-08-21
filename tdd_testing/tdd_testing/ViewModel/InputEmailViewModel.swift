//
//  InputEmailViewModel.swift
//  tdd_testing
//
//  Created by Tran Thien Hao on 8/17/20.
//  Copyright © 2020 Tran Thien Hao. All rights reserved.
//

import Foundation
import RxSwift

protocol InputEmailViewModelType {
    var isValidEmail: BehaviorSubject<Bool> { get }
    func checkEmail(_ email: String)
}

class InputEmailViewModel: InputEmailViewModelType {
    public var isValidEmail: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    
    public func checkEmail(_ email: String) {
        self.isValidEmail.onNext(email.isPycoEmail())
    }
}
