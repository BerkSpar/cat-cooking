//
//  File.swift
//  
//
//  Created by Felipe Passos on 22/02/24.
//

import Foundation

protocol GameEvent { }

struct ResetEvent: GameEvent { }

struct GoToNextLevel: GameEvent { }

struct WrongCookie: GameEvent {
    let message: String
}

struct LinesChaged: GameEvent { }

struct StopGame: GameEvent { }

struct RunLine: GameEvent { }

struct DeliverCookieEvent: GameEvent { }

struct CookCookieEvent: GameEvent { }

struct UpdateCookie: GameEvent {
    let cookie: Cookie
}
