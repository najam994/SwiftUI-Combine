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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding SwiftUI View
        let childView = UIHostingController(rootView: ExerciseList())
        addChild(childView)
        childView.view.frame = theContainer.bounds
        theContainer.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
}
