//
//  PhotoListLayout.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//


import UIKit
import Hero

//All layout functions and animations will be here
extension PhotoListViewController {

     override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
   
    func setLayout() {
        self.navigationController?.title = "Recent photos"
        
        //Enable hero
        self.navigationController?.hero.isEnabled = true
    }
}
