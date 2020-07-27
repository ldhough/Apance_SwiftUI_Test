//
//  Artist.swift
//  ApanceListDemo
//
//  Created by Lannie Hough on 7/26/20.
//  Copyright © 2020 Lannie Hough. All rights reserved.
//

import Foundation
import CoreData

//Object represents important information about an artist
struct Artist: Identifiable {
    let id:UUID = UUID()
    let name:String
    let birthYear:String
    let birthCity:String
    let birthCountry:String
}

//View model has methods that manipulate the artist data model
class ArtistViewModel: ObservableObject {
    
    @Published var artists:[Artist] = [
        Artist(name: "Vincent Van Gogh", birthYear: "1853", birthCity: "Zundert", birthCountry: "The Netherlands"),
        Artist(name: "Pablo Picasso", birthYear: "1881", birthCity: "Malaga", birthCountry: "Spain"),
        Artist(name: "Takashi Murakami", birthYear: "1962", birthCity: "Tokyo", birthCountry: "Japan"),
        Artist(name: "Claude Monet", birthYear: "1840", birthCity: "Paris", birthCountry: "France"),
        Artist(name: "Utamaro", birthYear: "1736", birthCity: "Edo", birthCountry: "Japan"),
        Artist(name: "Frida Kahlo", birthYear: "1907", birthCity: "Mexico City", birthCountry: "Mexico"),
        Artist(name: "Georgia O’Keeffe", birthYear: "1887", birthCity: "Sun Prairie", birthCountry: "United States"),
        Artist(name: "Hokusai", birthYear: "1760", birthCity: "Edo", birthCountry: "Japan"),
        Artist(name: "Paul Gauguin", birthYear: "1848", birthCity: "Paris", birthCountry: "France"),
        Artist(name: "Jean-Michel Basquiat", birthYear: "1960", birthCity: "Brooklyn", birthCountry: "United States"),
        Artist(name: "James Jean", birthYear: "1979", birthCity: "Taipei", birthCountry: "Taiwan")
    ]
    
    func deleteArtist(offsets: IndexSet) {
        self.artists.remove(atOffsets: offsets)
    }

    func moveArtist(source: IndexSet, destination: Int) {
        self.artists.move(fromOffsets: source, toOffset: destination)
    }
    
    func addArtist(_ name: String, _ birthYear: String, _ birthCity: String, _ birthCountry: String) {
        let artist = Artist(name: name, birthYear: birthYear, birthCity: birthCity, birthCountry: birthCountry)
        self.artists.append(artist)
    }
    
}
