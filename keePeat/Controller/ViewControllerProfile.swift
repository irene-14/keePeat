//
//  ViewControllerProfile.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 08/01/22.
//

import UIKit

class ViewControllerProfile: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var tbActivity: UITableView!
    
    var userName: String!
    var listCells : [Cell]!
    var defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hay que cambiar todas las condiciones por HAS UPLOADED PICTURES
        if defaults.bool(forKey: "loggedIn") {
            userName = defaults.string(forKey:"userName")!
            lbName.text = "Hola " + userName
            listCells = [
                Cell(cellImg: UIImage(named: "location-chile"), cellLocation: "Chile", cellUsername: userName),
                Cell(cellImg: UIImage(named: "location-spain"), cellLocation: "Galicia, España", cellUsername: userName),
                Cell(cellImg: UIImage(named: "location-china"), cellLocation: "Sichuan, China", cellUsername: userName),
                Cell(cellImg: UIImage(named: "location-indonesia"), cellLocation: "Sumatra, Indonesia", cellUsername: userName),
                Cell(cellImg: UIImage(named: "location-argentina"), cellLocation: "Patagonia, Argentina", cellUsername: userName)]
        } else {
            // usuario no logueado
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if defaults.bool(forKey: "loggedIn") {
            return listCells.count
        } else { return 1 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell")!
        if defaults.bool(forKey: "loggedIn") {
        cell.textLabel?.text = listCells[indexPath.row].cellLocation
        cell.detailTextLabel?.text = listCells[indexPath.row].cellUsername
        cell.imageView?.image = listCells[indexPath.row].cellImg?.resize(size: CGSize(width: 40, height: 40))
        } else {
            cell.textLabel?.text = "Todavía no hay publicaciones"
            cell.detailTextLabel?.text = "Sube una fotografía para ayudar a la comunidad"
        }
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
