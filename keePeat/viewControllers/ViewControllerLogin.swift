//
//  ViewControllerLogin.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 11/01/22.
//

import UIKit

class ViewControllerLogin: UIViewController {

    @IBOutlet private weak var lbUsername: UITextField!
    @IBOutlet private weak var lbPassword: UITextField!

    @IBOutlet weak var btnLogin: UIButton!
    
    private var keychain: KeychainSecurity!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        keychain = KeychainSecurity()

        //btnLogin.isEnabled = false
    }
    
    //quita el teclado al dar tap
    @IBAction func removeKeypad(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        
        guard let account = lbUsername.text,
              let password = lbPassword.text,
              (!account.isEmpty && !password.isEmpty)
        else
        {
            return
        }
        
        let user = User(named: account, withPassword: password)
        
        let searchResult = keychain.getUser(user)
        
        switch searchResult
        {
            case .success(let searchUser):
                if searchUser.password == user.password
                {
                    print("ÉXITO")
                    let defaults = UserDefaults.standard
                    defaults.setValue(true, forKey:"loggedIn")
                    defaults.setValue(searchUser.name, forKey: "userName")
                    //let nextViewController = ViewControllerProfile()
                    //self.navigationController?.pushViewController(nextViewController, animated: true)

                }
                else
                {
                    print("Contraseña incorrecta")
                }
        
            case .failure(let error):
                switch error
                {
                    case .passwordNotFound:
                        print("No hay ninguna password para el usuario \(account)")
                    case .malformedData:
                        print("Contraseña inválida")
                    case .unknown(status: _):
                        print("Error al obtener la clave del Keychain")

                }
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
