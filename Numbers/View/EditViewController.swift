//
//  InfoControllerView.swift
//  Numbers
//
//  Created by stager on 12/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func change(sender: EditViewController, number: FormattedNumber)
}

class EditViewController: UIViewController {
    
    var viewModel: EditViewViewModel!
    
    weak var delegate: EditViewControllerDelegate?
    
    @IBOutlet weak var numberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberField.text = viewModel.value()
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        let newNumber = FormattedNumber.init(number: Double(numberField.text!)!)
        delegate?.change(sender: self, number: newNumber)
        navigationController?.popViewController(animated: true)
    }
}

