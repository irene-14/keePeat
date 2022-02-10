//
//  ViewControllerSettings.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 11/01/22.
//

import UIKit

class ViewControllerSettings: UIViewController {


    @IBOutlet weak var btnLogout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // el boton de logout solo esta si estas logueado
        let defaults = UserDefaults.standard
        if !(defaults.bool(forKey:"loggedIn")) {
            btnLogout.isHidden = true
        }
    }
    
    @IBAction func logout(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.setValue(false, forKey:"loggedIn")
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
