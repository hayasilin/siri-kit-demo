//
//  IntentHandler.swift
//  Person
//
//  Created by kuanwei on 2020/9/22.
//  Copyright © 2020 kuanwei. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        switch intent {
        case is PersonInfoIntent: return PersonInfoIntentHandler()
        case is ToDoIntent: return ToDoIntentHandler()
        default: return self
        }
    }
    
}
