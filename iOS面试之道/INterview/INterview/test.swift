//
//  test.swift
//  INterview
//
//  Created by Justin on 2019/12/3.
//  Copyright © 2019 Justin. All rights reserved.
//

import Foundation

//@objc protocol SomeProtocol {
//    func requiredFunc()
//    @objc optional func optionalFunc()
//}

protocol SomeProtocol {
    func requiredFunc()
    func optionalFunc()
}

extension SomeProtocol {
    func optionalFunc() {
        
    }
}

class someClass: SomeProtocol {
    func requiredFunc() {
        
    }
}

//@objc protocol SomeProtocolDelegate {
//    func doSomething()
//}

protocol SomeProtocolDelegate: class {
    func doSomething()
}

class TheClass {
    weak var delegate: SomeProtocolDelegate?
}
