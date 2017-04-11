//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import UIKit

protocol SKTableModelProtocol
{
    func cellHeight() -> CGFloat
    func cellType() -> SKTableCell.Type
    func cellSelected()
}
