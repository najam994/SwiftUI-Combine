//
//  ExerciseListService.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 14.11.21.
//

import Foundation
import Combine

protocol ExcerciseListServiceProtocol {
    
    func getExcersieList() -> Future<ExerciseInfo, Error>
    func getExcersieInfo(for id:Int) -> Future<Exercise, Error>
}

class ExcerciseListService: ExcerciseListServiceProtocol {
    
    func getExcersieList() -> Future<ExerciseInfo, Error> {
        return NetworkManager.shared.getRequest(method: Methods.exerciseInfo.rawValue, id: nil, limit: 20, type: ExerciseInfo.self)
    }
    
    func getExcersieInfo(for id:Int) -> Future<Exercise, Error> {
        return NetworkManager.shared.getRequest(method: Methods.exerciseInfo.rawValue, id: id, limit: 20, type: Exercise.self)
    }
}

enum Methods: String {
    case exerciseInfo = "/exerciseinfo"
}
