//
//  ViewControllerPublish.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 10/02/22.
//

import UIKit

class ViewControllerPublish: UIViewController {

    @IBOutlet weak var imgViewPhoto: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // carga la imagen en la vista
        if let imageData = UserDefaults.standard.object(forKey: "img") as? Data,
            let image = UIImage(data: imageData) {
            
            imgViewPhoto.image = image
        }
    }
    
    @IBAction func publishPhoto(_ sender: UIButton) {
        let alert = UIAlertController(title: "¡Gracias por subir tu fotografía!", message: "Tu ayuda es fundamental para la preservación y restauración de las turberas.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

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
