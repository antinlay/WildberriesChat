//
//  main.swift
//  WildberriesPassport
//
//  Created by Janiece Eleonour on 05.07.2024.
//

import Foundation

class Person {
    let fullName: String
    let age: Int
    let passport: Passport
    
    init(fullName: String, age: Int, passport: Passport) {
        self.fullName = fullName
        self.age = age
        self.passport = passport
        print(#line, #function, "\(fullName) was initialized")
    }
    
    deinit {
        print(#line, #function, "\(fullName) is being deinitialized")
    }
}

class Passport {
    let series: String
    let number: String
    let issueDate: Date
    weak var owner: Person?
    
    init(series: String, number: String, issueDate: Date) {
        self.series = series
        self.number = number
        self.issueDate = issueDate
        print(#line, #function, "Passport \(series) \(number) was initialized")
    }
    
    deinit {
        print(#line, #function, "Passport \(series) \(number) is being deinitialized")
    }
}

let formatter = DateFormatter()
formatter.dateFormat = "dd.MM.yyyy"

let passport1 = Passport(series: "AA", number: "123456", issueDate: formatter.date(from: "01.01.2020")!)
let person1 = Person(fullName: "John Doe", age: 30, passport: passport1)
passport1.owner = person1

let passport2 = Passport(series: "BB", number: "654321", issueDate: formatter.date(from: "02.02.2021")!)
let person2 = Person(fullName: "Jane Smith", age: 25, passport: passport2)
passport2.owner = person2

print(person1.fullName, person1.age, person1.passport.series, person1.passport.number, person1.passport.issueDate)
print(person2.fullName, person2.age, person2.passport.series, person2.passport.number, person2.passport.issueDate)

