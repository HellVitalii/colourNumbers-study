//
//  FavoriteViewModel.swift
//  Numbers
//
//  Created by stager on 22/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import Foundation

class FavoriteViewModel: BaseViewModel {
    
    override func numberOfRow(fromSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return dataWithColorNumbers.loveNumbers!.count
        }
        return 0
    }
    
    override func cellViewModel(fromIndexPath indexPath: IndexPath) -> CellWithNumberViewModel? {
        if indexPath.section == 1 {
            return CellWithNumberViewModel.init(formattedNumber: dataWithColorNumbers.loveNumbers![indexPath.row], favorite: true)
        }
        return nil
    }
    override func editViewViewModel() -> EditViewModel {
        return EditViewModel.init(number: dataWithColorNumbers.loveNumbers![selectedIndexPath!.row].number)
    }
    
    override func changeNumber(with number: Double) {
        guard let index = dataWithColorNumbers.numbers.firstIndex(of: dataWithColorNumbers.loveNumbers![selectedIndexPath!.row]) else {return}
        dataWithColorNumbers.loveNumbers![selectedIndexPath!.row].number = number
        dataWithColorNumbers.numbers[index].number = number
        dataWithColorNumbers.saveFavoriteNumbers()
    }
    
    override func add(number: Double) {
        let formattedNumber = FormattedNumber.init(number: number)
        dataWithColorNumbers.loveNumbers!.append(formattedNumber)
        dataWithColorNumbers.numbers.append(formattedNumber)
    }
    
    override func delete(fromIndexPath indexPath: IndexPath) {
        dataWithColorNumbers.loveNumbers!.remove(at: indexPath.row)
        delegate?.deleteRow(fromIndexPath: indexPath)
    }
    
    override func deleteFromFavorite(fromIndexPath indexPath: IndexPath) {
        delete(fromIndexPath: indexPath)
    }
}
