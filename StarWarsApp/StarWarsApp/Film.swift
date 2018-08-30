//
//  Film.swift
//  StarWarsApp
//
//  Created by Alexander Ge on 8/30/18.
//  Copyright © 2018 G Dev. All rights reserved.
//

import Foundation
import UIKit

struct Film {
    let title: String
    let releaseDate: Date
    let characters: [String]
    let poster: UIImage
    let directors: [String]
    let producers: [String]
    let crawlingText: String
}

extension Film {
    func characterString() -> String {
        var characterString = characters[0]
        if characters.count > 1 {
            for character in characters[1...] {
                characterString.append(", \(character)")
            }
        }
        return characterString
    }
    
    func directorString() -> String {
        var directorString = directors[0]
        if directors.count > 1 {
            for director in directors[1...] {
                directorString.append(", \(director)")
            }
        }
        return directorString
    }
    
    func producerString() -> String {
        var producerString = producers[0]
        if producers.count > 1 {
            for producer in producers[1...] {
                producerString.append(", \(producer)")
            }
        }
        return producerString
    }
    
}
