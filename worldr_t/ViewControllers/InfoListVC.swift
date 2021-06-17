//
//  ViewController.swift
//  worldr_t
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import UIKit

class InfoListVC: UIViewController {
    
    // MARK: - API
    weak var coordinator: MainCoordinator?

    // MARK: - Properties
    private var infoListVM = InfoListVM() {
        didSet {
            infoListVM.isLoading ? BlockingScreen.start(vc: self) :             BlockingScreen.stop(vc: self)
        }
    }
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Info>?
    private let networkService = NetworkService()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setModels()
        fetchData()
    }
    
    // MARK: - Helper
    private func setUI() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = infoListVM.background
        collectionView.register(InfoListCell.self, forCellWithReuseIdentifier: InfoListCell.reuseIdentifier)
        collectionView.delegate = self
        view.addSubview(collectionView)
        title = infoListVM.title
    }
    
    private func setModels() {
        self.infoListVM = InfoListVM(isLoading: true)
    }
    
    private func fetchData() {
        networkService.fetchData { infoArray in
            DispatchQueue.main.async {
                self.infoListVM = InfoListVM(isLoading: false)
                self.createDataSource()
                self.reloadData(sections: [Section(infoArray: infoArray)])
            }
        }
    }
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Info>(collectionView: collectionView) { collectionView, indexPath, info in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoListCell.reuseIdentifier, for: indexPath) as? InfoListCell else {
                fatalError("Unable to dequeue \(InfoListCell.reuseIdentifier)")
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
            return self.createSmallTableSection(bottomInset: self.infoListVM.bottomInset, height: self.infoListVM.estimatedHeight)
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
extension InfoListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource?.itemIdentifier(for: indexPath) else { return }
        let vm = InfoDetailsVM(infoVM: InfoCellVM(info: item))
        coordinator?.open(infoDetailsVM: vm)
    }
}
