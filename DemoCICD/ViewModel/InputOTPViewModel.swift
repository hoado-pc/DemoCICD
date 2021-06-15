//
//  File.swift
//  tdd_testing
//
//  Created by Tran Thien Hao on 8/17/20.
//  Copyright © 2020 Tran Thien Hao. All rights reserved.
//

import Foundation
import RxSwift

class InputOTPViewModel {
    public let isValidOTP: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    
    public func checkOTP(_ otp: String, mockOTP: String = "123456"){
        self.isValidOTP.onNext(otp == mockOTP)
    }
}
