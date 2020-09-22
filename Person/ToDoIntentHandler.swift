//
//  ToDoIntentHandler.swift
//  Person
//
//  Created by kuanwei on 2020/9/22.
//  Copyright © 2020 kuanwei. All rights reserved.
//

import Foundation
import Intents

class ToDoIntentHandler: NSObject, ToDoIntentHandling {
    func handle(intent: ToDoIntent, completion: @escaping (ToDoIntentResponse) -> Void) {
        let listSize = addTODO(title: intent.title!, details: intent.detail!)
        completion(ToDoIntentResponse.success(numberOfToDos: NSNumber(value: listSize)))
    }

    func addTODO(title: String, details: String) -> Int{
        let userDefaultsKey = "todo"
        if var toDoList = UserDefaults.standard.stringArray(forKey: userDefaultsKey) {
            toDoList.append(title)
            UserDefaults.standard.set(toDoList, forKey: userDefaultsKey)
            return toDoList.count
        } else {
            let toDos = [title]
            UserDefaults.standard.set(toDos, forKey: userDefaultsKey)
            return toDos.count
        }
    }

    func resolveTitle(for intent: ToDoIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if intent.title == "title" {
            completion(INStringResolutionResult.needsValue())
        }else{
            completion(INStringResolutionResult.success(with: intent.title ?? ""))
        }
//        guard let title = intent.title else {
//            completion(INStringResolutionResult.needsValue())
//            return
//        }
//        completion(INStringResolutionResult.success(with: title))
    }

    func resolveDetail(for intent: ToDoIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if intent.detail == "detail" {
            completion(INStringResolutionResult.needsValue())
        }else{
            completion(INStringResolutionResult.success(with: intent.detail ?? ""))
        }

//        guard let details = intent.detail else {
//            completion(INStringResolutionResult.needsValue())
//            return
//        }
//        completion(INStringResolutionResult.success(with: details))
    }

    
}
