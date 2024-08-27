//
//  MoreInfoViewController.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit
import Kingfisher

class MoreInfoViewController: UIViewController {
    
    private let moreInfoView = MoreInfoView()
    let vm = MoreInfoViewModel()
    var repo: Item? = nil
    private var dataTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
        loadData()
    }
    
    func setupScreen(){
        moreInfoView.activityIndicator.startAnimating()
        moreInfoView.mainView.isHidden = true
        
        moreInfoView.tablePulls.delegate = self
        moreInfoView.tablePulls.dataSource = self
        
        moreInfoView.saveButton.addTarget(self, action: #selector(saveRepo), for: .touchUpInside)
        moreInfoView.deleteButton.addTarget(self, action: #selector(removeRepo), for: .touchUpInside)
        
        view = moreInfoView
        
    }
    
    func loadData(){
        dataTask = vm.getPulls(owner: repo!.owner.login, repository: repo!.name) {
            DispatchQueue.main.async {
                self.moreInfoView.mainView.isHidden = false
                self.moreInfoView.repoName.text = self.repo?.name
                self.moreInfoView.fullName.text = self.repo?.fullname
                self.moreInfoView.fork.text = "\(self.repo!.forksCount) forks"
                self.moreInfoView.watchers.text = "\(self.repo!.watchersCount) watchers"
                self.moreInfoView.descriptionText.text = self.repo?.description
                if let topics = self.repo?.topics, !topics.isEmpty {
                    let topicsString = topics.joined(separator: ", ")
                    self.moreInfoView.topicsText.text = topicsString
                } else {
                    self.moreInfoView.topicsText.text = "No topics available"
                }
                
                // MARK: - bug nas datas
                var dateString = self.repo!.createdAt
                
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "dd/mm/yy"

                if let date = ISO8601DateFormatter().date(from: dateString) {
                    let formattedDateString = outputFormatter.string(from: date)
                    self.moreInfoView.created.text = "Created at \(formattedDateString)"
                }
                
                dateString = self.repo!.updatedAt

                outputFormatter.dateFormat = "dd/mm/yy"
                
                if let date = ISO8601DateFormatter().date(from: dateString) {
                    let formattedDateString = outputFormatter.string(from: date)
                    self.moreInfoView.updated.text = "Updated at \(formattedDateString)"
                }
                
                self.moreInfoView.owner.text = self.repo?.owner.login
                
                self.moreInfoView.ownerImage.kf.indicatorType = .activity
                self.moreInfoView.ownerImage.kf.setImage(with: URL(string: self.repo!.owner.avatarURL), placeholder: nil, options: [.transition(.fade(0.5))])

                self.moreInfoView.tablePulls.reloadData()
                
                self.moreInfoView.deleteButton.isHidden = self.vm.existRepo(id: self.repo!.id) ? false : true
                self.moreInfoView.saveButton.isHidden = self.vm.existRepo(id: self.repo!.id) ? true : false
//                self.moreInfoView.repoName.text = "\(self.vm.pulls.count)"
                self.moreInfoView.activityIndicator.stopAnimating()
            }
        }
    }
    
    @objc
    func saveRepo(){
        vm.createRepo(item: self.repo!)
        // atualizar botoes
        notifyChanges()
        self.moreInfoView.deleteButton.isHidden = self.vm.existRepo(id: self.repo!.id) ? false : true
        self.moreInfoView.saveButton.isHidden = self.vm.existRepo(id: self.repo!.id) ? true : false
    }
    
    @objc
    func removeRepo(){
        vm.deleteRepo(id: self.repo!.id)
        notifyChanges()
        // atualizar botoes
        self.moreInfoView.deleteButton.isHidden = self.vm.existRepo(id: self.repo!.id) ? false : true
        self.moreInfoView.saveButton.isHidden = self.vm.existRepo(id: self.repo!.id) ? true : false
    }
    
    func notifyChanges(){
        NotificationCenter.default.post(name: Notification.Name("DatabaseChanged"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dataTask?.cancel()
    }
}

extension MoreInfoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.moreInfoView.placeholder.isHidden = vm.pulls.count == 0 ? false :  true
        self.moreInfoView.tablePulls.isHidden = vm.pulls.count == 0 ? true :  false
        return vm.pulls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PullCell", for: indexPath) as! PullTableViewCell
        
        let pullCell: Pull = vm.pulls[indexPath.row]
        
        cell.title.text = "\(pullCell.number): \(pullCell.title)"
        cell.profilePic.kf.indicatorType = .activity
        cell.profilePic.kf.setImage(with: URL(string: pullCell.user.avatarURL), placeholder: nil, options: [.transition(.fade(0.5))])
        cell.userName.text = pullCell.user.login
        
        let dateString = pullCell.createdAt
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd/mm/yy"
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")

        if let date = ISO8601DateFormatter().date(from: dateString) {
            let formattedDateString = outputFormatter.string(from: date)
            cell.created.text = "Created at \(formattedDateString)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
