//
//  DetailViewController.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 05.12.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var task: Task?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
          
        //let task1 = TaskAPI.getTask() // model
        
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
        
        
        //containerView.addSubview(priceDetailedLabel)
        draftLabel.text = " 111111111 "
        view.addSubview(priceDetailedLabel)
        view.addSubview(draftLabel)


    }

}
