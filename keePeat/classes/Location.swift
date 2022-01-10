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

    init(
      title: String?,
      locationName: String?,
      coordinate: CLLocationCoordinate2D
    ) {
      self.title = title
      self.locationName = locationName
      self.coordinate = coordinate

      super.init()
    }

    var subtitle: String? {
      return locationName
    }
}
