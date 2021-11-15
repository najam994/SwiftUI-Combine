//
//  ExerciseVariationViewModel.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 15.11.21.
//

import Foundation
import Combine

class ExerciseVariationViewModel: ObservableObject {
    
    @Published var exerciseInfo = Exercise()
    @Published var hasError: (Bool, String) = (false, "")
    @Published var isLoading = false
    
    private(set) var exerciseVariationId: Int
    private(set) var service: ExcerciseListServiceProtocol
    init(exerciseVariationId: Int, service: ExcerciseListServiceProtocol = ExcerciseListService()) {
        self.exerciseVariationId = exerciseVariationId
        self.service = service
    }
    
    private lazy var cancellables: [AnyCancellable] = {
        return []
    }()
    
    func getExcersieInfo() {
        self.isLoading = true
        self.service.getExcersieInfo(for: self.exerciseVariationId)
            .sink { [weak self] completion in
                switch completion{
                case .failure(let error):
                    self?.hasError = (true, error.localizedDescription)
                case .finished:
                    self?.isLoading = false
                }
            } receiveValue: { [weak self] exerciseInfo in
                self?.exerciseInfo = exerciseInfo
            }
            .store(in: &cancellables)
    }
    
    func apply(_ event: ExerciseVariationViewModelEvent) {
        switch event {
        case .onAppear, .onTryAgain:
            self.getExcersieInfo()
        }
    }
}

enum ExerciseVariationViewModelEvent {
    case onAppear
    case onTryAgain
}
