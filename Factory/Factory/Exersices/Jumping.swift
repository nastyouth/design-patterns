//
//  Jumping.swift
//  Factory
//
//  Created by Анастасия Ильина on 17.08.2020.
//  Copyright © 2020 Анастасия Ильина. All rights reserved.
//

import Foundation

class Jumping: Exersice {
    var name: String = "Прыжки"
    
    var type: String = "Упражнение для ног"
    
    func start() {
        print("Начинаем упражнение")
    }
    
    func stop() {
        print("Заканчиваем упражнение")
    }
}
