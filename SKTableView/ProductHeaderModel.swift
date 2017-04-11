//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import UIKit

class ProductHeaderModel: SKTableReusableModel {

    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    override func viewHeight() -> CGFloat {
        return 21.0
    }

    override func viewType() -> SKTableReusableView.Type {
        return ProductHeaderView.self
    }

}
