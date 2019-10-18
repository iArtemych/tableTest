//
//  MainView.swift
//  tableTestApp
//
//  Created by Artem Chursin on 18.10.2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    //MARK: - Variables
    var pagePanel: PagePanel!
    
    lazy var dataTable: UITableView = {
       
        let view = UITableView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    //MARK: - Private methods
    private func setupView() {
        
        if #available(iOS 13.0, *) {
            self.backgroundColor = .systemBackground
        } else {
            self.backgroundColor = .gray
        }
        
        setupTableView()
        seupPagePanel()
    }
    
    private func setupTableView() {
        
        self.addSubview(dataTable)
        dataTable.backgroundColor = .systemBackground
        
        let verticalSpaceTop = NSLayoutConstraint(item: dataTable, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let verticalSpaceBottom = NSLayoutConstraint(item: dataTable, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -100)
        let horisontalSpaceTrailing = NSLayoutConstraint(item: dataTable, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        let horisontalSpaceLeading = NSLayoutConstraint(item: dataTable, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([verticalSpaceTop, verticalSpaceBottom, horisontalSpaceLeading, horisontalSpaceTrailing])
    }
    
    private func seupPagePanel() {
        
        pagePanel = PagePanel.loadFromNib()
        self.addSubview(pagePanel)
        pagePanel.translatesAutoresizingMaskIntoConstraints = false
        
        if let panel = pagePanel {
            
            let verticalSpaceTop = NSLayoutConstraint(item: panel, attribute: .top, relatedBy: .equal, toItem: dataTable, attribute: .bottom, multiplier: 1, constant: 0)
            let verticalSpaceBottom = NSLayoutConstraint(item: panel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -40)
            let horisontalSpaceTrailing = NSLayoutConstraint(item: panel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
            let horisontalSpaceLeading = NSLayoutConstraint(item: panel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
            
            NSLayoutConstraint.activate([verticalSpaceTop, verticalSpaceBottom, horisontalSpaceLeading, horisontalSpaceTrailing])
        }
    }

}

