//
//  MockExerciseListViewController.swift
//  SwiftUICombineTests
//
//  Created by Syed Najam on 14.11.21.
//

import Foundation
@testable import SwiftUICombine

class MockExerciseListViewController<ViewModel> where ViewModel: ExerciseListViewModel  {
    
    var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    func shouldCallOnAppear() {
        self.viewModel.apply(.onAppear)
    }
    
}

