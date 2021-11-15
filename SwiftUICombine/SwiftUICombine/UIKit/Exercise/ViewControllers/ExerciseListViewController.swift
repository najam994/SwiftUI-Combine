//
//  ViewController.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 10.11.21.
//

import UIKit
import SwiftUI

class ExerciseListViewController: UIViewController {
    
    @IBOutlet weak var theContainer: UIView!
    private var viewModel = ExerciseListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding SwiftUI View
//        let childView = UIHostingController(rootView: ExerciseList(viewModel: viewModel))
//        //self.addChild(childView)
//        childView.view.frame = theContainer.bounds
//        theContainer.addSubview(childView.view)
//        childView.didMove(toParent: self)
        
        self.addSwiftUIView()
        //self.presentSwiftUIView()
    }
    
    
    func addSwiftUIView() {
        let myView = ExerciseListView(viewModel: viewModel)
        let swiftUIView = NavigationView {
            myView
        }
        let hostingController = UIHostingController(rootView: swiftUIView)

        /// Add as a child of the current view controller.
        addChild(hostingController)

        /// Add the SwiftUI view to the view controller view hierarchy.
        view.addSubview(hostingController.view)

        /// Setup the constraints to update the SwiftUI view boundaries.
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
//            view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor)
        ]

        NSLayoutConstraint.activate(constraints)

        /// Notify the hosting controller that it has been moved to the current view controller.
        hostingController.didMove(toParent: self)
    }
    
}
