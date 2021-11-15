//
//  ExerciseVariationViewModel.swift
//  SwiftUICombineTests
//
//  Created by Syed Najam on 15.11.21.
//

import XCTest
import Combine
@testable import SwiftUICombine

class ExerciseVariationViewModelTests: XCTestCase {

    private var viewModel: ExerciseVariationViewModel!
    private var mockService: MockExcersieListService!
    private var viewController: MockExerciseVariationViewController<ExerciseVariationViewModel>!

    override func setUp() {
        self.mockService = MockExcersieListService()
        self.viewModel = ExerciseVariationViewModel(exerciseVariationId: 0, service: mockService)
        self.viewController = MockExerciseVariationViewController(viewModel: self.viewModel)
        
    }

    override func tearDown() {
        self.mockService = nil
        self.viewModel = nil
        self.viewController = nil
    }

    func test_ShouldCall_getExceriseMethod_When_OnAppearCalled() {
        // given
        
        // when
        self.viewController.shouldCallOnAppear()
        
        // then
        XCTAssertTrue(self.mockService.getExcersieInfoCalled)
        XCTAssertEqual(self.mockService.getExcersieInfoCalledCount, 1)
    }
    
    func test_ShouldGetExceriseInfo_When_OnAppearCalled() {
        // given
        self.mockService.getExcersieInfoShouldReturnData = true

        // when
        self.viewController.shouldCallOnAppear()

        //then
        XCTAssertNotEqual(self.viewModel.exerciseInfo.id, 0)
    }
    
    func test_ShouldReturnError_When_OnAppearCalled() {
        // given
        self.mockService.getExcersieInfoShouldReturnError = true

        // when
        self.viewController.shouldCallOnAppear()

        //then
        XCTAssertEqual(self.viewModel.hasError.0, true)
    }
}
