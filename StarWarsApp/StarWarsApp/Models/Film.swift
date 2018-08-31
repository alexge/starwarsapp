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
    let releaseDate: String
    let characters: [String]
    let poster: UIImage
    let directors: String
    let producers: String
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
}

