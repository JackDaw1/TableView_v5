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
    static func getTask() -> [TaskDTO]{
        let task = [
            TaskDTO(nameOfArticle: "SQL Tutorial", customer: "proglib", price: 100, numberOfSigns: 1500),
            TaskDTO(nameOfArticle: "iOS Tutorial", customer: "habr", price: 200, numberOfSigns: 1500),
        ]
        return task
    }
}
