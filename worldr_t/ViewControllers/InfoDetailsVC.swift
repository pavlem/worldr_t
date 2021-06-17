//
//  InfoDetailsVC.swift
//  worldr_t
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import UIKit

class InfoDetailsVC: UIViewController {
    
    // MARK: - API
    weak var coordinator: MainCoordinator?
        
    var vm: InfoDetailsVM?

    // MARK: - Properties
    private var textView = UITextView(frame: .zero, textContainer: nil)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI(vm: vm)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.layoutSubviews()
        textView.isScrollEnabled = true
    }
    
    // MARK: - Private
    private func setUI(vm: InfoDetailsVM?) {
        guard let vm = vm else { return }
        
        view.backgroundColor = vm.backgroundColor
                
        textView.isScrollEnabled = false // causes expanding of the height
        textView.text = vm.text
        textView.font = vm.textFont
        textView.textColor = vm.textColor
        textView.isEditable = vm.isEditable
        textView.backgroundColor = vm.textBackgroundColor
        
        let imageView = InfoImageView(image: nil)
        if let imageURL = vm.imageUrl {
            imageView.vm = InfoImageVM(imageUrlString: imageURL)
        } else {
            imageView.isHidden = true
        }
        imageView.contentMode = .scaleAspectFill

        let stackView = UIStackView()
        stackView.axis  = .vertical
        stackView.alignment = .center
        stackView.spacing = vm.spacing
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // Auto Layout
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: vm.imageHeight),
            imageView.widthAnchor.constraint(equalToConstant: vm.imageWidth),
            
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: vm.leadingPadding),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: vm.trailingPadding),
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: vm.topPadding),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: vm.bottomPadding)
        ])
    }
}
