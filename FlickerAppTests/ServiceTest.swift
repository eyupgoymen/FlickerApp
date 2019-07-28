//
//  ServiceTest.swift
//  FlickerAppTests
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import XCTest
@testable import FlickerApp

class ServiceTest: XCTestCase {
    
    func testParsingRecentPhoto() throws {
        let data = try getDataFromBundle(fileName: "RecentPhoto", ext: "json")
        let recentPhotosResponse = try JSONDecoder().decode(RecentPhotoResponse.self, from: data)
        
        XCTAssertEqual(recentPhotosResponse.stat, "ok")
        XCTAssertEqual(recentPhotosResponse.photos.photo.count, 20)
        XCTAssertEqual(recentPhotosResponse.photos.photo.first?.id, "48367145401")
    }
    
    func testParsingPhotos() throws {
        let data = try getDataFromBundle(fileName: "Photo", ext: "json")
        let photoResponse = try JSONDecoder().decode(PhotoServiceResponse.self, from: data)
        
        XCTAssertEqual(photoResponse.stat, "ok")
        XCTAssertEqual(photoResponse.sizes.size.first?.label, "Square")
    }
    
    func getDataFromBundle(fileName: String, ext: String) throws -> Data {
        let bundle = Bundle(for: ServiceTest.self)
        let url = try bundle.url(forResource: fileName, withExtension: ext).unwrap()
        return try Data(contentsOf: url)
    }
}
