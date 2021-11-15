//
//  ExerciseListViewModelTests.swift
//  SwiftUICombineTests
//
//  Created by Syed Najam on 14.11.21.
//

import XCTest
import Combine
@testable import SwiftUICombine

class ExerciseListViewModelTests: XCTestCase {
    
    private var viewModel: ExerciseListViewModel!
    private var mockService: MockExcersieListService!
    private var viewController: MockExerciseListViewController<ExerciseListViewModel>!

    override func setUp() {
        self.mockService = MockExcersieListService()
        self.viewModel = ExerciseListViewModel(service: mockService)
        self.viewController = MockExerciseListViewController(viewModel: self.viewModel)
        
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
        XCTAssertTrue(self.mockService.getExcersieListCalled)
        XCTAssertEqual(self.mockService.getExcersieListCalledCount, 1)
    }
    
    func test_ShouldGetExcerises_When_OnAppearCalled() {
        // given
        self.mockService.getExcersieListShouldReturnData = true

        // when
        self.viewController.shouldCallOnAppear()

        //then
        XCTAssertEqual(self.viewModel.exerciseList.count, 1)
    }
    
    func test_ShouldReturnError_When_OnAppearCalled() {
        // given
        self.mockService.getExcersieListShouldReturnError = true

        // when
        self.viewController.shouldCallOnAppear()

        //then
        XCTAssertEqual(self.viewModel.hasError.0, true)
    }
}
