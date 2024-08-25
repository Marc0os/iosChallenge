//
//  MoreInfoViewController.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit

class MoreInfoViewController: UIViewController {
    private let moreInfoView = MoreInfoView()
    
    let vm = MoreInfoViewModel()
    
    var repo: Item? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
        loadData()
    }
    
    func setupScreen(){
        moreInfoView.activityIndicator.startAnimating()
        moreInfoView.repoName2.isHidden = true
        view = moreInfoView
        
    }
    
    func loadData(){
        vm.getPulls(owner: repo!.owner.login, repository: repo!.name) {
            DispatchQueue.main.async {
                self.moreInfoView.repoName2.isHidden = false
                self.moreInfoView.repoName2.text = "\(self.vm.pulls.count)"
                self.moreInfoView.activityIndicator.stopAnimating()
            }
        }
    }

}
