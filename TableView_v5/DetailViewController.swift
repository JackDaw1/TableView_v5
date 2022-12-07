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
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        containerView.addSubview(priceDetailedLabel)
        
        view.addSubview(containerView)

        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        containerView.widthAnchor.constraint(equalToConstant:40).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        priceDetailedLabel.heightAnchor.constraint(equalToConstant:30).isActive = true
        priceDetailedLabel.widthAnchor.constraint(equalToConstant:30).isActive = true
        priceDetailedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priceDetailedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
       
      
    }

}
