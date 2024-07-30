//
//  quest03.swift
//  WildberriesHash
//
//  Created by Janiece Eleonour on 30.07.2024.
//

import Foundation

func setInstructions() {
    // Создайте множество (set) из целых чисел.
    var setInteger: Set<Int> = [1, 2, 24, 21, 31, 41, 3, 4, 5]
    
    print("Создайте множество (set) из целых чисел: \(setInteger.sorted())")
    // Добавьте несколько элементов в это множество.
    setInteger.insert(999)
    setInteger.insert(888)
    setInteger.insert(77)
    
    print("Добавьте несколько элементов в это множество: \(setInteger.sorted())")

    // Удалите один элемент.
    setInteger.remove(24)
    
    print("Удалите один элемент (24): \(setInteger.sorted())")

    // Проверьте, существует ли определенный элемент в множестве.
    print("Проверьте, существует ли определенный элемент в множестве (24): \(setInteger.contains(24))")
    
    // Примените операции объединения
    let unionSets = setInteger.union(Set([33, 55, 66]))
    print("Примените операции объединения: \(unionSets.sorted())")
    
    // Пересечения
    let intersectSets = setInteger.intersection(Set([33, 55, 66, 3, 4, 5]))
    print("Примените операции пересечения: \(intersectSets.sorted())")
    
    // Разности на множествах
    let substructSets = setInteger.subtracting(Set([33, 55, 66, 3, 4, 5]))
    print("Примените операции разности на множествах: \(substructSets.sorted())")
}

