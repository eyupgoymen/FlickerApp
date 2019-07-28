//
//  PhotoListViewModel.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation


final class PhotoListViewModel : PhotoListViewModelProtocol {
    var delegate: PhotoListViewModelDelegate?
    var postServiceProtocol: PostServiceProtocol!
    
    var recentPhotos: Photos?
    var nextPageIndex: Int!
    
    init(postServiceProtocol: PostServiceProtocol, currentPage: Int = 1) {
        self.postServiceProtocol = postServiceProtocol
        self.nextPageIndex = currentPage
    }
    
    func loadRecentPhotos() {
        notify(.setLoading(true))
       
        
        postServiceProtocol.fetchRecentPhotos(page: nextPageIndex) {[weak self] (result) in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            
            switch result {
                case .success(let recentPhotosResponse):
                    if self.recentPhotos != nil {
                        self.recentPhotos!.photo.append(contentsOf: recentPhotosResponse.photo) // append new photos to existing ones.
                    } else {
                        self.recentPhotos = recentPhotosResponse // set for the first time
                    }
                    
                    self.nextPageIndex += 1
                    self.notify(.recentPhotosFetched(self.recentPhotos!))
                
                case .failure(let error):
                    self.notify(.failed(error))
            }
        }
    }
    
    func navigateToPhotoDetail(at index: Int) {
        
    }
    
    private func notify(_ output: PhotoListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

