//
//  PostService.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Moya

protocol PostServiceProtocol {
    func fetchRecentPhotos(page: Int, completion: @escaping (Swift.Result<Photos,Error>) -> ())
    func fetchPhoto(with id: String, completion: @escaping (Swift.Result<PhotoServiceResponse,Error>) -> ())
}

final class PostService: PostServiceProtocol {
    private let apiProvider = MoyaProvider<FlickerAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func fetchRecentPhotos(page: Int, completion: @escaping (Result<Photos, Error>) -> ()) {
        apiProvider.request(.fetchRecentPhotos(page: page)) { (response) in
            switch response {
                case .success(let result):
                    do {
                        let recentPhotos = try JSONDecoder().decode(RecentPhotoResponse.self, from: result.data)
                        completion(.success(recentPhotos.photos))
                    } catch {
                        let serviceError = try! JSONDecoder().decode(ServiceError.self, from: result.data)
                        completion(.failure(FlickrError.serviceError(error: serviceError.message)))
                    }
                case .failure(let error):
                    completion(.failure(FlickrError.serviceError(error: error.localizedDescription)))
            }
        }
    }
    
    func fetchPhoto(with id: String, completion: @escaping (Result<PhotoServiceResponse, Error>) -> ()) {
        apiProvider.request(.fetchPhoto(id: id)) { (response) in
            switch response {
                case .success(let result):
                    do {
                        let photo = try JSONDecoder().decode(PhotoServiceResponse.self, from: result.data)
                        completion(.success(photo))
                    } catch {
                        let serviceError = try! JSONDecoder().decode(ServiceError.self, from: result.data)
                        completion(.failure(FlickrError.serviceError(error: serviceError.message)))
                    }
                case .failure(let error):
                    completion(.failure(FlickrError.serviceError(error: error.localizedDescription)))
            }
        }
    }
}
