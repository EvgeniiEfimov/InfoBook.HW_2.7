//
//  TableBookViewController.swift
//  InfoBook.HW_2.7
//
//  Created by User on 27.07.2021.
//

import UIKit

class TableBookViewController: UITableViewController {
    var allPeople: [Persone] = []


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        allPeople.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allPeople.count / 2
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        allPeople[section].name + " " + allPeople[section].surname
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
       
        let persone = allPeople[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        if indexPath.row == 0 {
            content.text = persone.phoneNumber
            content.image = UIImage(systemName: "phone")
        } else {
            content.text = persone.email
            content.image = UIImage(systemName: "mail")
        }
        cell.contentConfiguration = content
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
