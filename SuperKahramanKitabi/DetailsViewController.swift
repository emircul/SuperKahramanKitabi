//
//  SecondViewController.swift
//  SuperKahramanKitabi
//
//  Created by Emir on 25.10.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
        
    var heroNames: String?
    var heroImageNames: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: heroImageNames!)
        label.text = heroNames!
    }
}
