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
        List(self.viewModel.exerciseList) { exercise in
            NavigationLink {
                
            } label: {
                ExcerciseRow(exercise: exercise)
            }
        }
        .background(Color.white)
        .onAppear {
            viewModel.apply(.onAppear)
        }.navigationBarTitle("Exercise Names")
    }
}

struct ExcerciseRow: View {
    var exercise: Exercise
    
    var body: some View {
        HStack{
            KFImage(URL(string: (exercise.images.first?.image ?? "https://wger.de/media/exercise-images/113/Walking-lunges-1.png")))
                .renderingMode(.original)
                .resizable()
                .animation(.easeInOut(duration: 0.5)) // Animation Duration
                .frame(width : 60, height : 60)
            Text(exercise.name)
            Spacer()
        }
    }
}

struct ExerciseList_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView(viewModel: ExerciseListViewModel())
    }
}
