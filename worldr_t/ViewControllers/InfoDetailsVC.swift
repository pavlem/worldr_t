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

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI(vm: vm)
    }

    // MARK: - Private
    private func setUI(vm: InfoDetailsVM?) {
        guard let vm = vm else { return }
        
        view.backgroundColor = vm.backgroundColor

        let imageView = InfoImageView(image: nil)
        if let imageURL = vm.imageUrl {
            imageView.vm = InfoImageVM(imageUrlString: imageURL)
        } else {
            imageView.isHidden = true
        }
        imageView.contentMode = .scaleAspectFill
        
        let textLabel = UILabel()
        textLabel.font = vm.textFont
        textLabel.textColor = vm.textColor
        textLabel.text  = vm.text
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center

        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.alignment = .center
        stackView.spacing = vm.spacing
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        imageView.heightAnchor.constraint(equalToConstant: vm.imageHeight).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: vm.imageWidth).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: view.frame.width - vm.textPadding * 2).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
