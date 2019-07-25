//
//  GraphViewController.swift
//  Numbers
//
//  Created by stager on 25/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController, Storyboarded {

    @IBOutlet weak var GraphView: UIView!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    var viewModel: GraphViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
