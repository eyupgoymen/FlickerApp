//
//  UIViewController+Ext.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //TODO: boolVal ne demek anlasilmiyor?
    func showIndicator(isShowing: Bool) {
        if isShowing {
            SVProgressHUD.show(withStatus: "Loading...")
        } else {
            SVProgressHUD.dismiss()
        }
    }
}
