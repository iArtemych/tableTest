//
//  MainTableViewControllerPages.swift
//  tableTestApp
//
//  Created by Artem Chursin on 18.10.2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import Foundation

extension MainTableViewController: PagePanelDelegate {
    
    func didTapNumButton(tag: Int) {
        self.page = tag
    }
}
