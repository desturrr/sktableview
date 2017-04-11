//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import UIKit

class SKTableCell: UITableViewCell, SKTableCellProtocol
{
    var model: SKTableModel?

    func applyModel(tableModel: SKTableModel) {
        self.model = tableModel
    }

    func getModel<T: SKTableModel>() -> T {
        return self.model as! T
    }
}
