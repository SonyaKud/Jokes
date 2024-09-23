//
//  APIManager.swift
//  Joke
//
//  Created by Admin on 22.09.2024.
//

import Foundation

class APIManager {
    
    static func makeRequest(url: String, complition: @escaping (_ joke: Joke) -> ()) {
        
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let joke = try? JSONDecoder().decode(Joke.self, from: data) {
                complition(joke)
            }
        }
        task.resume()
    }
}
