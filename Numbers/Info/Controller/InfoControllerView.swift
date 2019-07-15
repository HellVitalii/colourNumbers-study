//
//  InfoControllerView.swift
//  Numbers
//
//  Created by stager on 12/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

protocol InfoControllerViewDelegate {
    func change(number:Int,in row:Int)
}
class InfoControllerView: UIViewController {
    var number = 0;
    var row = 0;
    var delegate: InfoControllerViewDelegate?;
    
    @IBOutlet weak var numberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberField.text = String(number)
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let newNumber = Int(numberField.text!) else {return}
        delegate?.change(number: newNumber, in: row)
        navigationController?.popViewController(animated: true)
    }
}

