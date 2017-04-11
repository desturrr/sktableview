//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import UIKit

class ProductHeaderView: SKTableReusableView {
    
    @IBOutlet weak var labelHeaderTitle: UILabel!
    
    override func applyReusableModel(reusableModel: SKTableReusableModel) {
        super.applyReusableModel(reusableModel: reusableModel)
        self.labelHeaderTitle.text = self.getReusableViewModel().title
    }

    func getReusableViewModel() -> ProductHeaderModel {
        let productHeaderModel: ProductHeaderModel = self.getReusableModel()
        return productHeaderModel
    }
}
