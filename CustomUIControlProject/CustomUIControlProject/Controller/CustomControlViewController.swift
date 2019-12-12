//
//  CustomControlViewController.swift
//  CustomUIControlProject
//
//  Created by Chad Rutherford on 12/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import SwiftUI
import UIKit

class CustomControlViewController: UIViewController {
    
    let control: CustomControl = {
        let control = CustomControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(updateRating(_:)), for: .valueChanged)
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(control)
        NSLayoutConstraint.activate([
            control.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            control.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    @objc func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            title = "User Rating: \(ratingControl.value) star"
        } else {
            title = "User Rating: \(ratingControl.value) stars"
        }
    }
}


struct CustomControlPreview: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func updateUIViewController(_ uiViewController: CustomControlPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<CustomControlPreview.ContainerView>) {
            
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<CustomControlPreview.ContainerView>) -> UIViewController {
            return UINavigationController(rootViewController: CustomControlViewController())
        }
    }
}
