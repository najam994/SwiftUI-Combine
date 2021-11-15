//
//  MockExerciseVariationViewController.swift
//  SwiftUICombineTests
//
//  Created by Syed Najam on 15.11.21.
//

import Foundation
@testable import SwiftUICombine

class MockExerciseVariationViewController<ViewModel> where ViewModel: ExerciseVariationViewModel  {
    
    var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    func shouldCallOnAppear() {
        self.viewModel.apply(.onAppear)
    }
    
}
