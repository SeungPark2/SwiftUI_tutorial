//
//  CircleImage.swift
//  SwiftUI_tutorial
//
//  Created by PST on 2020/01/02.
//  Copyright © 2020 PST. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 7))
            .shadow(radius: 10)
            
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("two"))
    }
}
