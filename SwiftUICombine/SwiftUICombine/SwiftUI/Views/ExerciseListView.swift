//
//  ExerciseList.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 13.11.21.
//

import SwiftUI
import Kingfisher

struct ExerciseListView<ViewModel>: View where ViewModel: ExerciseListViewModel {
    
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel){
        self.viewModel = viewModel
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
        UITableView.appearance().showsVerticalScrollIndicator = true
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            List(self.viewModel.exerciseList) { exercise in
                NavigationLink {
                    ExerciseDetailView(viewModel: ExcersieDetailViewModel(exerciseObj: exercise))
                } label: {
                    ExcerciseRow(exercise: exercise)
                }
            }
            .background(Color.white)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(self.viewModel.isLoading ? 1.0 : 0.0)
        }
        .alert(isPresented: $viewModel.hasError.0) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.hasError.1),
                primaryButton: .default(
                    Text("Try Again"),
                    action: { viewModel.apply(.onTryAgain) }
                ),
                secondaryButton: .destructive(
                    Text("Cancel"),
                    action: {}
                )
            )
        }
        .onAppear {
            viewModel.apply(.onAppear)
        }
        .navigationBarTitle("Exercise Names")
    }
}

struct ExcerciseRow: View {
    var exercise: Exercise
    
    var body: some View {
        HStack{
            KFImage(URL(string: (exercise.images.first?.image ?? Urls.placeHolder.rawValue)))
                .renderingMode(.original)
                .resizable()
                .animation(.easeInOut(duration: 0.5))
                .frame(width : 60, height : 60)
            Text(exercise.name)
            Spacer()
        }
    }
}
