//
//  LocationTableViewCell.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    // MARK: @IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var streetlabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
