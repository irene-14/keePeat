//
//  ViewControllerRegister.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 10/01/22.
//

import UIKit

class ViewControllerRegister: UIViewController {

    
    @IBOutlet weak var btnRegister: UIButton!
    
    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfPassword2: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        btnRegister.isEnabled = false
        tfEmail.isEnabled = false
        tfPassword.isEnabled = false
        tfPassword2.isEnabled = false

    }
    
    @IBAction func removeKeypad(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

    @IBAction func checkUsername(_ sender: UITextField) {
        // tiene que tener entre 4 y 15 caracteres alfanuméricos
        let nameRegex = "^\\w{4,15}$"
        let trimmedString = sender.text?.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        if (validateName.evaluate(with: trimmedString)) {
            
            // tambien hay q comprobar que no esté ya cogido
            print("valido")
            tfEmail.isEnabled = true
        } else {
            print("invalido")
        }
    }
    
    
    @IBAction func checkEmail(_ sender: UITextField) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let trimmedString = sender.text?.trimmingCharacters(in: .whitespaces)
              let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if (validateEmail.evaluate(with: trimmedString)) {
            print("valid email")
            tfPassword.isEnabled = true
        } else {
            print("invalid email")
        }
    }
    
}
