//
//  PhotoListCellContracts.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

protocol PhotoListCellViewModelProtocol {
    var  delegate: PhotoListCellViewModelDelegate? { get set }
    func loadPhoto()
}

// ViewModel to view
enum PhotoListCellViewModelOutput {
    case photoFetched(PhotoServiceResponse)
}

protocol PhotoListCellViewModelDelegate : class {
    func handleViewModelOutput(_ output: PhotoListCellViewModelOutput)
}
