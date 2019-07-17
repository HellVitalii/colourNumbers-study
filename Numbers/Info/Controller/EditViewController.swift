//
//  InfoControllerView.swift
//  Numbers
//
//  Created by stager on 12/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func change(sender: EditViewController, number:Double)
}

class EditViewController: UIViewController {
    var number:Double = 0;
    var row = 0;
    weak var delegate: EditViewControllerDelegate?
    
    @IBOutlet weak var numberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberField.text = String(number)
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let newNumber = Double(numberField.text!) else {return}
        delegate?.change(sender: self, number: newNumber)
        navigationController?.popViewController(animated: true)
    }
}

