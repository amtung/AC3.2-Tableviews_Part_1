//
//  Movie.swift
//  Tableviews_Part_1
//
//  Created by Louis Tur on 9/20/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

internal struct Movie {
    
    internal var title: String
    internal var year: Int
    internal var genre: String
    internal var cast: [Actor]
    internal var locations: [String]
    internal var summary: String
    
    init(from data: [String : Any]) { //from date - external parameter name. init is a func that takes a dictionary with value of any, initializer that takes an array of string and any, then it tries to bind all the values
        
        // 1. Start by getting our property values and casting them..
        //    hint: use if let statements to check for values and cast them
        if let movieTitle: String = data["name"] as? String,
            let movieYear: Int = data["year"] as? Int,
            let movieGenre: String = data["genre"] as? String,
            let movieLocations: [String] = data["locations"] as? [String],
            let movieSynopsis: String = data["description"] as? String {
            
            self.title = movieTitle //going to be in every initializers with default values
            self.year = movieYear
            self.genre = movieGenre
            self.locations = movieLocations
            self.summary = movieSynopsis
            
            if let allActorNames: [String] = data["cast"] as? [String] { //if data of cast is a string then unwrapp and make an array of string for allActorName
                var castContainer: [Actor] = []
                
                for actorName in allActorNames {
                    castContainer.append(Actor(from: actorName))
                    
                }
                
                self.cast = castContainer
            }
            else {
                self.cast = []
            }
        }
            
        else {
            self = Movie()
        }
    }
    
    init() {
        self.title = ""
        self.year = 1970
        self.genre = ""
        self.cast = []
        self.locations = []
        self.summary = ""
    }
}
