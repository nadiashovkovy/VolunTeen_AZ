//
//  CategoryFilterView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 8/26/23.
//

import SwiftUI

struct CategoryFilterView: View {
    @Binding var categoryLabel: String
    @Binding var categoryColor: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading, 10)
                .foregroundColor(Color(.systemGray))
            Text(categoryLabel)
                .font(.subheadline)
                .foregroundColor(Color(.systemGray))
                .padding(.trailing, 10)
                .padding(.vertical, 10)
        }
        .background(Color(UIColor(named: categoryColor)!))
        .frame(maxHeight: 100)
        .clipShape(Capsule())
    }
}

struct CategoryFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFilterView(categoryLabel: .constant("Virtual"), categoryColor: .constant("MyPurple"))
    }
}
