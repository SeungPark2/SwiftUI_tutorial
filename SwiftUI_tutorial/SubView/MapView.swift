//
//  MapView.swift
//  SwiftUI_tutorial
//
//  Created by PST on 2020/01/02.
//  Copyright © 2020 PST. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    //UIViewRepresentable: makeUIView, updateUIView를 override해야함
    
    // MKMapView를 생성하는 메서드
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // view를 구성하며 어떠한 변화에 대해 응답하는 메서드
    func updateUIView(_ uiView: MKMapView, context: Context) {
    
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: stationData[0].locationCoordinate)
    }
}
