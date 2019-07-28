//
//  PhotoDetailViewController.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//


import Foundation
import UIKit
import Hero

final class PhotoDetailViewController : UIViewController {
    
    //MARK: UI objects
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: Variables
    var image: UIImage?
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        // no need for extra layout layer
        imageView.hero.isEnabled = true
        imageView.hero.id = "image"
        
        imageView.image = image
    }
}
