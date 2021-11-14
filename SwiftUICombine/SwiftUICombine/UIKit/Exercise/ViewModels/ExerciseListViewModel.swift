//
//  ExerciseListViewModel.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 14.11.21.
//

import Foundation

enum ExerciseListViewModelEvent {
    case onAppear
}

protocol ExerciseListViewModelProtocol: ObservableObject {
    func apply(_ event: ExerciseListViewModelEvent)
}

class ExerciseListViewModel {
    
}


extension ExerciseListViewModel: ExerciseListViewModelProtocol {
    func apply(_ event: ExerciseListViewModelEvent) {
        //Send call
    }
}
