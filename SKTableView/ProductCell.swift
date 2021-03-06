//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import UIKit

class ProductCell: SKTableCell {
    
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var labelProductPrice: UILabel!
    @IBOutlet weak var imageViewProduct: UIImageView!
    
    override func applyModel(tableModel: SKTableModel) {
        super.applyModel(tableModel: tableModel)
        self.labelProductName.text = self.getCellModel().productName
        self.labelProductPrice.text = self.getCellModel().productPrice
        self.imageViewProduct.image = UIImage(named: self.getCellModel().picture)!
    }

    private func getCellModel() -> ProductModel {
        let model: ProductModel = super.getModel()
        return model
    }
}
