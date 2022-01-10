//
//  ViewControllerProfile.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 08/01/22.
//

import UIKit

class ViewControllerProfile: UIViewController {

    @IBOutlet weak var lbEmail: UITextField!
    @IBOutlet weak var lbPassword: UITextField!

    @IBOutlet weak var btnLogin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        btnLogin.isEnabled = false
    }
    
    //quita el teclado al dar tap
    @IBAction func removeKeypad(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        
        // trabajo futuro: usar keychain
        let defaults = UserDefaults.standard
        defaults.set([lbEmail.text, lbPassword.text], forKey: "userArray")

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
