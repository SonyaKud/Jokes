//
//  JokeViewController.swift
//  Joke
//
//  Created by Admin on 22.09.2024.
//

import UIKit

class JokeViewController: UIViewController {

    var presenter: JokeViewPresenterProtocol!
    
    lazy var jokeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.text = "Do you want a joke?"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        return label
    }()
    
    lazy var yesButton: UIButton = {
        let button = UIButton(primaryAction: yesAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Yes, pls", for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var yesAction = UIAction { _ in
        self.presenter?.showJoke()
        self.yesButton.setTitle("More jokes", for: .normal)
        self.noButton.setTitle("Don't need a joke", for: .normal)
        if self.noButton.isHidden == true {
            self.noButton.isHidden = false
            self.yesButton.setTitle("More jokes", for: .normal)
        }
    }
    
    lazy var noButton: UIButton = {
        let button = UIButton(primaryAction: noAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.tintColor = .black
        button.setTitle("No, t4t", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var noAction = UIAction { _ in
        self.yesButton.setTitle("Joke pls", for: .normal)
        self.jokeLabel.text = "Oookeeeyy?.. but what are you doing here?"
        self.noButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8393905189, green: 0.8011246547, blue: 0.8897317029, alpha: 1)
        
        view.addSubview(jokeLabel)
        view.addSubview(yesButton)
        view.addSubview(noButton)
        
        NSLayoutConstraint.activate([
            jokeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jokeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            jokeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jokeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            jokeLabel.heightAnchor.constraint(equalToConstant: 150),
            
            yesButton.bottomAnchor.constraint(equalTo: noButton.bottomAnchor, constant: -50),
            yesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yesButton.widthAnchor.constraint(equalToConstant: 150),
            
            noButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            noButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

extension JokeViewController: JokeViewProtocol {
    func setJoke(joke: String) {
        self.jokeLabel.text = joke
    }
}
