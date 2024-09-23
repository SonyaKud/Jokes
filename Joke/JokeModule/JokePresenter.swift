//
//  JokePresenter.swift
//  Joke
//
//  Created by Admin on 22.09.2024.
//

import Foundation

protocol JokeViewProtocol: AnyObject {
    func setJoke(joke: String)
}

protocol JokeViewPresenterProtocol: AnyObject {
    init(view: JokeViewProtocol, joke: Joke)
    func showJoke()
}

class JokePresenter: JokeViewPresenterProtocol {
    
    let view: JokeViewProtocol
    let joke: Joke
    
    private let url = "https://v2.jokeapi.dev/joke/Any?safe-mode"
    
    required init(view: JokeViewProtocol, joke: Joke) {
        self.view = view
        self.joke = joke
    }
    
    func showJoke() {
        APIManager.makeRequest(url: url) { joke in
            if joke.joke != nil {
                DispatchQueue.main.async {
                    self.view.setJoke(joke: joke.joke ?? "")
                }
            } else {
                DispatchQueue.main.async {
                    let compoundJoke = "\(joke.setup ?? "") \(joke.delivery ?? "")"
                    self.view.setJoke(joke: compoundJoke)
                }
            }
        }
    }
}
