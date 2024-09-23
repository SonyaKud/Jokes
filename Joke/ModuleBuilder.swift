//
//  ModuleBuilder.swift
//  Joke
//
//  Created by Admin on 22.09.2024.
//

import UIKit

protocol Builder {
    static func creatrJokeVC() -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func creatrJokeVC() -> UIViewController {
        let model = Joke(joke: "1", setup: "2", delivery: "3")
        let view = JokeViewController()
        let presenter = JokePresenter(view: view, joke: model)
        view.presenter = presenter
        return view
    }
}
