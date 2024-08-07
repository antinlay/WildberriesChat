//
//  OneTimePassword.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 19.07.2024.
//

import Foundation

struct OneTimePasswordSequence: Sequence, IteratorProtocol {
    private(set) var code: Int = Int.random(in: 1000...9999)
    var phoneNumber: String
    
    mutating func next() -> Int? {
        code = Int.random(in: 1000...9999)
        return code
    }
}

class OneTimePassword: Observable {
    var phoneNumber: String
    var oneTimePasswordSequence: OneTimePasswordSequence
    var code: String
    
    init(phoneNumber: String = "") {
        self.phoneNumber = phoneNumber
        self.oneTimePasswordSequence = OneTimePasswordSequence(phoneNumber: phoneNumber)
        self.code = String(oneTimePasswordSequence.code)
    }
    
    func nextCode() {
        if let next = oneTimePasswordSequence.next() {
            code = String(next)
        }
    }
}

postfix operator ±
extension OneTimePassword {
    static postfix func ±(sequence: OneTimePassword) {
        sequence.nextCode()
    }
}