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
                Text("Only show me events that are...")
                    .font(.subheadline)
                    .padding(.bottom, 20)
                
                VStack(spacing: 20) {
                    HStack(spacing: 10) {
                        CategoryFilterView(categoryLabel: .constant("Virtual"), categoryColor: .constant("MyPurple"))
                        
                        CategoryFilterView(categoryLabel: .constant("Near Me"), categoryColor: .constant("MyPink"))
                    }
                    
                    HStack(spacing: 10) {
                        CategoryFilterView(categoryLabel: .constant("Today"), categoryColor: .constant("MyYellow"))
                        
                        CategoryFilterView(categoryLabel: .constant("Tomorrow"), categoryColor: .constant("MyBlue"))
                        
                        CategoryFilterView(categoryLabel: .constant("Any time"), categoryColor: .constant("MyPurple"))
                    }
                    
                    HStack(spacing: 10) {
                        CategoryFilterView(categoryLabel: .constant("Reoccuring"), categoryColor: .constant("MyPink"))
                        
                        CategoryFilterView(categoryLabel: .constant("One time"), categoryColor: .constant("MyYellow"))
                    }
                    HStack(spacing: 10) {
                        CategoryFilterView(categoryLabel: .constant("Less than 1 hour"), categoryColor: .constant("MyBlue"))
                        
                        CategoryFilterView(categoryLabel: .constant("Longer than 1 hour"), categoryColor: .constant("MyPurple"))
                        
                    }
                    
                    HStack(spacing: 10) {
                        CategoryFilterView(categoryLabel: .constant("Group"), categoryColor: .constant("MyPink"))
                        
                        CategoryFilterView(categoryLabel: .constant("Individual"), categoryColor: .constant("MyYellow"))
                        
                    }
                }
                .padding(.bottom, 100)
                
                Image("TwoBlobs")
                    .resizable()
                    .frame(width:200, height: 200)
                    .padding(-20)
                
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
