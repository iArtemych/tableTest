//
//  PagePanel.swift
//  tableTestApp
//
//  Created by Artem Chursin on 18.10.2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import UIKit

class PagePanel: UIView {

    //MARK: - Constants
    
    //MARK: - Variables
    weak var delegate: PagePanelDelegate!
    //MARK: - Outlets
    @IBOutlet var numButtons: [UIButton]!
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    //MARK: - Actions
    @IBAction func numTap(_ sender: UIButton) {
        
        let tag = sender.tag
        delegate.didTapNumButton(tag: tag)
    }
    
    //MARK: - Methods
    func setupNumPad(page: Int, maxPage: Int) {
        var pageArray: [Int] = [1, 2, 3, 4, 5]
        
        let prevPage = page - 1
        let nextPage = page + 1
        
        if maxPage < 5 {
            for button in numButtons {
                button.isEnabled = false
            }
            for i in 0..<maxPage {
                numButtons[i].isEnabled = true
            }
        } else {
            for button in numButtons {
                button.isEnabled = true
            }
        }
        
        if page > 3 {
            if page < maxPage - 2 {
                for index in 0 ..< numButtons.count {
                    switch index {
                    case 0: pageArray[index] = 1
                    case 1: pageArray[index] = prevPage
                    case 2: pageArray[index] = page
                    case 3: pageArray[index] = nextPage
                    case 4: pageArray[index] = maxPage
                    default: fatalError()
                    }
                }
            } else {
                for index in 0 ..< numButtons.count {
                    switch index {
                    case 0: pageArray[index] = 1
                    case 1: pageArray[index] = maxPage - 3
                    case 2: pageArray[index] = maxPage - 2
                    case 3: pageArray[index] = maxPage - 1
                    case 4: pageArray[index] = maxPage
                    default: fatalError()
                    }
                }
            }
        } else {
            for index in 0 ..< numButtons.count - 1 {
                
                pageArray[index] = index + 1
            }
            pageArray[4] = maxPage
        }
        
        for (index, button) in numButtons.enumerated() {
            
            button.setTitle("\(pageArray[index])", for: .normal)
            button.tag = pageArray[index]
        }
        
        for button in numButtons {
            
            if button.tag == page {
                button.layer.borderWidth = 2
                button.layer.borderColor = .init(srgbRed: 58, green: 129, blue: 241, alpha: 1)
            } else {
                button.layer.borderWidth = 0
            }
        }
    }
    
    
    //MARK: - Private methods
    private func setupView() {
        
        self.backgroundColor = .clear
        
    }

}
