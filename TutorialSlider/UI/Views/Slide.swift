//
//  Slide.swift
//  TutorialSlider
//
//  Created by OlegChudnovskiy on 17.07.2020.
//  Copyright © 2020 OlegChudnovskiy. All rights reserved.
//

import UIKit

class Slide: UIView {
    
    @IBOutlet weak var contentView: UIView?
    @IBOutlet weak var titleLabel: UILabel?
    
    var setTextLabel: ((Slide) -> ())?

    override class func awakeFromNib() {
        
    }
    
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
        bundle.loadNibNamed("Slide", owner: self, options: nil)
        if let contentView = contentView {
            addSubview(contentView)
            contentView.frame = bounds
            
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "12")
            backgroundImage.contentMode = .scaleAspectFit
            contentView.insertSubview(backgroundImage, at: 0)
        }
    }
}
