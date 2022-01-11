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
        map.addAnnotations([Location (title: "Pradera Ruoergai",
                                     locationName: "Sichuan, China",
                                     coordinate: CLLocationCoordinate2D(latitude: 33.783866, longitude: 102.880009)),
                           Location (title: "Sierra Do Xistral",
                                    locationName: "Galicia, España",
                                    coordinate: CLLocationCoordinate2D(latitude: 43.481388888889, longitude: -7.6305555555556)),
                            Location (title: "Tierra del Fuego",
                                     locationName: "Patagonia, Chile",
                                     coordinate: CLLocationCoordinate2D(latitude: -53.6, longitude: -69.383333333333)),
                           ])
        
        // queda pendiente poner imagenes
        //map.largeContentImage = UIImage(named: "location-spain")
    }
}
