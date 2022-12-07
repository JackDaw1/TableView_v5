//
//  DetailViewController.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 05.12.2022.
//

import UIKit

class DetailViewController: UIViewController {
        
    var task:Task? {
            didSet {
                guard let taskItem = task else {return}
                if let price = taskItem.price {
                    priceDetailedLabel.text = " \(price) "
                }
            }
        }
    

    let containerView:UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = true
           view.clipsToBounds = true // this will make sure its children do not go out of the boundary
           return view
       }()
       
       
    
    let priceDetailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let draftLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        draftLabel.text = " 111111111 "
        
        containerView.addSubview(draftLabel)
        containerView.addSubview(priceDetailedLabel)
        
        view.addSubview(containerView)

        
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        priceDetailedLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        priceDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        priceDetailedLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
            
        draftLabel.topAnchor.constraint(equalTo:self.priceDetailedLabel.bottomAnchor).isActive = true
        draftLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
      
    }

}
