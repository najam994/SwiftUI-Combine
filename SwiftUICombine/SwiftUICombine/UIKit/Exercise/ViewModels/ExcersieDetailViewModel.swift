//
//  ExcersieDetailViewModel.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 15.11.21.
//

import Foundation

class ExcersieDetailViewModel: ObservableObject {
    
    @Published private(set) var exerciseObj: Exercise
    
    init(exerciseObj: Exercise) {
        self.exerciseObj = exerciseObj
    }
}
