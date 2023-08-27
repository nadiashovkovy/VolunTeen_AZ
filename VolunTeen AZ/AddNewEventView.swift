//
//  AddNewEventView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import SwiftUI

struct AddNewEventView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Share a volunteering event...")
            }
            .navigationTitle("Add a New Event")
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
    }
}

struct AddNewEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewEventView()
    }
}
