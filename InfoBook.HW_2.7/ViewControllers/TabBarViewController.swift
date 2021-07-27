//
//  TabBarViewController.swift
//  InfoBook.HW_2.7
//
//  Created by User on 27.07.2021.
//

import UIKit

var dataPeople: DataManager!
var people: [Persone]!

class TabBarViewController: UITabBarController {

    func newValue (dataPeople: DataManager!) -> [Persone] {
        guard let valueDataManager = dataPeople else { return [] }
        if valueDataManager.emailArray.count != 0 {
        let newName = valueDataManager.nameArray.remove(at: random(array: valueDataManager.nameArray))
        let newSurname = valueDataManager.surnameArray.remove(at: random(array: valueDataManager.surnameArray))
        let newPhoneNumber = valueDataManager.phoneNumberArray.remove(at: random(array: valueDataManager.phoneNumberArray))
            let newEmail = valueDataManager.emailArray.remove(at: random(array: valueDataManager.emailArray))
        people.insert(.init(name: newName, surname: newSurname, phoneNumber: newPhoneNumber, email: newEmail), at: people.endIndex)
        }
    return people
    }
    
    func random(array: [String]) -> Int {
        let value =  Int.random(in: array.startIndex...array.endIndex)
  return value
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        for viewController in viewControllers {
            if let startController = viewController as? StartTableViewController {
                startController.allPeople = newValue(dataPeople: dataPeople)
            } else if let tableVC = viewController as? TableBookViewController {
                tableVC.allPeople = newValue(dataPeople: dataPeople)
            }
        }
//        guard let startTableVC = tabBarVC as? StartTableViewController else { return }
        
    }
}
