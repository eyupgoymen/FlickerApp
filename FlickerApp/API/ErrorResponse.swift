//
//  ErrorResponse.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

struct ServiceError: Codable {
    var stat: String
    var message: String
}

enum FlickrError : Error {
    case serviceError(error: String)
    case endOfBounds
    case unknown
}

extension FlickrError:  LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .serviceError(let desc):
                return NSLocalizedString(desc, comment: "Error")
            case .endOfBounds:
                return NSLocalizedString("You have seen all posts.", comment: "Error")
            case .unknown:
                return NSLocalizedString("Unexpected Error, check your internet connection", comment: "Error")
            }
    }
}
