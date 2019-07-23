//
//  Coordinator.swift
//  Numbers
//
//  Created by stager on 23/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigatonController: UINavigationController { get set }
    
    func start()
}
