//
//  ExerciseListViewModel.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 14.11.21.
//

import Foundation
import Combine

class ExerciseListViewModel: ObservableObject {
    
    @Published var exerciseList = [Exercise]()
    @Published var isLoading = false
    @Published var hasError: (Bool, String) = (false, "")
    
    init(service: ExcerciseListServiceProtocol = ExcerciseListService()) {
        self.service = service
    }
    var service: ExcerciseListServiceProtocol
    private lazy var cancellables: [AnyCancellable] = {
        return []
    }()
    
    func getExcersieList() {
        self.isLoading = true
        self.service.getExcersieList()
            .sink { [weak self] completion in
                switch completion{
                case .failure(let error):
                    self?.hasError = (true, error.localizedDescription)
                    self?.isLoading = false
                case .finished:
                    self?.isLoading = false
                }
            } receiveValue: { [weak self] exerciseInfoList in
                self?.exerciseList = exerciseInfoList.results
            }
            .store(in: &cancellables)
    }
    
    func apply(_ event: ExerciseListViewModelEvent) {
        switch event {
        case .onAppear, .onTryAgain:
            if self.exerciseList.count == 0 {
                self.getExcersieList()
            }
        }
    }
}

enum ExerciseListViewModelEvent {
    case onAppear
    case onTryAgain
}
