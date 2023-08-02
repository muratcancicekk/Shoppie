//
//  HomeViewModel.swift
//  Definex
//
//  Created by Murat Çiçek on 31.07.2023.
//
// swiftlint:disable identifier_name


import Foundation

enum HomeHelperEnum {
    case discoverFirstHorizontalList
    case discoverSecondHorizontalList
    case discoverThirthTwoColumnList
}

struct HomeHelper {
    let type: HomeHelperEnum
    let data: [DiscoverModel.DiscoverListData]?
}

final class HomeViewModel {
    weak var view: HomeViewInterface?
    var discoverDataModels: [HomeHelper]? = []

    init(view: HomeViewInterface?) {
        self.view = view
    }
}
extension HomeViewModel: HomeViewModelInterface {
    func getDiscoverData() {
        view?.activityStart()
        discoverDataModels?.removeAll()
        view?.collectionViewReload()
        // Creating a Dispatch Semaphore for synchronization of threads.
        // We will use it to make other threads wait until the current thread finishes its task.
        let dispatchQueue = DispatchQueue(label: "serviceQueue", qos: .background)
        let semaphore = DispatchSemaphore(value: 0)
        dispatchQueue.async {
            self.getDiscoverList(for: .discoverFirstHorizontalList) { [weak self] data in
                if let data = data {
                    let section = HomeHelper(type: .discoverFirstHorizontalList, data: data)
                    self?.discoverDataModels?.append(section)
                }
                semaphore.signal()
            }
            semaphore.wait()
            self.getDiscoverList(for: .discoverSecondHorizontalList) { [weak self] data in
                if let data = data {
                    let section = HomeHelper(type: .discoverSecondHorizontalList, data: data)
                    self?.discoverDataModels?.append(section)
                }
                semaphore.signal()
            }
            semaphore.wait()
            self.getDiscoverList(for: .discoverThirthTwoColumnList) { [weak self] data in
                if let data = data {
                    let section = HomeHelper(type: .discoverThirthTwoColumnList, data: data)
                    self?.discoverDataModels?.append(section)
                }
                semaphore.signal()
            }
            semaphore.wait()
            // All data retrieval operations are completed. Now, switch to the main thread for UI updates.
            DispatchQueue.main.async {
                self.view?.collectionViewReload()
                self.view?.activityStop()
                self.view?.endRefleshing()
                semaphore.signal()
            }
        }
    }
    func getDiscoverList(for requestType: RequestType,
                         completion: @escaping ([DiscoverModel.DiscoverListData]?) -> Void) {
        NetworkManager.shared.request(with: requestType) { (response: Result<DiscoverModel.DiscoverResponce,
                                                            NetworkError>) in
            switch response {
            case .success(let success):
                let data = success.list
                completion(data)
            case .failure(let failure):
                LoggerManager.log(.error, failure.localizedDescription)
                completion(nil)
            }
        }
    }
    func viewDidLoad() {
        view?.configureUI()
        getDiscoverData()
    }
}
