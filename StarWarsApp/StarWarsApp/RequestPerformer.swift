//
//  RequestPerformer.swift
//  StarWarsApp
//
//  Created by Alexander Ge on 8/31/18.
//  Copyright © 2018 G Dev. All rights reserved.
//

import Foundation
import Alamofire

class RequestPerformer {
    func downloadAllFilms(completion: @escaping ([Film]?) -> Void) {
        
        var films = [Film]()
        
        guard let url = URL(string: "https://swapi.co/api/films/") else {
            completion(nil)
            return
        }
        Alamofire.request(url,method: .get).validate().responseJSON { response in
            guard response.result.isSuccess, let value = response.result.value as? [String:Any] else {
                print("Error while fetching films")
                completion(nil)
                return
            }
            
            guard let filmResponses = value["results"] as? [[String:Any]] else {
                print("Error while fetching films")
                completion(nil)
                return
            }
            
            for film in filmResponses {
                if let characterURLs = film["characters"] as? [String], let title = film["title"] as? String, let director = film["director"] as? String, let producer = film["producer"] as? String, let releaseDate = film["release_date"] as? String, let openingCrawl = film["opening_crawl"] as? String {
                    self.downloadCharacterNames(characterURLs: characterURLs) { characters in
                        if let characters = characters {
                            films.append(Film(title: title, releaseDate: releaseDate, characters: characters, poster: UIImage(), directors: director, producers: producer, crawlingText: openingCrawl))
                            if films.count == filmResponses.count {
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "yyyy-MM-dd"
                                films.sort(by: { dateFormatter.date(from: $0.releaseDate)! < dateFormatter.date(from: $1.releaseDate)! })
                                completion(films)
                            }
                        } else {
                            print("Error while fetching characters")
                            completion(nil)
                            return
                        }
                    }
                } else {
                    print("Error while parsing JSON")
                    completion(nil)
                    return
                }
            }
        }
    }
    
    func downloadCharacterNames(characterURLs: [String], completion: @escaping ([String]?) -> Void) {
        var names = [String]()
        for characterURL in characterURLs {
            guard let url = URL(string: characterURL) else {
                print("Error while fetching characters")
                completion(nil)
                return
            }
            Alamofire.request(url, method: .get).validate().responseJSON { response in
                guard response.result.isSuccess, let value = response.result.value as? [String:Any] else {
                    print("Error while fetching characters")
                    completion(nil)
                    return
                }
                if let name = value["name"] as? String {
                    names.append(name)
                    if names.count == characterURLs.count {
                        completion(names)
                    }
                } else {
                    print("Error while fetching characters")
                    completion(nil)
                    return
                }
            }
        }
    }
}


