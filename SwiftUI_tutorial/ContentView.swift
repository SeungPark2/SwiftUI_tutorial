//
//  ContentView.swift
//  SwiftUI_tutorial
//
//  Created by PST on 2020/01/02.
//  Copyright © 2020 PST. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    var station: StationInfo
    
    var stationIndex: Int {
        userData.stations.firstIndex(where: { $0.id == station.id})!
    }
    
    var body: some View {
        
        VStack {
            MapView(coordinate: station.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: station.image)
                .offset(y: -70)
                .padding(.bottom, -70)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(station.name)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.stations[self.stationIndex].isFavorite.toggle()
                    }) {
                        if self.userData.stations[self.stationIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }
            
                HStack {
                    Text("휠체어:  \(station.wheelChair)")
                        .font(.subheadline)
                        .padding(.trailing, 10)
                    Text("엘레베이터: \(station.elevator)")
                        .font(.subheadline)
                    Spacer()
                }
            }.padding()
            Spacer()
        }
        .navigationBarTitle(Text(station.name), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(station: stationData[0])
            .environmentObject(UserData())
    }
}
