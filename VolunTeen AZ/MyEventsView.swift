//
//  MyEventsView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct MyEventsView: View {
    var body: some View {
        ZStack {
            VStack {
                
                ScrollView {
                    
                    
                    Text("VolunTeen: Arizona")
                        .font(.largeTitle)
                        .bold()
                    
                    Image("FourBlobs")
                        .resizable()
                        .frame(width:200, height: 100)
                        .padding(.top, -20)
                    
                    
                    Text("Upcoming Events")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                        .bold()
                        .padding()
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(0..<10) {
                                Text("Event \($0)")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .frame(width: 360, height: 150)
                                    .background(Color.accentColor)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()

                    Text("All Saved")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                        .bold()
                        .padding()
                                            
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(0..<10) {
                                Text("Event \($0)")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .frame(width: 360, height: 150)
                                    .background(Color.accentColor)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                    
                    Text("Reccomended")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                        .bold()
                        .padding()
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(0..<10) {
                                Text("Event \($0)")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .frame(width: 360, height: 150)
                                    .background(Color.accentColor)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                    
                    
                    Spacer()
                }
            }
        }
    }
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView()
    }
}
