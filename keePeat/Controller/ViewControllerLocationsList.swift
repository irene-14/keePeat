//
//  ViewControllerLocationsList.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 10/01/22.
//

import UIKit

class ViewControllerLocationsList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var listCells = [
        Cell(cellImg: UIImage(named: "location-chile"), cellLocation: "Pradera Ruoergai (China)", cellUsername: "97pedro"),
        Cell(cellImg: UIImage(named: "location-spain"), cellLocation: "Sierra do Xistral (Spain)", cellUsername: "irene14"),
        Cell(cellImg: UIImage(named: "location-china"), cellLocation: "Tierra del Fuego (Chile)", cellUsername: "987juan"),
        Cell(cellImg: UIImage(named: "location-indonesia"), cellLocation: "Sumatra, Indonesia", cellUsername: "gulixx"),
        Cell(cellImg: UIImage(named: "location-argentina"), cellLocation: "Patagonia, Argentina", cellUsername: "ana-rey"),
        Cell(cellImg: UIImage(named: "location-chile"), cellLocation: "Chile", cellUsername: "julian_lopez"),
        Cell(cellImg: UIImage(named: "location-spain"), cellLocation: "Galicia, España", cellUsername: "sofiatm"),
        Cell(cellImg: UIImage(named: "location-china"), cellLocation: "Sichuan, China", cellUsername: "abeo16"),
        Cell(cellImg: UIImage(named: "location-indonesia"), cellLocation: "Sumatra, Indonesia", cellUsername: "ceos342"),
        Cell(cellImg: UIImage(named: "location-argentina"), cellLocation: "Patagonia, Argentina", cellUsername: "92prados"),
        Cell(cellImg: UIImage(named: "location-chile"), cellLocation: "Chile", cellUsername: "luis-benito"),
        Cell(cellImg: UIImage(named: "location-spain"), cellLocation: "Galicia, España", cellUsername: "sofiat4_02"),
        Cell(cellImg: UIImage(named: "location-china"), cellLocation: "Sichuan, China", cellUsername: "jose-1"),
        Cell(cellImg: UIImage(named: "location-indonesia"), cellLocation: "Sumatra, Indonesia", cellUsername: "teresa94_perez"),
        Cell(cellImg: UIImage(named: "location-argentina"), cellLocation: "Patagonia, Argentina", cellUsername: "diegorodriguez2"),]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell")!
        cell.textLabel?.text = listCells[indexPath.row].cellLocation
        cell.detailTextLabel?.text = listCells[indexPath.row].cellUsername
        cell.imageView?.image = listCells[indexPath.row].cellImg?.resize(size: CGSize(width: 40, height: 40))

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCells.count
    }

}
