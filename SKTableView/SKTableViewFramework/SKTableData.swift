//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import Foundation

class SKTableData {
    var models: [SKTableModel] = []
    var headerModel: SKTableReusableModel?
    var footerModel: SKTableReusableModel?

    init(models: [SKTableModel],
         headerModel: SKTableReusableModel? = nil,
         footerModel: SKTableReusableModel? = nil)
    {
        self.models = models
        self.headerModel = headerModel
        self.footerModel = footerModel
    }
}
