//
//  SmallTableCell.swift
//  TapStore
//
//  Created by Paul Hudson on 01/10/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class InfoCell: UICollectionViewCell {
    
    // MARK: - API
    static let reuseIdentifier = "InfoCell"
    
    var vm: InfoCellVM? {
        willSet {
            updateUI(vm: newValue)
        }
    }
    
    // MARK: - Properties
    private let name = UILabel()
    private let infoImageView = InfoImageView(image: nil)

    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("not supported...")
    }
    
    // MARK: - Overrides
    override func prepareForReuse() {
        super.prepareForReuse()
        
        infoImageView.cancelImageDownload()
    }
    
    // MARK: - Helper
    private func updateUI(vm: InfoCellVM?) {
        guard let vm = vm else { return }
        
        name.font = vm.textFont
        name.textColor = vm.textColor
        name.numberOfLines = vm.numberOfLines
        
        name.text = vm.text
        infoImageView.image = vm.placeHolderImage
        infoImageView.isHidden = vm.isImageHidden

        if let url = vm.urlString {
            infoImageView.vm = InfoImageVM(imageUrlString: url)
        }
        
        setLayout(vm: vm, imageView: infoImageView, name: name)
    }
    
    private func setLayout(vm: InfoCellVM, imageView: InfoImageView, name: UILabel) {
        let stackView = UIStackView(arrangedSubviews: [imageView, name])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = vm.spacing
        contentView.addSubview(stackView)
        contentView.backgroundColor = vm.backgroundColor
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: vm.imageWidth),
            imageView.heightAnchor.constraint(equalToConstant: vm.imageHeight),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: vm.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: vm.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
