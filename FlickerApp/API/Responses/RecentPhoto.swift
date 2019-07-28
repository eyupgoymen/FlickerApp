//
//  RecentPhoto.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

class RecentPhotoResponse: Codable {
    let photos: Photos
    let stat: String
    
    init(photos: Photos, stat: String) {
        self.photos = photos
        self.stat = stat
    }
}

class Photos: Codable {
    var photo: [Photo]
    
    init(photo: [Photo]) {
        self.photo = photo
    }
}

class Photo: Codable {
    let id, owner: String
    let title: String
    
    init(id: String, owner: String, title: String) {
        self.id = id
        self.owner = owner
        self.title = title
    }
}
