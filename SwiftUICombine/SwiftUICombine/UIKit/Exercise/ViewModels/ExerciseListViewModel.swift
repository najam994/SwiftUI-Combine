//
//  ExerciseListViewModel.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 14.11.21.
//

import Foundation
import Combine

class ExerciseListViewModel: ObservableObject {
    
    @Published private(set) var exerciseList = [Exercise]()
    @Published private(set) var hasError: (Bool, String) = (false, "")
    @Published private(set) var isLoading = false
    
    init(service: ExcersieListServiceProtocol = ExcersieListService()) {
        self.service = service
    }
    var service: ExcersieListServiceProtocol
    private var cancellables: [AnyCancellable] = []
    
    func getExcersieList() {
        self.isLoading = true
        self.service.getExcersieList()
            .sink { [weak self] completion in
                switch completion{
                case .failure(let error):
                    self?.hasError = (true, error.localizedDescription)
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
        case .onAppear:
            self.getExcersieList()
        }
    }
}

enum ExerciseListViewModelEvent {
    case onAppear
}
