//
//  GraphCoordinator.swift
//  Numbers
//
//  Created by stager on 25/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class GraphCoordinator: Coordinator{
    
        var rootViewController: UIViewController {
            return viewController
        }
    
        var dataNumbers: FormattedNumbersStore
        var viewController: GraphViewController
    
        init(data: FormattedNumbersStore) {
            //self.navigationController = navigationController
            self.dataNumbers = data
            
            self.viewController = GraphViewController.instantiate()
            self.viewController.viewModel = GraphViewModel()
            self.viewController.viewModel.dataWithColorNumbers = dataNumbers
            
            self.viewController.viewModel.coordinator = self
            
    }
    
    func start() {
        
    }
}
