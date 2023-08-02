//
//  HomeViewController.swift
//  Definex
//
//  Created by Murat Çiçek on 31.07.2023.
//

import UIKit

final class HomeViewController: BaseViewController {
    /// Header
    @IBOutlet private weak var headerLeadingImageBg: UIView!
    @IBOutlet private weak var headerLeadingLabel: UILabel!
    @IBOutlet private weak var headerTitleLabel: UILabel!
    /// CollectionView
    @IBOutlet private weak var collectionView: UICollectionView!
    let refreshControl = UIRefreshControl()
    lazy var viewModel = HomeViewModel(view: self)
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
}
// MARK: CollectionView
extension HomeViewController: ConfigureCollectionView {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.discoverDataModels?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let helperSection = viewModel.discoverDataModels?[section].data?.count else {return 0}
        return helperSection
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeProductCollectionViewCell = collectionView.dequeue(for: indexPath)
        cell.setupCell(data: viewModel.discoverDataModels?[indexPath.section].data?[indexPath.item])
        return cell
    }
}
// MARK: HomeViewInterface
extension HomeViewController: HomeViewInterface {
    func configureUI() {
        headerTitleLabel.configureLabel(text: "HOME".localized(),
                                        font: Fonts.shared.robotoMedium20,
                                        textColor: .black)
        headerLeadingImageBg.makeCornerRadius(radius: 100)
        headerLeadingLabel.configureLabel(text: "NA",
                                          font:  Fonts.shared.robotoMedium14,
                                          textColor: .white)
        collectionViewConfigure()
        reflessControlConfigure()
    }
    private func collectionViewConfigure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cell: HomeProductCollectionViewCell.self)
        collectionView.collectionViewLayout = createLayout()
    }
    func activityStart() {
        view.activityStartAnimating(activityColor: Colors.customBlue ?? .blue,
                                    backgroundColor: Colors.customBlue?.withAlphaComponent(0.2) ?? .blue)
    }
    func activityStop() {
        view.activityStopAnimating()
    }
    func collectionViewReload() {
        collectionView.reloadData()
    }
    private func reflessControlConfigure() {
        refreshControl.attributedTitle = NSAttributedString(string: "PULL_REFRESH".localized())
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    @objc private func refresh() {
        viewModel.getDiscoverData()
    }
    func endRefleshing() {
        refreshControl.endRefreshing()
    }
}

// MARK: Collection View Layouts
extension HomeViewController {
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [self] (sectionIndex, _) -> NSCollectionLayoutSection? in
            guard let sectionKind = viewModel.discoverDataModels?[sectionIndex].type else { return nil }
            switch sectionKind {
            case .discoverFirstHorizontalList:
                return self.createLayoutDiscoverFirstHorizontal()
            case .discoverSecondHorizontalList:
                return self.createLayoutDiscoverSecondHorizontal()
            case .discoverThirthTwoColumnList:
                return self.createLayoutDiscoverThirthTwoColumn()
            }
        }
        return layout
    }
    private func createLayoutDiscoverFirstHorizontal() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 2, bottom: 8, trailing: 2)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.40))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    private func createLayoutDiscoverSecondHorizontal() -> NSCollectionLayoutSection {
        let firstItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.30),
                                               heightDimension: .fractionalHeight(1.0)))
        firstItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 2, bottom: 8, trailing: 2)
        let firstGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(1)),
            subitem: firstItem, count: 3)
        let nestedGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(260)),
            subitems: [firstGroup])
        let section = NSCollectionLayoutSection(group: nestedGroup)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    private func createLayoutDiscoverThirthTwoColumn() -> NSCollectionLayoutSection {
        let firstItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                               heightDimension: .fractionalHeight(1.0)))
        firstItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 2, bottom: 8, trailing: 2)
        let firstGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.5)),
            subitem: firstItem, count: 2)
        let nestedGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.85)),
            subitems: [firstGroup])
        let section = NSCollectionLayoutSection(group: nestedGroup)
        return section
    }
}
// Load tabbar from storyboard with extension
extension HomeViewController: XIBInstantiable {
    static var xibName: String {
           return "HomeViewController"
    }
}
