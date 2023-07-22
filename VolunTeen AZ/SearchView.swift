//
//  SearchView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            VStack {
                Text("Search Events")
                    .font(.largeTitle)
                    .bold()
                
                Image("SpeakerBlob")
                    .resizable()
                    .frame(width:100, height: 100)
                    .padding(-20)
                
                NavigationStack {
                    Text("Searching for \(searchText)")
                }
                .searchable(text: $searchText)
                
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
