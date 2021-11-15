//
//  ExerciseDetailView.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 15.11.21.
//

import SwiftUI
import Kingfisher

struct ExerciseDetailView<ViewModel>: View where ViewModel: ExcersieDetailViewModel {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List {
            Text(viewModel.exerciseObj.name)
                .font(Font.title)
            Section(content: {
                ForEach(self.viewModel.exerciseObj.images){ image in
                    KFImage(URL(string: (image.image)))
                        .renderingMode(.original)
                        .resizable()
                        .animation(.easeInOut(duration: 0.5))
                        .frame(width: UIScreen.main.bounds.size.width-100, height: UIScreen.main.bounds.size.width-100, alignment: .center)
                }
            }, header: {
                CustomHeader(name: "Images")
            })
            Section(content: {
                ForEach(self.viewModel.exerciseObj.images){ image in
                    ForEach(self.viewModel.exerciseObj.variations, id : \.self) { variation in
                        NavigationLink {
                            ExerciseVariationView(viewModel: ExerciseVariationViewModel(exerciseVariationId: variation))
                        } label: {
                            Text("Variation Code: \(String(variation))")
                        }
                    }
                }
            }, header: {
                CustomHeader(name: "Variations")
            })
        }.navigationTitle("Details")
    }
}

struct CustomHeader: View {
    let name: String
    
    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.25))
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .overlay(
                Text(name)
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.horizontal), // You need this to add back the padding
                alignment: .leading
            ).cornerRadius(8.0)
    }
}
