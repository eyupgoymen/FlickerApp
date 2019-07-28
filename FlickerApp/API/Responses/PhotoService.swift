//
//  PhotoService.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

class PhotoServiceResponse: Codable {
    let sizes: Sizes
    let stat: String
    
    init(sizes: Sizes, stat: String) {
        self.sizes = sizes
        self.stat = stat
    }
}

class Sizes: Codable {
    let size: [Size]
    
    init(size: [Size]) {
        self.size = size
    }
}

class Size: Codable {
    let label: String
    let source: String
    
    init(label: String, source: String) {
        self.label = label
        self.source = source
    }
}
