//
//  ViewControllerResults.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 07/01/22.
//

import UIKit

class ViewControllerResults: UIViewController {
    
    var classified: String!
    var probability: String!

    @IBOutlet weak var lbClassification: UILabel!
    @IBOutlet weak var lbProbability: UILabel!

    @IBOutlet weak var btnPublish: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        lbProbability.text = String(probability) + " %"

        if classified == "turbera" {
            lbClassification.text = "¡Enhorabuena! Parece que has detectado una turbera. Compártela con la comunidad para ayudar a concienciar."
            btnPublish.isHidden = false

        } else {
            lbClassification.text = "¡Vaya! Esta vez no has dado con una turbera. Vuelve a la página de Inicio para aprender más sobre ellas."
            btnPublish.isHidden = true
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
