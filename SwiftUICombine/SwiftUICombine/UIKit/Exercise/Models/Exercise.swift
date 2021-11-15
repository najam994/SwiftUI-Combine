//
//  Exercise.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 14.11.21.
//

import Foundation

struct ExerciseInfo: Decodable {
    var results: [Exercise]
}

struct Exercise: Decodable, Identifiable {
    var id: Int
    var name: String
    var images : [ExerciseImage]
    var variations : [Int]
}

struct ExerciseImage: Decodable, Identifiable {
    var id: Int
    var image: String
}
