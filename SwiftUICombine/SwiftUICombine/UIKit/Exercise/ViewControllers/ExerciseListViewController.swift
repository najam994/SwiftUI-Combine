//
//  ViewController.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 10.11.21.
//

import UIKit
import SwiftUI

class ExerciseListViewController: UIViewController {
    // Can also be injected from starting point
    private var viewModel = ExerciseListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addSwiftUIView()
    }
    
    
    private func addSwiftUIView() {
        let swiftUIView = NavigationView {
            ExerciseListView(viewModel: viewModel)
        }
        let hostingController = UIHostingController(rootView: swiftUIView)
        addChild(hostingController)
        view.addSubview(hostingController.view)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)

        hostingController.didMove(toParent: self)
    }
}
