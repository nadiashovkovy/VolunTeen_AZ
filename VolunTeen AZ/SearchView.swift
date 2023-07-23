//
//  SearchView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var showAddNewEventView = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Search or Add Events")
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
                .fullScreenCover(isPresented: $showAddNewEventView, content: {
                    AddNewEventView()
                })
                
                Button {
                    showAddNewEventView.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 72, height: 72)
                        .foregroundColor(Color(UIColor(named: "MyPink")!))
                        .padding(.bottom, 100)
                        
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
