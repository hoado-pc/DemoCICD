//
//  InputEmailViewModelTests.swift
//  tdd_testingTests
//
//  Created by Tran Thien Hao on 8/20/20.
//  Copyright © 2020 Tran Thien Hao. All rights reserved.
//

import XCTest
@testable import DemoCICD

class InputEmailViewModelTests: XCTestCase {
    
    var inputEmailViewModel: InputEmailViewModel!
    
    override func setUp() {
        inputEmailViewModel = InputEmailViewModel()
    }

    override func tearDown() {
        inputEmailViewModel.isValidEmail.dispose()
    }

    func testInitState() {
        // When
        let initState = try? inputEmailViewModel.isValidEmail.value()

        // Then
        XCTAssertEqual(initState, false)
    }

    func testCheckEmailValid() {
        // When
        inputEmailViewModel.checkEmail("abc@pycogroup.com")
        let currentState = try? inputEmailViewModel.isValidEmail.value()
        
        // Then
        XCTAssertEqual(currentState, true)
    }
    
    func testCheckEmailInvalid() {
         // When
         inputEmailViewModel.checkEmail("abc@gmail.com")
         let currentState = try? inputEmailViewModel.isValidEmail.value()
         
         // Then
         XCTAssertEqual(currentState, false)
     }
}
