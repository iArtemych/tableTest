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
        
        let prevPage = page - 1
        let nextPage = page + 1
        
        if maxPage < 5 {
            for button in numButtons {
                button.isEnabled = false
            }
            for i in 0..<maxPage {
                numButtons[i].isEnabled = true
            }
        }
        else {
            for button in numButtons {
                button.isEnabled = true
            }
        }
        // TODO: - Swich in method
        if page > 3 {
            
            if page < maxPage - 2 {
                for (index, button) in numButtons.enumerated() {
                    
                    switch index {
                    case 0:
                        button.setTitle("1", for: .normal)
                        button.tag = 1
                    case 1:
                        button.setTitle("\(prevPage)", for: .normal)
                        button.tag = prevPage
                    case 2:
                        button.setTitle("\(page)", for: .normal)
                        button.tag = page
                    case 3:
                        button.setTitle("\(nextPage)", for: .normal)
                        button.tag = nextPage
                    case 4:
                        button.setTitle("\(maxPage)", for: .normal)
                        button.tag = maxPage
                    default:
                        fatalError()
                    }
                }
            } else {
                for (index, button) in numButtons.enumerated() {
                    
                    switch index {
                    case 0:
                        button.setTitle("1", for: .normal)
                        button.tag = 1
                    case 1:
                        button.setTitle("\(maxPage - 3)", for: .normal)
                        button.tag = maxPage - 3
                    case 2:
                        button.setTitle("\(maxPage - 2)", for: .normal)
                        button.tag = maxPage - 2
                    case 3:
                        button.setTitle("\(maxPage - 1)", for: .normal)
                        button.tag = maxPage - 1
                    case 4:
                        button.setTitle("\(maxPage)", for: .normal)
                        button.tag = maxPage
                    default:
                        fatalError()
                    }
                }
            }
        } else {
            for (index, button) in numButtons.enumerated() {
                
                button.setTitle("\(index + 1)", for: .normal)
                button.tag = index + 1
                if index == 4 {
                    button.setTitle("\(maxPage)", for: .normal)
                    button.tag = maxPage
                }
            }
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
