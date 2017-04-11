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
        let productModel2 = ProductModel(productName: "Kemal pasa tatlisi", productPrice: "51 kurus")

        let productHeaderModel = ProductHeaderModel(title: "Recolar Burada")
        let productData = SKTableData(models: [productModel,productModel2], headerModel: productHeaderModel)

        self.skTableView.buildTableDatas(tableDatas: [productData])
    }
}
