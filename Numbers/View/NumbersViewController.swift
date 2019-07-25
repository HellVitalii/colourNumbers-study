//
//  ViewController.swift
//  Numbers
//
//  Created by stager on 12/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController, Storyboarded {
    
    var viewModel: BaseViewModel!
    
    @IBOutlet weak var tableWithNumber: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableWithNumber.reloadData()
    }
    
}

extension NumbersViewController: BaseViewModelDelegate{
    func deleteRow(fromIndexPath indexPath: IndexPath) {
        tableWithNumber.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
    }
}

extension NumbersViewController: AddingCellDelegate{
    func addData(number: Double) {
        viewModel.add(number: number)
        tableWithNumber.reloadData()
    }
    
}

extension NumbersViewController: CellWithNumberDelegate{
    func addToFavorite(sender: UITableViewCell) {
        
        let indexPath = self.tableWithNumber.indexPath(for: sender)
        viewModel.addToFavorite(fromIndexPath: indexPath!)
    
    }
    
    func deleteFromFavorite(sender: UITableViewCell) {
    
        let indexPath = self.tableWithNumber.indexPath(for: sender)
        viewModel.deleteFromFavorite(fromIndexPath: indexPath!)

        
    }
}
extension NumbersViewController: UITableViewDelegate {
    
}

extension NumbersViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow(fromSection: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForSection(fromSection: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier:"addCell", for: indexPath) as! AddingCell
            cell.delegate = self
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier:"basicStyle", for: indexPath) as! CellWithNumber
        cell.delegate = self
        let cellViewModel = viewModel.cellViewModel(fromIndexPath: indexPath)
        cell.configure(with: cellViewModel!.formattedNumber, favorite:cellViewModel!.favorite)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.section != 0) {            
            viewModel.pressedCell(with: indexPath)
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            viewModel.delete(fromIndexPath: indexPath)
            
        }
        
    }
}



