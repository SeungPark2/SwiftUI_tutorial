//
//  UserData.swift
//  SwiftUI_tutorial
//
//  Created by PST on 2020/01/03.
//  Copyright © 2020 PST. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    
    @Published var showFavoriteOnly = false
    @Published var stations = stationData
}
