//
//  User.swift
//  DMNetworkingIntro
//
//  Created by David Ruvinskiy on 4/10/23.
//

import Foundation

/**
 2.1 For this project, we will be working with **only the "/users" endpoint**. The JSON you get back from this endpoint will contain many keys, but we care about only the "data" key. The value for this key is an array of several JSON objects representing fake users.
 
 Familiarize yourself with the documentation for the endpoint: https://reqres.in/api-docs/#/default/get_users. Do not move on until you until you're comfortable with the data you'll get back.
 
 2.2 Based on the JSON, create a struct called `User` that conforms to the `Codable` protocol and contains the following properties:
    - An Int `id`
    - A String `email`
    - A String `firstName`
    - A String `lastName`
    - a String `avatar`
 
 2.3 Create a separate structure called `UserResponse` that also conforms to `Codable` and contains a single `[User]` called data.
 */

struct UserResponse: Codable {
    let data: [User]
}

struct User: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
}
