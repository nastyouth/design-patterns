//
//  Excersice.swift
//  Factory
//
//  Created by Анастасия Ильина on 17.08.2020.
//  Copyright © 2020 Анастасия Ильина. All rights reserved.
//

import Foundation

protocol Exersice {
    var name: String {get}
    var type: String {get}
    
    func start()
    func stop()
}
