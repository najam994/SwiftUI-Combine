//
//  ExerciseVariationView.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 15.11.21.
//

import SwiftUI
import Kingfisher

struct ExerciseVariationView<ViewModel>: View where ViewModel: ExerciseVariationViewModel{
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            List {
                Text(viewModel.exerciseInfo.name)
                    .font(Font.title)
                Text(viewModel.exerciseInfo.description)
                    .font(Font.subheadline)
                ForEach(viewModel.exerciseInfo.images){ image in
                    KFImage(URL(string: (image.image)))
                        .renderingMode(.original)
                        .resizable()
                        .animation(.easeInOut(duration: 0.5))
                        .frame(width: UIScreen.main.bounds.size.width-100, height: UIScreen.main.bounds.size.width-100, alignment: .center)
                }
                
            }
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
        .onAppear{
            self.viewModel.apply(.onAppear)
        }
        .navigationTitle("Variation: \(String(viewModel.exerciseVariationId))")
    }
}

//struct ExerciseVariationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseVariationView()
//    }
//}
