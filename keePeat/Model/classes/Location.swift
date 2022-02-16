//
//  Location.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 07/01/22.
//

import UIKit
import MapKit


class Location: NSObject, MKAnnotation {
    // static var locationId: Int?
    let userName: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    let locationImage: UIImage?

    init(
      userName: String?,
      locationName: String?,
      coordinate: CLLocationCoordinate2D,
      locationImage: UIImage?
    ) {
        self.userName = userName
        self.locationName = locationName
        self.coordinate = coordinate
        self.locationImage = locationImage

      super.init()
    }

    var subtitle: String? {
      return locationName
    }
}
