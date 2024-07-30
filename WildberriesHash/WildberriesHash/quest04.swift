//
//  quest04.swift
//  WildberriesHash
//
//  Created by Janiece Eleonour on 30.07.2024.
//

import Foundation

func dictionaryInstructions() {
    // Создайте словарь, где ключами будут строки (названия городов), а значениями — целые числа (их население).
    var cityPopulation: [String: Int] = ["Москва": 12655050, "Санкт-Петербург": 5384342, "Новосибирск": 1620164]
    print("Создайте словарь, где ключами будут строки (названия городов), а значениями — целые числа (их население): \(cityPopulation.sorted(by: { $0.key < $1.key }))")
    //  Добавьте несколько пар ключ-значение в словарь.
    cityPopulation["Екатеринбург"] = 1495063
    cityPopulation["Казань"] = 1257000
    cityPopulation["Киров"] = 457000
    print("Добавьте несколько пар ключ-значение в словарь: \(cityPopulation.sorted(by: { $0.key < $1.key }))")
//    Удалите одну пару ключ-значение.
    cityPopulation.removeValue(forKey: "Киров")
    print("Удалите одну пару ключ-значение (Киров): \(cityPopulation.sorted(by: { $0.key < $1.key }))")
//    Обновите значение для одного из ключей.
    cityPopulation.updateValue(1257341
, forKey: "Казань")
    print("Обновите значение для одного из ключей (Казань): \(cityPopulation.sorted(by: { $0.key < $1.key }))")

//    Получите значение для одного из ключей.
    print("Получите значение для одного из ключей (Казань): \(cityPopulation["Казань"]!)")
}
