//
//  InputEmailControllerTests.swift
//  tdd_testingTests
//
//  Created by Tran Thien Hao on 8/20/20.
//  Copyright © 2020 Tran Thien Hao. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxCocoa
@testable import tdd_testing

class InputEmailControllerTests: XCTestCase {
    
    var inputEmailVC: InputEmailController!
    var inputEmailVM: InputEmailViewModel!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!

    override func setUp() {
        inputEmailVM = InputEmailViewModel()
        inputEmailVC = (UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "InputEmailController") as! InputEmailController)
        inputEmailVC.inputEmailVM = inputEmailVM
        
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        inputEmailVM.isValidEmail.dispose()
    }

    func testDefaultRender() {
        // When
        let _ = inputEmailVC.view

        // Then
        XCTAssert(inputEmailVC.submitBtn.isEnabled == false)
    }
    
    func testSubmitValidEmail() {
        // When
        let _ = inputEmailVC.view
        inputEmailVC.emailTextfield.insertText("abc@pycogroup.com")
        let expectation = self.expectation(description: "testSubmitValidEmail")
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2000)) {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3000)
        
        // Then
        XCTAssert(inputEmailVC.submitBtn.isEnabled == true)
    }
    
    func testSubmitEmailInvalid() {
        // When
        let _ = inputEmailVC.view
        inputEmailVC.emailTextfield.insertText("abc@gmail.com")
        let expectation = self.expectation(description: "testSubmitEmailInvalid")
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2000)) {
           expectation.fulfill()
        }
        waitForExpectations(timeout: 3000)

        // Then
        XCTAssert(inputEmailVC.submitBtn.isEnabled == false)
    }

}
