//
//  StationHome.swift
//  SwiftUI_tutorial
//
//  Created by PST on 2020/01/03.
//  Copyright © 2020 PST. All rights reserved.
//

import SwiftUI

struct StationHome: View {
    
    var lines: [String: [StationInfo]] {
        Dictionary(
            grouping: stationData,
            by: { $0.line.rawValue }
        )
    }
    
    var featured: [StationInfo] {
        stationData.filter { $0.isFeatured }
    }
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle()}) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("dd"))
                .padding()
        }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                FeaturedStations(stations: featured)
                    .scaledToFit()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(lines.keys.sorted(), id: \.self) { key in
                    StationHomeRow(lineName: key, items: self.lines[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: StationList()) {
                    Text("All")
                }
            }
            
            .navigationBarTitle(Text("지하철역"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) { Text("dd")}
        }
    }
}

struct FeaturedStations: View {
    var stations: [StationInfo]
    var body: some View {
        Image("subway").resizable().padding(.leading, 35)
    }
}

struct StationHome_Previews: PreviewProvider {
    static var previews: some View {
        StationHome()
    }
}
