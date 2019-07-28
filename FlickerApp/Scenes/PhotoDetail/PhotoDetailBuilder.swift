//
//  PhotoDetailBuilder.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

final class PhotoDetailBuilder {
    static func make(image: UIImage) -> PhotoDetailViewController {
        let storyboard = UIStoryboard.init(name: "PhotoDetail" , bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PhotoDetailViewController" ) as! PhotoDetailViewController

        viewController.image = image
        
        return viewController
    }
}

