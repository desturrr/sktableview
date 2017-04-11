//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import UIKit

protocol SKTableReusableModelProtocol {
    func viewHeight() -> CGFloat
    func viewType() -> SKTableReusableView.Type
}

extension SKTableReusableModelProtocol
{
    final func viewTypeIdentifier() -> String
    {
        let viewTypeName = NSStringFromClass(self.viewType())
        return viewTypeName.components(separatedBy: ".").last!
    }
}

