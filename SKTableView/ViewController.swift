//
//  ViewController.swift
//  SKTableView
//
//  Created by suat.karakusoglu on 11/04/2017.
//  Copyright (c) 2017 sk.tableview. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var skTableView: SKTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let productModel = ProductModel(productName: "Cubbuk", productPrice: "5 kurus")
        productModel.onCellSelected(selectionBlock: {
            debugPrint("Selected here")
        })
        let productModel2 = ProductModel(productName: "Kemal pasa tatlisi", productPrice: "51 kurus")

        let productHeaderModel = ProductHeaderModel(title: "Recolar Burada")
        let productFooterModel = ProductHeaderModel(title: "Footer Burada")

        let productData = SKTableData(models: [productModel,productModel2], headerModel: productHeaderModel, footerModel: productFooterModel)
        let productData1 = SKTableData(models: [productModel,productModel2], headerModel: productHeaderModel, footerModel: productFooterModel)
        let productData2 = SKTableData(models: [productModel,productModel2], headerModel: productHeaderModel, footerModel: productFooterModel)

        self.skTableView.buildTableDatas(tableDatas: [productData,productData1,productData2])
    }
}
