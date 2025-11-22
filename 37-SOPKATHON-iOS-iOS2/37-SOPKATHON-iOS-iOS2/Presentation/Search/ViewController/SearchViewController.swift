//
//  SearchViewCotroller.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 어재선 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class SearchViewController: BaseViewController {
    
    var searchHotplace: [Datum] = []
    
    private let service = SearchService()
    
    
    private let tableView = UITableView()
    private lazy var searchController = UISearchController(searchResultsController: nil)
    override func setUI() {
        
        Task {
            try await getHotPlace()
            tableView.reloadData()
        }
        view.addSubview(tableView)
        view.backgroundColor = .white
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = false
//        searchHotplace = SearchHotplaceResponse.mockData.data
    }
    
    override func setStyle() {
        tableView.do {
            $0.separatorStyle = .none
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.dataSource = self
            $0.delegate = self
            $0.register(SearchCell.self, forCellReuseIdentifier: SearchCell.reuseIdentifier)
        }
        
        searchController.do {
            $0.searchBar.placeholder = "검색어를 입력해주세요"
            $0.obscuresBackgroundDuringPresentation = false
            $0.searchBar.showsCancelButton = false
            $0.searchResultsUpdater = self
        }
    }
    
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func getHotPlace() async throws{
        let response = try await service.getHotplace()
        searchHotplace = response.data
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchHotplace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseIdentifier, for: indexPath) as! SearchCell
        cell.configure(with: searchHotplace[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return "현재 인기 서핑 스팟"
       }
    
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard searchController.searchBar.text != nil else {
            return
        }
        self.tableView.reloadData()
        
    }
    
    
}

#Preview {
    
    SearchViewController()
}
