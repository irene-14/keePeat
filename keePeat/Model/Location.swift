//
//  Location.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 07/01/22.
//

import UIKit
import MapKit

/*class Location: NSObject, MKAnnotation {

    // Serial number of the location
    static var locationId: Int?
    // User who uploaded the location
    let user: User?
    // Location's name given by the user
    let locationName: String?
    // Coordinates of the location
    let coordinate: CLLocationCoordinate2D
    // Image of the peatland
    let locationImage: UIImage?

    init(
      user: User?,
      locationName: String?,
      coordinate: CLLocationCoordinate2D,
      locationImage: UIImage?
    ) {
        self.user = user
        self.locationName = locationName
        self.coordinate = coordinate
        self.locationImage = locationImage
        super.init()
    }

    /// Provides the title for the annotation on the map
    /// - Returns: Name given for the location
    var title: String? {
        return locationName
    }
    
    /// Provides the subtitle for the annotation on the map
    /// - Returns: User information
    var subtitle: User? {
      return user
    }
}
*/

class Location: NSObject, MKAnnotation {
    static var locationId: Int?
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

    var title: String? {
        return locationName
    }
    
    var subtitle: String? {
      return userName
    }
}
