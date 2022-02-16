//
//  ViewControllerLocations.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 10/01/22.
//

import UIKit

class ViewControllerLocations: UIViewController {

    @IBOutlet weak var viewMap: UIView!
    
    @IBOutlet weak var viewList: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // inicializar las vistas
        viewMap.alpha = 0
        viewList.alpha = 1
    }
    
    @IBAction func swichViews(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            viewMap.alpha = 0
            viewList.alpha = 1
        } else {
            viewMap.alpha = 1
            viewList.alpha = 0
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
