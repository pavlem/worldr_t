//
//  ViewController.swift
//  worldr_t
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import UIKit

class InfoVC: UIViewController {
    
    // MARK: - API
    weak var coordinator: MainCoordinator?
    
    // MARK: - Properties
    private var vm = InfoVM()
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Info>?
    private let service = Service()
    private var infos = [Info]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()

        service.fetchData { infoArray in
            infos = infoArray
            createDataSource()
            reloadData(sections: [Section(infoArray: infoArray)])
        }
    }
    
    // MARK: - Helper
    private func setUI() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = vm.background
        view.addSubview(collectionView)
        collectionView.register(InfoCell.self, forCellWithReuseIdentifier: InfoCell.reuseIdentifier)
        title = vm.title
        
        collectionView.delegate = self
    }
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Info>(collectionView: collectionView) { collectionView, indexPath, info in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCell.reuseIdentifier, for: indexPath) as? InfoCell else {
                fatalError("Unable to dequeue \(InfoCell.reuseIdentifier)")
            }
            
            cell.vm = InfoCellVM(info: info)
            return cell
        }
    }
    
    private func reloadData(sections: [Section]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Info>()
        snapshot.appendSections(sections)

        for section in sections {
            snapshot.appendItems(section.infoArray, toSection: section)
        }

        dataSource?.apply(snapshot)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return self.createSmallTableSection(bottomInset: self.vm.bottomInset, height: self.vm.estimatedHeight)
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        layout.configuration = config
        return layout
    }

    private func createSmallTableSection(bottomInset: CGFloat, height: CGFloat) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: bottomInset, trailing: 0)

        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(height))

        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)

        return layoutSection
    }
}

// MARK: - UICollectionViewDelegate
extension InfoVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vm = InfoDetailsVM(infoVM: InfoCellVM(info: infos[indexPath.row]))
        
        coordinator?.open(infoDetailsVM: vm)
    }
}
