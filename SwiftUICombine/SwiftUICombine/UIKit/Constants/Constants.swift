//
//  Constants.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 14.11.21.
//

import Foundation

class Constants {
    
    static let shared = Constants()
    private init() { }
}

enum RestApiUrls: String {
    case baseUrl = "https://wger.de/api/v2/"
}

enum Urls: String {
    case placeHolder = "https://wger.de/media/exercise-images/113/Walking-lunges-1.png"
}
