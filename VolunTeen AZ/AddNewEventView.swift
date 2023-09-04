//
//  AddNewEventView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import SwiftUI

struct AddNewEventView: View {
    @State private var eventTitle = ""
    @State private var eventDescription = ""
    @State private var eventDate = ""
    @State private var eventStartTime = ""
    @State private var eventEndTime = ""
    @State private var eventLocation = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Share a volunteering event...")
                    
                    //form fields
                    VStack(spacing: 24) {
                        InputView(text: $eventTitle,
                                  title: "Event Title:",
                                  placeholder: "Ex: 'Picking up trash in the neighorhood' ")
                        .autocapitalization(.words)
                        
                        InputView(text: $eventDescription,
                                  title: "Event Description:",
                                  placeholder: "Describe specific instructions and requirements for volunteers.")
                        .autocapitalization(.sentences)
                        
                        InputView(text: $eventDate,
                                  title: "Event Date:",
                                  placeholder: "Ex: 'August 12th, 2023' ")
                        
                        InputView(text: $eventStartTime,
                                  title: "Event Start Time:",
                                  placeholder: "Enter the start time for this event")
                        
                        InputView(text: $eventEndTime,
                                  title: "Event End Time:",
                                  placeholder: "Enter the end time for this event")
                        
                        InputView(text: $eventLocation,
                                  title: "Event Location/Address:",
                                  placeholder: "Ex: 'Layton Lakes Neighborhood' OR 'Virtual'")
                        .autocapitalization(.words)
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    // add the event button
                    
                    Button {
                        viewModel.uploadEvent(withEventTitle: eventTitle, eventDescription: eventDescription, eventDate: eventDate, eventStartTime: eventStartTime, eventEndTime: eventEndTime, eventLocation: eventLocation)
                    } label: {
                        HStack {
                            Text("UPLOAD")
                                .fontWeight(.semibold)
                            Image(systemName: "plus")
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color.accentColor)
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.7)
                    .cornerRadius(10)
                    .padding(.top, 24)
                    
                    Spacer()
                    
                }
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
        .onReceive(viewModel.$didUploadEvent) { success in
            if success {
                dismiss()
            }
        }
        
    }
}


// Mark: AuthenticationFormProtocol

extension AddNewEventView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !eventTitle.isEmpty
        && !eventDescription.isEmpty
        && !eventStartTime.isEmpty
        && !eventEndTime.isEmpty
        && !eventLocation.isEmpty
    }
}


struct AddNewEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewEventView()
    }
}
