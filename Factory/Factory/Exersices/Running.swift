//
//  Running.swift
//  Factory
//
//  Created by Анастасия Ильина on 17.08.2020.
//  Copyright © 2020 Анастасия Ильина. All rights reserved.
//

import Foundation

class Running: Exersice {
    var name: String = "Бег"
    
    var type: String = "Упражнение на все мышцы тела"
    
    func start() {
        print("Начинаем упражнение")
    }
    
    func stop() {
        print("Заканчиваем упражнение")
    }
}
