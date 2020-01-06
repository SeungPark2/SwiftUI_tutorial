//
//  StationRow.swift
//  SwiftUI_tutorial
//
//  Created by PST on 2020/01/02.
//  Copyright © 2020 PST. All rights reserved.
//

import SwiftUI

struct StationRow: View {
    
    var station: StationInfo
    
    var body: some View {
        HStack {
            station.image
                .resizable()
                .frame(width: 40, height: 40)
            Text(station.name)
                .font(.headline)
            Spacer()
            
            if station.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
                    .padding(.trailing, 5)
            }
            
        }.padding(.leading, 10)
    }
}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StationRow(station: stationData[0])
            StationRow(station: stationData[1])
                
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
