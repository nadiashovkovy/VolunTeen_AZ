//
//  EventRowView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 9/3/23.
//

import SwiftUI

struct EventRowView: View {
    
let event: Event
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(UIColor(named: "MyYellow")!))
            .padding()
            .frame(maxWidth: 380, maxHeight: 200)
            .overlay(
                VStack(alignment: .leading) {
                    
                    Text(event.eventTitle)
                        .bold()
                        .font(.title3)
                    Text("Date, StartTime - endtime")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Text(event.eventDescription)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    
                    Text("Location")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()

                    HStack() {
                        Button {
                            // action
                        } label: {
                            Image(systemName: "bubble.left")
                                .foregroundColor(.black)
                        }
                        Spacer()
                        
                        Button {
                            // action
                        } label: {
                            Image(systemName: "bookmark")
                                .foregroundColor(.black)
                        }

                        Spacer()
                        
                        Button {
                            // action
                        } label: {
                            Image(systemName: "person.badge.plus")
                                .foregroundColor(.black)
                        }
                    }
                    
                }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 30)
            )
    }
}

