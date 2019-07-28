//
//  PhotoListContract.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

protocol PhotoListViewModelProtocol {
    var  delegate: PhotoListViewModelDelegate? { get set }
    var nextPageIndex: Int! { get set }
    func loadRecentPhotos()
    func navigateToPhotoDetail(at index: Int)
}

// ViewModel to view
enum PhotoListViewModelOutput {
    case setLoading(Bool)
    case failed(Error)
    case recentPhotosFetched(Photos)
}

protocol PhotoListViewModelDelegate : class {
    func handleViewModelOutput(_ output: PhotoListViewModelOutput)
}

