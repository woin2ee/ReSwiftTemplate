//
//  AppState.swift
//  SampleApp
//
//  Created by Jaewon Yun on 2023/09/03.
//

import ReSwift
import ReSwiftTemplate

// MARK: - State

public struct AppState: StateTemplate {

    public var isLoggedIn: Bool

    public var counterState: CounterState

}

// MARK: - Reducer

extension AppState {

    public struct Reducer: ReducerTemplate {

        let counterStateReducer: CounterState.Reducer

        public init(counterStateReducer: CounterState.Reducer) {
            self.counterStateReducer = counterStateReducer
        }

        public func createNewState(action: Action, state: AppState?) -> AppState {
            var state: AppState = state ?? .init(
                isLoggedIn: false,
                counterState: counterStateReducer.createNewState(action: action, state: state?.counterState)
            )

            switch action {
            case let action as CounterState.Actions:
                state.counterState = counterStateReducer.createNewState(action: action, state: state.counterState)
            case let action as AppState.Actions where action == .login:
                state.isLoggedIn = true
            case let action as AppState.Actions where action == .logout:
                state.isLoggedIn = false
            default:
                break
            }

            return state
        }

    }

}

// MARK: - Actions

extension AppState {

    public enum Actions: Action {

        case login

        case logout

    }

}
