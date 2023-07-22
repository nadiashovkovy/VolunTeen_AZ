//
//  MapView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("My Location")
                    .font(.largeTitle)
                    .bold()
                
                Image("LeafBlob")
                    .resizable()
                    .frame(width:100, height: 100)
                    .padding(-20)
                
                Spacer()
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
