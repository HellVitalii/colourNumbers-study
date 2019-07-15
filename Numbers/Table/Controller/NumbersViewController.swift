//
//  ViewController.swift
//  Numbers
//
//  Created by stager on 12/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {

    var dataWithRandomNumbers = [Int]();
    var selectedRow = -1;
    
    @IBOutlet weak var tableWithNumber: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for _ in 0...Int.random(in: 10..<50){
            
            self.dataWithRandomNumbers.append(Int.random(in: 5..<100))
        }
        self.tableWithNumber.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? InfoControllerView else {return}
        
        dvc.delegate = self
        dvc.row = selectedRow;
        dvc.number = dataWithRandomNumbers[selectedRow]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableWithNumber.reloadData()
    }
    
}

extension NumbersViewController: InfoControllerViewDelegate{
    
    func change(number: Int, in row: Int ){
        dataWithRandomNumbers[row] = number;
    }
}

extension NumbersViewController: UITableViewDelegate {
    
}

extension NumbersViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataWithRandomNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)
        
        cell.textLabel?.text = String(dataWithRandomNumbers[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedRow = indexPath.row;
        performSegue(withIdentifier: "info", sender: nil)
    }
    
}


