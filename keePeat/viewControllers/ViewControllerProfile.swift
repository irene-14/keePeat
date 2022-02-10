//
//  ViewControllerProfile.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 08/01/22.
//

import UIKit

class ViewControllerProfile: UIViewController {


    @IBOutlet weak var lbName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        lbName.text = "Hola " + defaults.string(forKey:"userName")!

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
