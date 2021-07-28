//
//  TabBarViewController.swift
//  InfoBook.HW_2.7
//
//  Created by User on 27.07.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
        
    var people: [Persone] = []
   private let arrayCount = DataManager.shared.emailArray.count
   
    override func viewDidLoad() {
        super .viewDidLoad()
    newValue()
    choiceVC(arrayPeople: people)
    
    }
    
    private func newValue () {
        while people.count < arrayCount {
            let newName = DataManager.shared.nameArray.remove(at: random(array: DataManager.shared.nameArray))
            let newSurname = DataManager.shared.surnameArray.remove(at: random(array: DataManager.shared.surnameArray))
            let newPhoneNumber = DataManager.shared.phoneNumberArray.remove(at: random(array: DataManager.shared.phoneNumberArray))
            let newEmail = DataManager.shared.emailArray.remove(at: random(array: DataManager.shared.emailArray))
            people.append(.init(name: newName, surname: newSurname, phoneNumber: newPhoneNumber, email: newEmail))
        }
    }
    
   private func random(array: [String]) -> Int {
        let value =  Int.random(in: array.startIndex..<array.endIndex)
    return value
    }
    
   private func choiceVC(arrayPeople: [Persone]) {
        guard let startVC = viewControllers?.first as?StartTableViewController else { return }
        guard let tableBookVC = viewControllers?.last as? TableBookViewController else { return }
        
        startVC.allPeople = arrayPeople
        tableBookVC.allPeople = arrayPeople
    }
}
