//
//  InputEmailController.swift
//  tdd_testing
//
//  Created by Tran Thien Hao on 8/10/20.
//  Copyright © 2020 Tran Thien Hao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class InputEmailController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    var inputEmailVM: InputEmailViewModelType!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnEnability(isEnable: false)
        setupBindings()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setupBindings(){
        emailTextfield.rx.text
          .debounce(.seconds(2), scheduler: MainScheduler.instance)
          .subscribe(onNext: { [weak self] text in
              self?.inputEmailVM?.checkEmail(text!)
          })
          .disposed(by: disposeBag)

        inputEmailVM?.isValidEmail
          .observeOn(MainScheduler.instance)
          .subscribe(onNext: {[weak self] (value) in
              self?.setBtnEnability(isEnable: value)
          }).disposed(by: disposeBag)
    }
    
    func setBtnEnability(isEnable: Bool = true) {
        submitBtn.isEnabled = isEnable
        submitBtn.alpha = isEnable ? 1 : 0.8
    }
    
    @IBAction func navigateToOTPScreen(_ sender: Any) {
        let  otpScreen = self.storyboard?.instantiateViewController(identifier: "InputOTPController") as! InputOTPController
        otpScreen.mockOTP = "123456"
        self.navigationController?.pushViewController(otpScreen, animated: true)
    }
    
}

