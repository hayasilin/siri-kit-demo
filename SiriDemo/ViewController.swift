//
//  ViewController.swift
//  SiriDemo
//
//  Created by kuanwei on 2020/9/22.
//  Copyright © 2020 kuanwei. All rights reserved.
//

import UIKit
import Intents
import Intents
import CoreSpotlight
import MobileCoreServices

public let kActivityType = "com.sirilab.PersonInfo"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white

        let actionBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionBarButtonTapped))
        navigationItem.rightBarButtonItem = actionBarButtonItem

        donateInteraction()
        donateIntent()

//        let userDefaultsKey = "todo"
//        guard let defaults = UserDefaults(suiteName: "com.sirilab.TheBurgeoningWriter.Person") else {
//            return
//        }
//        let toDoList = defaults.stringArray(forKey: userDefaultsKey)
//
//        print(toDoList)
    }

    @objc func actionBarButtonTapped(_ sender: UIBarButtonItem) {
        print(#function)
        let activity = NSUserActivity(activityType: kActivityType)
        activity.persistentIdentifier =
          NSUserActivityPersistentIdentifier(kActivityType)

        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true

        let attributes = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        activity.title = "Write a new article"
        attributes.contentDescription = "Get those creative juices flowing!"
        activity.suggestedInvocationPhrase = "Time to write!"

        activity.contentAttributeSet = attributes

        let vc = DetailViewController()
        vc.userActivity = activity

        activity.becomeCurrent()

        navigationController?.pushViewController(vc, animated: true)
    }

    func donateInteraction(){

        let intent = PersonInfoIntent()
        intent.suggestedInvocationPhrase = "Add person Info"
        intent.firstName = "firstName"
        intent.lastName = "lastName"
        intent.companyName = "companyName"
        let interaction = INInteraction(intent: intent, response: nil)

        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("Interaction donation failed: \(error.description)")
                } else {
                    print("Successfully donated interaction")
                }
            } else {
                print("Successfully donated interaction")
            }
        }
    }

    private func donateIntent(){
        let intent = ToDoIntent()
        intent.title = "title"
        intent.detail = "detail"
        intent.suggestedInvocationPhrase = "Add New To Do"
        let interaction = INInteraction(intent: intent, response: nil)

        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("Interaction donation failed: \(error.description)")
                } else {
                    print("Successfully donated interaction")
                }
            } else {
                print("Successfully donated interaction")
            }
        }
    }

    func setShortcut(activityType: String, title: String, contentDescription: String, suggestedInvocationPhrase: String) -> NSUserActivity {
        let activity = NSUserActivity(activityType: activityType)
        activity.persistentIdentifier = NSUserActivityPersistentIdentifier(activityType)

        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true

        let attributes = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        activity.title = title
        attributes.contentDescription = contentDescription
        activity.suggestedInvocationPhrase = suggestedInvocationPhrase
        activity.contentAttributeSet = attributes

        return activity
    }
}
