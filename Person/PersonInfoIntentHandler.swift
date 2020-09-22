//
//  PersonInfoIntentHandler.swift
//  Person
//
//  Created by kuanwei on 2020/9/22.
//  Copyright © 2020 kuanwei. All rights reserved.
//

import Foundation
import Intents

class PersonInfoIntentHandler: NSObject, PersonInfoIntentHandling {
    func handle(intent: PersonInfoIntent, completion: @escaping (PersonInfoIntentResponse) -> Void) {
        print(intent.firstName!)
        print(intent.lastName!)
        print(intent.companyName!)

//        completion(PersonInfoIntentResponse.success(result: "Successfully"))
        let userActivity = NSUserActivity(activityType: "com.sirilab.PersonInfo")
        completion(PersonInfoIntentResponse(code: .continueInApp, userActivity: userActivity))
    }

    func resolveFirstName(for intent: PersonInfoIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if intent.firstName == "firstName" {
            completion(INStringResolutionResult.needsValue())
        }else{
            completion(INStringResolutionResult.success(with: intent.firstName ?? ""))
        }
    }

    func resolveLastName(for intent: PersonInfoIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if intent.lastName == "lastName" {
            completion(INStringResolutionResult.needsValue())
        }else{
            completion(INStringResolutionResult.success(with: intent.lastName ?? ""))
        }
    }

    func resolveCompanyName(for intent: PersonInfoIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if intent.companyName == "companyName" {
            completion(INStringResolutionResult.needsValue())
        } else{
            completion(INStringResolutionResult.success(with: intent.companyName ?? ""))
        }
    }
}
