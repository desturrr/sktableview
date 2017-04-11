//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import UIKit

class SKTableReusableModel: SKTableReusableModelProtocol
{
    func viewHeight() -> CGFloat {
        fatalError("Table reusable model height have to be implemented.")
    }

    func viewType() -> SKTableReusableView.Type {
        fatalError("Table reusable model type have to be implemented.")
    }
}
