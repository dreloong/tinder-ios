//
//  CardsViewController.swift
//  Tinder
//
//  Created by Xiaofei Long on 4/14/16.
//  Copyright © 2016 Xiaofei Long. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var draggableImageView: DraggableImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        draggableImageView.image = UIImage(named: "Sample")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
