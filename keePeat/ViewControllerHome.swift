//
//  ViewControllerHome.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 08/01/22.
//

import UIKit

class ViewControllerHome: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!

    var listCells = [Cell(cellImg: UIImage(named: "location-spain"), cellLocation: "Spain", cellUsername: "irenita14"),
                     Cell(cellImg: UIImage(named: "location-spain"), cellLocation: "Spain", cellUsername: "irenita14"),
                     Cell(cellImg: UIImage(named: "location-spain"), cellLocation: "Russia", cellUsername: "987juan"),
                     Cell(cellImg: UIImage(named: "location-spain"), cellLocation: "Italy", cellUsername: "gulixx"),
                     Cell(cellImg: UIImage(named: "location-spain"), cellLocation: "Georgia", cellUsername: "ana-rey"),]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell")!
        cell.textLabel?.text = listCells[indexPath.row].cellLocation
        cell.detailTextLabel?.text = listCells[indexPath.row].cellUsername
        cell.imageView?.image = listCells[indexPath.row].cellImg
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCells.count
    }


}
