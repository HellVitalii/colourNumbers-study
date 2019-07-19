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
    var dataWithColorNumbers: FormattedNumbersStore!
    var selectedIndexPath: IndexPath? = nil;
    
    var selectedUIView = false
    
    @IBOutlet weak var tableWithNumber: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print(selectedUIView)
        //elf.tableWithNumber.reloadData()
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? EditViewController else {return}
        
        dvc.delegate = self
        dvc.row = selectedIndexPath!.row;
        if selectedIndexPath?.section == 1 {
            dvc.number = dataWithColorNumbers.loveNumbers![selectedIndexPath!.row].number
        }
        if selectedIndexPath?.section == 2 {
            dvc.number = dataWithColorNumbers![selectedIndexPath!.row].number
        }
        
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
        if selectedIndexPath?.section == 1 {
            dataWithColorNumbers.loveNumbers![selectedIndexPath!.row].number = number
        }
        if selectedIndexPath?.section == 2 {
            dataWithColorNumbers[selectedIndexPath!.row].number = number;
        }
        tableWithNumber.reloadRows(at: [selectedIndexPath!], with: UITableView.RowAnimation.left)
    }

}

extension NumbersViewController: AddingCellDelegate{
    func addData(number: Double) {
        dataWithColorNumbers.numbers.append(FormattedNumber.init(number: number))
        tableWithNumber.reloadData()
    }
    
}

extension NumbersViewController: CellWithNumberDelegate{
    func addToUserDefaults(sender: UITableViewCell) {
        let cell = sender as! CellWithNumber
        let indexPath = self.tableWithNumber.indexPath(for: sender)
        let tempNumber = dataWithColorNumbers[indexPath!.row]
        dataWithColorNumbers.numbers.remove(at: indexPath!.row)
        dataWithColorNumbers.loveNumbers!.append(tempNumber)
    
    }
    
    func deleteFromUserDefaults(sender: UITableViewCell) {
    
        let indexPath = self.tableWithNumber.indexPath(for: sender)
        let tempNumber = dataWithColorNumbers.loveNumbers![indexPath!.row]
        dataWithColorNumbers.numbers.append(tempNumber)
        dataWithColorNumbers.loveNumbers!.remove(at: indexPath!.row)

        
    }
    
    
}
extension NumbersViewController: UITableViewDelegate {
    
}

extension NumbersViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0 {
            return 1
        }
        if section==1 {
            return dataWithColorNumbers.loveNumbers!.count
        }
        return dataWithColorNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section==0) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"addCell", for: indexPath) as! AddingCell
            cell.delegate = self
            return cell
        }
        if (indexPath.section==1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath) as! CellWithNumber
            
            cell.delegate = self
            
            cell.configure(with: dataWithColorNumbers.loveNumbers![indexPath.row])
            cell.addSwitch.isOn = true
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath) as! CellWithNumber
        
        cell.delegate = self
        
        cell.configure(with: dataWithColorNumbers[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.section != 0) {
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



