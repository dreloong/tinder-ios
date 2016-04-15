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

    var initialImageViewCenter: CGPoint!

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

    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .Began:
            initialImageViewCenter = imageView.center
        case .Changed:
            let translation = sender.translationInView(self)
            var offset = translation.x
            if translation.x > 100 {
                offset = 320
            } else if translation.x < -100 {
                offset = -320
            }
            imageView.transform = CGAffineTransformMakeTranslation(offset, 0)
        case .Ended:
            let offset = initialImageViewCenter.x - imageView.center.x
            imageView.transform = CGAffineTransformMakeTranslation(offset, 0)
        default:
            break
        }
    }
}
