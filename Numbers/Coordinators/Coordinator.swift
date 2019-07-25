//
//  Coordinator.swift
//  Numbers
//
//  Created by stager on 23/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

protocol Coordinator: class {
        
    func start()
    
    var rootViewController: UIViewController { get }  
    
}
