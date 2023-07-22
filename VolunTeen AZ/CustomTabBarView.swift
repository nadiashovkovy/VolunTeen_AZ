//
//  CustomTabBarView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct CustomTabBarView: View {
    @State var selectedIndex = 0
    
    let icons = [
        "list.dash",
        "map",
        "magnifyingglass",
        "message",
        "person"
    ]
    
    var body: some View {
        VStack {
            //content
            ZStack {
                Spacer()
                switch selectedIndex {
                    
                case 0:
                    MyEventsView()
                case 1:
                    MapView()
                case 2:
                    SearchView()
                case 3:
                    ContactView()
                default:
                    ProfileView()
                    
                }
            }
            
            Spacer()
            
//            Divider()
            HStack {
                
                ForEach(0..<5, id: \.self) { number in
                    
                    Spacer()
                    
                     Button(action: {
                        self.selectedIndex = number
                    }, label: {
                        if number == 2 {
                            
                            ZStack {
                                
                                Image(systemName: icons[number])
                                    .font(.system(
                                        size: 35,
                                        weight: .regular,
                                        design: .default))
                                
                            }
                                .padding(15)
                                .frame(width: 75, height: 75)
                                .foregroundColor(.white)
                                .background(Color.accentColor)
                                .cornerRadius(45)
                                .frame(height: 45)
                        }
                        else {
                            Image(systemName: icons[number])
                                .font(.system(size: 28,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(selectedIndex == number ? .accentColor : Color(UIColor.lightGray))
                        }
                    }
                     )
                    Spacer()
                }
            }

        }
        .background(Color.white)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
