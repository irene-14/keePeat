//
//  ViewControllerUser.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 11/01/22.
//

import UIKit

class ViewControllerUser: UIViewController {

    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var viewRegister: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // escoger qué vista mostrar según si el usuario está logueado o no
        
        let defaults = UserDefaults.standard
        if (defaults.bool(forKey:"loggedIn")) {
            viewProfile.alpha = 1
            viewLogin.alpha = 0
            viewRegister.alpha = 0
        } else {
            viewProfile.alpha = 0
            viewLogin.alpha = 1
            viewRegister.alpha = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // escoger qué vista mostrar según si el usuario está logueado o no
        
        let defaults = UserDefaults.standard
        if (defaults.bool(forKey:"loggedIn")) {
            viewProfile.alpha = 1
            viewLogin.alpha = 0
            viewRegister.alpha = 0
        } else {
            viewProfile.alpha = 0
            viewLogin.alpha = 1
            viewRegister.alpha = 0
        }
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
