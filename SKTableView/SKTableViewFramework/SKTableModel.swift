//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import UIKit

typealias SKVoidBlock = () -> Void

class SKTableModel: SKTableModelProtocol
{
    var selectionBlock: SKVoidBlock?

    final func cellTypeIdentifier() -> String
    {
        let cellTypeName = NSStringFromClass(self.cellType())
        return cellTypeName.components(separatedBy: ".").last!
    }

    func onCellSelected(selectionBlock: @escaping SKVoidBlock)
    {
        self.selectionBlock = selectionBlock
    }

    func cellHeight() -> CGFloat {
        fatalError("Cell height have to be implemented.")
    }

    func cellType() -> SKTableCell.Type {
        fatalError("Cell type have to be implemented.")
    }

    func cellSelected()
    {
        self.selectionBlock?()
    }
}
