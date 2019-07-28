//
//  PhotoListCellViewModel.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

class PhotoListCellViewModel: PhotoListCellViewModelProtocol {
    var delegate: PhotoListCellViewModelDelegate?
    var photoService: PostServiceProtocol!
    var photoId: String!
    
    init(photoService: PostServiceProtocol, photoId: String) {
        self.photoService = photoService
        self.photoId = photoId
    }
    
    func loadPhoto() {
        photoService.fetchPhoto(with: photoId) {[weak self](result) in
            guard let self = self else { return }
            
            switch result {
                case .success(let photoResponse):
                    self.notify(.photoFetched(photoResponse))
                case .failure(let error):
                    print(error.localizedDescription) // print error for now
            }
        }
    }
    
    private func notify(_ output: PhotoListCellViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }

}
