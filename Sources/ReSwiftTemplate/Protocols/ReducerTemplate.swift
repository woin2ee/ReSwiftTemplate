//
//  ReducerTemplate.swift
//  ReSwiftTemplate
//
//  Created by Jaewon Yun on 2023/09/05.
//

import ReSwift

public protocol ReducerTemplate {

    associatedtype State: StateTemplate

    func createNewState(action: Action, state: State?) -> State

}
