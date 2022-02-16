//
//  ViewControllerLocationsMap.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 07/01/22.
//

import UIKit
import MapKit

class ViewControllerLocationsMap: UIViewController {

    @IBOutlet weak var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load peatland locations on the map
        map.addAnnotations([Location (userName: "97pedro",
                                     locationName: "Pradera Ruoergai (China)",
                                      coordinate: CLLocationCoordinate2D(latitude: 33.783866, longitude: 102.880009),
                                      locationImage: UIImage(named: "location-spain")),
                            Location (userName: "irene14",
                                      locationName: "Sierra Do Xistral (Spain)",
                                     coordinate: CLLocationCoordinate2D(latitude: 43.481388888889, longitude: -7.6305555555556), locationImage: UIImage(named: "location-china")),
                            Location (userName: "987juan",
                                     locationName: "Tierra del Fuego (Chile)",
                                      coordinate: CLLocationCoordinate2D(latitude: -53.6, longitude: -69.383333333333), locationImage: UIImage(named: "location-indonesia")),
                           ])
    }
}
