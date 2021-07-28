//
//  StartTableViewController.swift
//  InfoBook.HW_2.7
//
//  Created by User on 27.07.2021.
//

import UIKit

class StartTableViewController: UITableViewController {
    var allPeople: [Persone] = []
    
    override func viewDidLoad() {
        super .viewDidLoad()
            }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allPeople.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "startCell", for: indexPath)
        
        let person = allPeople[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = person.name + " " +  person.surname // Да-да, знаю что это грязь...)
        cell.contentConfiguration = content
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let contactVC = segue.destination as? ContactViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return }
        contactVC.info = allPeople[indexPath.row]
    }
}
