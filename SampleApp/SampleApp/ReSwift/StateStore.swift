//
//  StateStore.swift
//  
//
//  Created by Jaewon Yun on 2023/09/06.
//

import ReSwift

public final class StateStore: Store<AppState> {}

let counterStateReducer: CounterState.Reducer = .init()
let appReducer: AppState.Reducer = .init(counterStateReducer: counterStateReducer)
public let store: StateStore = .init(reducer: appReducer.createNewState, state: nil)
