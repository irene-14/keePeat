//
//  Location.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 07/01/22.
//

import UIKit
import MapKit


class Location: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    let locationImage: UIImage?

    init(
      title: String?,
      locationName: String?,
      coordinate: CLLocationCoordinate2D,
      locationImage: UIImage?
    ) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        self.locationImage = locationImage

      super.init()
    }

    var subtitle: String? {
      return locationName
    }
}
