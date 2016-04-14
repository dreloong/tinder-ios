//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Xiaofei Long on 4/14/16.
//  Copyright © 2016 Xiaofei Long. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!

    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)

        imageView.userInteractionEnabled = true
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
    }
}
