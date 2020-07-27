//
//  AddArtistView.swift
//  ApanceListDemo
//
//  Created by Lannie Hough on 7/26/20.
//  Copyright © 2020 Lannie Hough. All rights reserved.
//

import SwiftUI

//Used in modal view, provides text fields that prompt the user to enter artist information that is then used in the list.  If not all information is input, presents an error message as Alert view
struct AddArtistView: View {
    
    @ObservedObject var viewModel:ArtistViewModel
    @State var artistName:String = ""
    @State var birthYear:String = ""
    @State var birthCity:String = ""
    @State var birthCountry:String = ""
    @Binding var isPresented:Bool
    
    @State var invalidAlert:Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Add new artist").padding().font(.title)
                Spacer()
            }
            Divider()
            TextField("Enter artist name...", text: $artistName).padding()
            TextField("Enter year of birth...", text: $birthYear).padding()
            TextField("Enter city of birth...", text: $birthCity).padding()
            TextField("Enter country of birth...", text: $birthCountry).padding()
            Spacer()
            Button(action: {
                if (self.artistName == "" || self.birthYear == "" || self.birthCity == "" || self.birthCountry == "") {
                    self.invalidAlert.toggle()
                } else {
                    self.viewModel.addArtist(self.artistName, self.birthYear, self.birthCity, self.birthCountry)
                    self.isPresented.toggle()
                }
            }) {
                Text("Submit")
            }.alert(isPresented: $invalidAlert) {
                Alert(title: Text("Error!"), message: Text("Complete all fields!"), dismissButton: .default(Text("Dismiss")))
            }
        }
    }
}
