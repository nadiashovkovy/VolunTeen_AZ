//
//  SearchBarView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/23/23.
//

import SwiftUI

struct SearchBarView: View {
    
//    @State private var searchText = ""
    @Binding var searchText: String
    let placeholder: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading)
                .foregroundColor(Color(.systemGray))
            TextField(placeholder, text: $searchText)
                .font(.system(size: 14))
                .padding()
        }
        .background(Color(UIColor(named: "MyYellow")!))
        .frame(maxHeight: 100)
        .clipShape(Capsule())
        .padding(.horizontal, 20)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""), placeholder: "Search Events In Arizona...")
    }
}
