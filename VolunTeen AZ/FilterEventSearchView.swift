//
//  FilterEventSearchView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/23/23.
//

import SwiftUI

struct FilterEventSearchView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Filter events based on...")
                    .font(.subheadline)
            }
            .navigationTitle("Filter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                }
            }
        }
    }}

struct FilterEventSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FilterEventSearchView()
    }
}
