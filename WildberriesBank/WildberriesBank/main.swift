//
//  main.swift
//  WildberriesBank
//
//  Created by Janiece Eleonour on 04.07.2024.
//

import Foundation

class Bank {
    private var accounts: [Int: Double] = [:]
    
    func createAccount(number: Int, initialBalance: Double) {
        accounts[number] = initialBalance
    }
    
    func deposit(amount: Double, to accountNumber: Int) {
        if let balance = accounts[accountNumber] {
            accounts[accountNumber] = balance + amount
        }
    }
    
    func transfer(amount: Double, from sourceAccountNumber: Int, to destinationAccountNumber: Int) -> Bool {
        guard let sourceBalance = accounts[sourceAccountNumber],
              let destinationBalance = accounts[destinationAccountNumber],
              sourceBalance >= amount else {
            return false
        }
        
        accounts[sourceAccountNumber] = sourceBalance - amount
        accounts[destinationAccountNumber] = destinationBalance + amount
        
        return true
    }
    
    func printAccounts() {
        for (number, balance) in accounts {
            print("Account \(number): \(balance)")
        }
    }
    
    deinit {
        print("Bank is being deinitialized")
    }
}

let bank = Bank()

bank.createAccount(number: 1, initialBalance: 100.0)
bank.createAccount(number: 2, initialBalance: 200.0)
bank.createAccount(number: 3, initialBalance: 300.0)

print("Before operations:")
bank.printAccounts()

bank.deposit(amount: 50.0, to: 1)
print(bank.transfer(amount: 100.0, from: 2, to: 3))

print("After operations:")
bank.printAccounts()
