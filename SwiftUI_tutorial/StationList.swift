//
//  StationList.swift
//  SwiftUI_tutorial
//
//  Created by PST on 2020/01/02.
//  Copyright © 2020 PST. All rights reserved.
//

import SwiftUI

struct StationList: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
            List {
                Toggle(isOn: $userData.showFavoriteOnly) {
                    Text("좋아요만 표시")
                }
                
                ForEach(userData.stations) { station in
                    if !self.userData.showFavoriteOnly || station.isFavorite {
                        NavigationLink(destination: ContentView(station: station)) {
                            StationRow(station: station)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("2호선"))
        
    }
}

struct StationList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StationList()
                .environmentObject(UserData())
        }
    }
}
