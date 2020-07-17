//
//  Button.swift
//  TutorialSlider
//
//  Created by OlegChudnovskiy on 17.07.2020.
//  Copyright © 2020 OlegChudnovskiy. All rights reserved.
//

import UIKit

class TutorialButton: UIView {
    
    @IBOutlet private weak var labelButton: UILabel?
    @IBOutlet private weak var imageButton: UIImageView?
    @IBOutlet private weak var contentView: UIView?
    
    var changeButtonLabel: ((TutorialButton) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initNib()
    }
    
    func initNib() {
        let bundle = Bundle(for: TutorialButton.self)
        bundle.loadNibNamed("Button", owner: self, options: nil)
        if let contentView = contentView {
            addSubview(contentView)
            contentView.frame = bounds
        }
    }
    @IBAction private func butttonTapped() {

        UIView.animate(withDuration: 0.3, delay: 0.3, options: .autoreverse, animations: {
            self.contentView?.alpha = 0.5
        }) { _ in
            self.contentView?.alpha = 1
            self.changeButtonLabel?(self)
            print("TutorialButton Tapped")
        }
    }
    
}
