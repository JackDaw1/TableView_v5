//
//  TaskDTOModel.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 20.12.2022.
//

import Foundation

class TaskDTOModel {
    
    static func getDetailOfTask(id: String,
                                completionHandler: @escaping (Result<TaskDTO, WDNetworkError>) -> Void) {
        MoyaNetworkManager.shared.mainRequest(RequestType.taskDetail(id)) { responseAPI in
            parseData(responseAPI: responseAPI,
                      type: TaskDTO.self,
                      completion: completionHandler)
        }
    }
    
    static func loadTasks(completionHandler: @escaping (Result<[TaskDTO], WDNetworkError>) -> Void) {
        MoyaNetworkManager.shared.mainRequest(RequestType.tasks) { responseAPI in
            parseData(responseAPI: responseAPI,
                      type: [TaskDTO].self,
                      completion: completionHandler)
        }
    }
}
