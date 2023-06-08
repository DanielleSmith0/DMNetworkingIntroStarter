//
//  DMError.swift
//  DMNetworkingIntro
//
//  Created by David Ruvinskiy on 4/13/23.
//

import Foundation

enum DMError: String, Error {
    case invalidURL = "There was an issue connecting to the server."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidData = "The data received from the server was invalid. Please try again."
}
