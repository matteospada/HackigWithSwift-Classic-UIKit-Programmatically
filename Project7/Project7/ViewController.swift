//
//  ViewController.swift
//  Project7
//
//  Created by Matteo Spada on 23/05/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var petition = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "VC1"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here"
        
        return cell
    }


}

