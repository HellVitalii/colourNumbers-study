//
//  MainCoordinator.swift
//  Numbers
//
//  Created by stager on 23/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import Foundation

import UIKit

class AllListCoordinator: Coordinator, EditViewModelDelegate, ListsViewModelCoordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
   
    var dataNumbers: FormattedNumbersStore
    var navigationController: UINavigationController
    var viewController: NumbersViewController
    
    init(data: FormattedNumbersStore) {
        //self.navigationController = navigationController
        self.dataNumbers = data
        
        self.viewController = NumbersViewController.instantiate()
        self.viewController.viewModel = AllListViewModel()
        self.viewController.viewModel.dataWithColorNumbers = dataNumbers
        self.viewController.viewModel.delegate = self.viewController

        self.navigationController = UINavigationController.init(rootViewController: self.viewController)

        self.viewController.viewModel.coordinator = self


    }
    
    func start() {
        
    
    }
    
    func useEditViewController() {
        let vc = EditViewController.instantiate()
        let viewModel = self.viewController.viewModel.editViewViewModel()
        
        viewModel.coordinator = self
        vc.viewModel = viewModel
        
        self.navigationController.pushViewController(vc, animated: false)
        
    }
    
    func performChange(number: Double) {
        
        self.viewController.viewModel!.changeNumber(with: number)
        navigationController.popViewController(animated: false)
    }
}
