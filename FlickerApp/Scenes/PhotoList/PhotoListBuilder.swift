//
//  PhotoListBuilder.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

final class PhotoListBuilder {
    static func make() -> PhotoListViewController {
        let storyboard = UIStoryboard.init(name: "PhotoList" , bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PhotoListViewController" ) as! PhotoListViewController

        //Decleare view model here
        viewController.viewModel =  PhotoListViewModel(postServiceProtocol: PostService())
        
        return viewController
    }
}

