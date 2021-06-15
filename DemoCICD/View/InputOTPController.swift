//
//  InputOTPControllerViewController.swift
//  tdd_testing
//
//  Created by Tran Thien Hao on 8/11/20.
//  Copyright © 2020 Tran Thien Hao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class InputOTPController: UIViewController {

    @IBOutlet weak var otpTextfield: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    private let inputOTPVM: InputOTPViewModel = InputOTPViewModel()
    private let disposeBag = DisposeBag()
    
    
    var mockOTP: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setBtnEnability(isEnable: false)
        
        setupBindings()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           view.endEditing(true)
        
        
   }
    
    func setupBindings(){
       otpTextfield.rx.text
         .debounce(.seconds(2), scheduler: MainScheduler.instance)
         .subscribe(onNext: { [weak self] text in
            self?.inputOTPVM.checkOTP(text!, mockOTP: self?.mockOTP ?? "")
         })
         .disposed(by: disposeBag)

       inputOTPVM.isValidOTP
         .observeOn(MainScheduler.instance)
         .subscribe(onNext: { [weak self] (value) in
             self?._setBtnEnability(isEnable: value)
         }).disposed(by: disposeBag)
   }
    
    func _setBtnEnability(isEnable: Bool = true) {
        submitBtn.alpha = isEnable ? 1 : 0.3
    }
    
    @IBAction func onSubmitClick(_ sender: Any) {
        let alertMessage = try? inputOTPVM.isValidOTP.value() ? "Congratulation. TDD for iOS" : "OTP is invalid"
        let alert = UIAlertController(title: "", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
