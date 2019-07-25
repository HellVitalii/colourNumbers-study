//
//  ViewModel.swift
//  Numbers
//
//  Created by stager on 19/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

protocol BaseViewModelDelegate: class {
    func  deleteRow(fromIndexPath indexPath: IndexPath)
}
protocol ListsViewModelCoordinator: class{
    func useEditViewController()
}

class BaseViewModel {
    
    var dataWithColorNumbers: FormattedNumbersStore!
    var selectedIndexPath: IndexPath? = nil;
    let sections = ["AddCellInTheEnd", "Numbers"]
    weak var delegate: BaseViewModelDelegate?
    weak var coordinator: ListsViewModelCoordinator?
    
    func numberOfSection() -> Int {
        return sections.count
    }
    
    func titleForSection(fromSection section: Int) -> String {
        return sections[section]
    }
    
    func numberOfRow(fromSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return dataWithColorNumbers.numbers.count
        }
        return 0
    }
    
    func cellViewModel(fromIndexPath indexPath: IndexPath) -> CellWithNumberViewModel? {
        if indexPath.section == 1 {
            if dataWithColorNumbers.loveNumbers!.contains(dataWithColorNumbers.numbers[indexPath.row]) {
                return CellWithNumberViewModel.init(formattedNumber: dataWithColorNumbers.numbers[indexPath.row], favorite: true)
            }
            else {
                return CellWithNumberViewModel.init(formattedNumber: dataWithColorNumbers.numbers[indexPath.row], favorite: false)
            }
        }
        return nil
    }
    
    func editViewViewModel() -> EditViewModel {
        return EditViewModel.init(number: dataWithColorNumbers.numbers[selectedIndexPath!.row].number)
    }
    
    func changeNumber(with number: Double) {
        if let index = dataWithColorNumbers.loveNumbers!.firstIndex(of: dataWithColorNumbers.numbers[selectedIndexPath!.row]) {
            dataWithColorNumbers.loveNumbers![index].number = number
        }
        
        dataWithColorNumbers.numbers[selectedIndexPath!.row].number = number
    }
    
    func pressedCell(with indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        coordinator?.useEditViewController()
    }
    
    func add(number: Double) {
        dataWithColorNumbers.numbers.append(FormattedNumber.init(number: number))
    }
    
    func delete(fromIndexPath indexPath: IndexPath) {
        
        if let index = dataWithColorNumbers.loveNumbers!.firstIndex(of: dataWithColorNumbers.numbers[indexPath.row]) {
            dataWithColorNumbers.loveNumbers!.remove(at: index)
        }
        dataWithColorNumbers.numbers.remove(at: indexPath.row)
        delegate?.deleteRow(fromIndexPath: indexPath)
        
    }
    /*func cell(fromIndexPath indexPath: IndexPath) -> AddingCellViewModel {
        
    }*/
    func addToFavorite(fromIndexPath indexPath:IndexPath) {
        dataWithColorNumbers.loveNumbers!.append(dataWithColorNumbers.numbers[indexPath.row])
    }
    func deleteFromFavorite(fromIndexPath indexPath:IndexPath) {
        guard let index = dataWithColorNumbers.loveNumbers!.firstIndex(of: dataWithColorNumbers.numbers[indexPath.row]) else {return}
        dataWithColorNumbers.loveNumbers!.remove(at: index)
    }
}
