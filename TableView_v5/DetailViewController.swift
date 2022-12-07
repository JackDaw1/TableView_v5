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
                    priceDetailedLabel.text = " Price: \(price) "
                }
            }
        }
    

    let containerView:UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.clipsToBounds = true // this will make sure its children do not go out of the boundary
           return view
       }()
       
       
    
    let priceDetailedLabel:UILabel = {
        let label = UILabel()
        //self.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        containerView.addSubview(priceDetailedLabel)
        
        view.addSubview(containerView)

        containerView.heightAnchor.constraint(equalToConstant:100).isActive = true
        containerView.widthAnchor.constraint(equalToConstant:200).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        priceDetailedLabel.heightAnchor.constraint(equalToConstant:90).isActive = true
        priceDetailedLabel.widthAnchor.constraint(equalToConstant:190).isActive = true
        priceDetailedLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        priceDetailedLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        priceDetailedLabel.translatesAutoresizingMaskIntoConstraints = false
            
       
      
    }

}
