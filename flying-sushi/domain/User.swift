//
//  File.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 09/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//
import Foundation

class User {
    var uid: String
    var email: String?
    var displayName: String?
    

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }

}
