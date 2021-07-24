//
//  ProductItemTableViewCell.swift
//  ShopingCartUI
//
//  Created by Mounika Madishetti on 23/07/21.
//

import UIKit
protocol UpdateCart: AnyObject {
    func updateCartItem(cell: ProductItemTableViewCell)
}
class ProductItemTableViewCell: UITableViewCell {
    weak var delegate: UpdateCart?
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
     var isSelectedButton: Bool = false
    static let reuseIdentifier = "ProductItemTableViewCell"
    func configure(product: Product) {
        itemLabel.text = product.name
        costLabel.text = "$\(product.price) per \(product.unit)"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        
    }
    func setButton(state: Bool) {
        button.isSelected = state
        button.backgroundColor = (!button.isSelected) ? .black : .red
    }
    @IBAction func addButtonHandler(_ sender: Any) {
        setButton(state: !button.isSelected)
        self.delegate?.updateCartItem(cell: self)
    }
    
}
