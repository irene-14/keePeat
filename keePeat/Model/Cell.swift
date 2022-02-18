//
//  Cell.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 08/01/22.
//

import UIKit

class Cell: NSObject {
    let cellImg: UIImage?
    let cellLocation: String?
    let cellUsername: String? // después tendría que ser un User?

    init(
        cellImg: UIImage?,
        cellLocation: String?,
        cellUsername: String?
    ) {
      self.cellImg = cellImg
      self.cellLocation = cellLocation
      self.cellUsername = cellUsername

      super.init()
    }

}
