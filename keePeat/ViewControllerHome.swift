//
//  ViewControllerHome.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 08/01/22.
//

import UIKit

class ViewControllerHome: UIViewController {
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    @IBOutlet weak var view1: UIView!

    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var viewContainer: UIView!

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navItem.titleView = imageView

        scrollView.contentSize = viewContainer.frame.size

    }


}
