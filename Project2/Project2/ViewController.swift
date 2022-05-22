//
//  ViewController.swift
//  Project2
//
//  Created by Matteo Spada on 22/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    var button1 = UIButton()
    var button2 = UIButton()
    var button3 = UIButton()
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var counter = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        setup()
        askQuestion()

        // Do any additional setup after loading the view.
    }
    
    func askQuestion(sender: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    func restart(sender: UIAlertAction! = nil) {
        counter = 0
        score = 0
        askQuestion()
    }
    

    func setup() {
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        button1.addTarget(self, action: #selector(flagTapped(_:)), for: .primaryActionTriggered)
        button2.addTarget(self, action: #selector(flagTapped(_:)), for: .primaryActionTriggered)
        button3.addTarget(self, action: #selector(flagTapped(_:)), for: .primaryActionTriggered)
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.tag = 0
        button2.tag = 1
        button3.tag = 2
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        NSLayoutConstraint.activate([
            
            button1.heightAnchor.constraint(equalToConstant: 100),
            button2.heightAnchor.constraint(equalToConstant: 100),
            button3.heightAnchor.constraint(equalToConstant: 100),
            
            button1.widthAnchor.constraint(equalToConstant: 200),
            button2.widthAnchor.constraint(equalToConstant: 200),
            button3.widthAnchor.constraint(equalToConstant: 200),
            
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 24),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 24)
        ])
        
        
        
        
    }
    
    
    @objc func flagTapped(_ sender: UIButton) {
        
        counter += 1
        var message = ""
        
        if sender.tag == correctAnswer {
            score += 1
            title = "Score: \(score)"
            message = "Correct answer! Your score is: \(score)"
        } else {
            score -= 1
            title = "Score: \(score)"
            message = "Wrong answer! That’s the flag of \(countries[sender.tag]).\nYour score is: \(score)"
        }
        
        var ac = UIAlertController()
        
        if counter != 10 {
            ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        } else {
            ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
        }
        
        present(ac, animated: true)
        
        
    }
    
}

