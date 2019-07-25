//
//  InfoControllerView.swift
//  Numbers
//
//  Created by stager on 12/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit


class EditViewController: UIViewController, Storyboarded {
    
    var viewModel: EditViewModel!
    
    @IBOutlet weak var numberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberField.text = viewModel.value()
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        viewModel.save(number: Double(self.numberField.text!)!)
    }
}

