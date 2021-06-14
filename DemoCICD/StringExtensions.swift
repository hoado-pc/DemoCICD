//
//  File.swift
//  tdd_testing
//
//  Created by Tran Thien Hao on 8/12/20.
//  Copyright © 2020 Tran Thien Hao. All rights reserved.
//

import Foundation

extension String {
    func isPycoEmail() -> Bool {
        let pycoEmailPattern = "[a-z0-9._-]+@pycogroup+(\\.[a-z0-9]{2,4}){1,2}"
        return NSPredicate(format: "SELF MATCHES %@", pycoEmailPattern).evaluate(with: lowercased())
    }
}
