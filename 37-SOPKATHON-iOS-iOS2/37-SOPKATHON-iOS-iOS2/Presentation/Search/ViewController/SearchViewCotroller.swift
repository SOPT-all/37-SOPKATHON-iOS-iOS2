//
//  SearchViewCotroller.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 어재선 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class SearchViewCotroller: BaseViewController {
    
    var searchHotplace: [SearchHotplaceResponse] = []

    private let tableView = UITableView()
    private lazy var searchController = UISearchController()
    
    override func setUI() {
        view.addSubview(tableView)
        searchHotplace = SearchHotplaceResponse.mockList
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
    }
    
    override func setAction() {
        
    }
    
    override func setLayout() {
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    override func setDelegate() {
        
    }
}


extension SearchViewCotroller: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchHotplace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseIdentifier, for: indexPath) as! SearchCell
        cell.selectionStyle = .none
    
        return cell
    }
    
    
}


extension SearchViewCotroller: UISearchControllerDelegate {
    
}


#Preview {
    
    SearchViewCotroller()
}
