//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import Foundation

protocol SKTableCellProtocol {
    func applyModel(tableModel: SKTableModel);
    func getModel() -> SKTableModel;
}
