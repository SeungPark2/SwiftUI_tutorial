//
//  StationHomeRow.swift
//  SwiftUI_tutorial
//
//  Created by PST on 2020/01/03.
//  Copyright © 2020 PST. All rights reserved.
//

import SwiftUI

struct StationHomeRow: View {
    var lineName: String
    var items: [StationInfo]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.lineName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { station in
                        NavigationLink(destination: ContentView(station: station)) {
                            StationHomeRowItem(station: station)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct StationHomeRowItem: View {
    var station: StationInfo
    var body: some View {
        VStack(alignment: .leading) {
            station.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(5)
            
            Text(station.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct StationHomeRow_Previews: PreviewProvider {
    static var previews: some View {
        StationHomeRow(
            lineName: stationData[0].line.rawValue,
            items: Array(stationData.prefix(5))
        )
    }
}
