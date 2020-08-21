//
//  FactoryExercises.swift
//  Factory
//
//  Created by Анастасия Ильина on 17.08.2020.
//  Copyright © 2020 Анастасия Ильина. All rights reserved.
//

import Foundation

enum Exersices {
    case jump, run
}

class FactoryExersices {
    static let defaultFactory = FactoryExersices()
    
    func createExersice(name: Exersices) -> Exersice {
        switch name {
        case .jump:
            return Jumping()
        case .run:
            return Running()
        }
    }
}
