//
//  ArtistListView.swift
//  ApanceListDemo
//
//  Created by Lannie Hough on 7/26/20.
//  Copyright © 2020 Lannie Hough. All rights reserved.
//

import SwiftUI

//List view that implements list editor functions and calls the appropriate view model functions to reorder the list
struct ArtistListView: View {
    
    @ObservedObject var viewModel:ArtistViewModel
    @State private var editMode = EditMode.inactive
    @State var addArtist:Bool = false
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(self.viewModel.artists) { artist in
                        VStack(alignment: .leading) {
                            ArtistCellView(artist: artist)
                        }
                    }
                    .onDelete(perform: viewModel.deleteArtist)
                    .onMove(perform: viewModel.moveArtist)
                }
                .navigationBarTitle("Artists")
                .navigationBarItems(leading: EditButton(), trailing: addArtistButton())
                .environment(\.editMode, $editMode)
            }
        }
    }
    
    //Function returns button that prompts a modal view for inputting information to add an artist to the list
    func addArtistButton() -> some View {
        return Group {
            if self.editMode == .inactive {
                Button(action: {
                    self.addArtist.toggle()
                }) {
                    Text("Add Artist")
                    Image(systemName: "plus")
                }.sheet(isPresented: $addArtist) {
                    AddArtistView(viewModel: self.viewModel, isPresented: self.$addArtist)
                }
            } else {
                EmptyView()
            }
        }
    }
    
}

//View to provide information in list cells about an artist
struct ArtistCellView: View {
    
    let artist:Artist
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(artist.name)
            Text(artist.birthCity + ", " + artist.birthCountry).font(.system(size: 12, weight: .light))
            Text("Born " + artist.birthYear).font(.system(size: 12, weight: .light))
        }
    }
    
}
