//
//  FlickerAPI.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Moya

enum FlickerAPI {
    case fetchRecentPhotos(page: Int)
    case fetchPhoto(id: String)
}

extension FlickerAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.flickr.com/services/rest/")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
            case .fetchRecentPhotos(let pageNumber):
                return .requestParameters(parameters: ["method" : "flickr.photos.getRecent","api_key" : Constants.apiKey, "per_page" : Constants.numberOfpostPerPage, "page" : pageNumber, "format" : "json", "nojsoncallback" : 1], encoding: URLEncoding.default)
            case .fetchPhoto(let photo_id):
                return .requestParameters(parameters: ["method" : "flickr.photos.getSizes", "api_key" : Constants.apiKey, "format" : "json", "nojsoncallback" : 1, "photo_id" : photo_id], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}

