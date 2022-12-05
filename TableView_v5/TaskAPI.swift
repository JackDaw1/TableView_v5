//
//  TaskAPI.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 05.12.2022.
//let nameOfArticle:String?
//let customer:String?
//let price:Int?

import Foundation

class TaskAPI {
    static func getTask() -> [Task]{
        let task = [
            Task(nameOfArticle: "Kelly Goodwin", customer: "proglib", price: 100),
            Task(nameOfArticle: "Mohammad Hussain", customer: "habr", price: 200),
        ]
        return task
    }
}
