//
//  HomeContracts.swift
//  Definex
//
//  Created by Murat Çiçek on 31.07.2023.
//

import Foundation

protocol HomeViewModelInterface: AnyObject {
    var view: HomeViewInterface? {get set}
    var discoverDataModels: [HomeHelper]? { get set }

    func viewDidLoad()
    func getDiscoverList(for requestType: RequestType, completion: @escaping ([DiscoverModel.DiscoverListData]?) -> Void)
}

protocol HomeViewInterface: AnyObject {
    func configureUI()
    func activityStart()
    func activityStop()
    func collectionViewReload()
    func endRefleshing()
}
