//
//  MoreInfoViewController.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit

class MoreInfoViewController: UIViewController {
    private let moreInfoView = MoreInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = moreInfoView
    }

}
