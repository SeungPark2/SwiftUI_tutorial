//
//  StationInfo.swift
//  SwiftUI_tutorial
//
//  Created by PST on 2020/01/02.
//  Copyright © 2020 PST. All rights reserved.
//

import SwiftUI
import CoreLocation

struct StationInfo: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var wheelChair: String
    var elevator: String
    var line: Line
    var isFavorite: Bool
    var isFeatured: Bool
        
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    enum Line: String, CaseIterable, Codable, Hashable {
        case one = "1호선"
        case two = "2호선"
        case three = "3호선"
        case four = "4호선"
    }
}

extension StationInfo {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
