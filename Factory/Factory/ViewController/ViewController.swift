//
//  ViewController.swift
//  Factory
//
//  Created by Анастасия Ильина on 17.08.2020.
//  Copyright © 2020 Анастасия Ильина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var exersiceArray = [Exersice]()

    override func viewDidLoad() {
        super.viewDidLoad()
        createExersice(exName: .jump)
        createExersice(exName: .run)
    }

    func createExersice(exName: Exersices) {
        let newExersice = FactoryExersices.defaultFactory.createExersice(name: exName)
        exersiceArray.append(newExersice)
    }

}

