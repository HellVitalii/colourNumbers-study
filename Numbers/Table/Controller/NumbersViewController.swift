//
//  ViewController.swift
//  Numbers
//
//  Created by stager on 12/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {

   // var dataWithRandomNumbers = [Int]();
    var dataWithColorNumbers = FormattedNumbersStore()
    var selectedRow = -1;
    var selectedIndexPath: IndexPath? = nil;
    
    @IBOutlet weak var tableWithNumber: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataWithColorNumbers = FormattedNumbersStore(count:Int.random(in: 10..<50))
        
//        for _ in 0...Int.random(in: 10..<50){
//
//            self.dataWithRandomNumbers.append(Int.random(in: 5..<100))
//        }
        self.tableWithNumber.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? EditViewController else {return}
        
        dvc.delegate = self
        dvc.row = selectedRow;
        dvc.number = dataWithColorNumbers[selectedRow].number
    }
    
   /* override func viewDidAppear(_ animated: Bool) {
        //self.tableWithNumber.beginUpdates()
        if (selectedIndexPath != nil){
            tableWithNumber.reloadRows(at: [selectedIndexPath!], with: UITableView.RowAnimation.left)
        }
        //self.tableWithNumber.reloadData()
    }*/
    
}

extension NumbersViewController: EditViewControllerDelegate{
    
    func change(sender: EditViewController, number: Double) {
        dataWithColorNumbers[selectedRow].number = number;
        tableWithNumber.reloadRows(at: [selectedIndexPath!], with: UITableView.RowAnimation.left)
    }

}

extension NumbersViewController: AddingCellDelegate{
    func addData(number: Double) {
        dataWithColorNumbers.numbers.append(FormattedNumber.init(number: number))
        tableWithNumber.reloadData()
    }
    
}

extension NumbersViewController: UITableViewDelegate {
    
}

extension NumbersViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataWithColorNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row==0) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"addCell", for: indexPath) as! AddingCell
            cell.delegate = self
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath) as! CellWithNumber
        
        cell.configure(with: dataWithColorNumbers[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.row==0) {
        } else {
            selectedRow = indexPath.row
            selectedIndexPath = indexPath
            performSegue(withIdentifier: "info", sender: nil)
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            dataWithColorNumbers.numbers.remove(at: indexPath.row)
            tableWithNumber.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        }
        
    }
}



