//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import UIKit

class SKTableReusableView: UIView, SKTableReusableViewProtocol {

    var reusableModel: SKTableReusableModel?

    func applyReusableModel(reusableModel: SKTableReusableModel) {
        self.reusableModel = reusableModel
    }

    func getReusableModel<T:SKTableReusableModel>() -> T {
        return self.reusableModel as! T
    }
}
