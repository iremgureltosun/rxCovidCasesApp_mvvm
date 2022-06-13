//
//  ServiceAssembly.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import Foundation
import Foundation
import Swinject

class ServiceAssembly: Assembly {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }
    func assemble(container: Container) {
        container.register(SearchServiceProtocol.self) { _ in
            SearchService()
        }.inObjectScope(.container)
    }
}
