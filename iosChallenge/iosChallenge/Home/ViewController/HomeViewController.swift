//
//  HomeViewController.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    let list1: [GitModel] = [GitModel(name: "a"),
                             GitModel(name: "b"),
                             GitModel(name: "c"),]
    
    let list2: [GitModel] = [GitModel(name: "d"),
                             GitModel(name: "e"),
                             GitModel(name: "f"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.tableGit.dataSource = self
        homeView.tableGit.delegate = self
        
        homeView.segmentedControl.addTarget(self, action: #selector(updateTableView), for: .valueChanged)
        
        title = "Github"
        view = homeView
    }
    @objc
    func updateTableView(){
        homeView.tableGit.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        
        switch homeView.segmentedControl.selectedSegmentIndex {
        case 0:
            rows = list1.count
        case 1:
            rows = list2.count
        default:
            break
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GitCell", for: indexPath) as! GitTableViewCell

        switch homeView.segmentedControl.selectedSegmentIndex {
        case 0:
            cell.titleLabel.text = list1[indexPath.row].name
        case 1:
            cell.titleLabel.text = list2[indexPath.row].name
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(MoreInfoViewController(), animated: true)
    }
}

