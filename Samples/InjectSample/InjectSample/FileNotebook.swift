//
//  FileNotebook.swift
//  InjectSample
//
//  Created by Denis Malykh on 04.04.18.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

struct Note {
    let uid: String
}

class FileNotebook {
    func getList() -> [Note] {
        return [
            Note(uid: "1"),
            Note(uid: "2")
        ]
    }
}

protocol NoteListable : class {
    var notes: [Note] { get }
}

class GetNoteListOperation : Operation, NoteListable {
    private let fileNotebook: FileNotebook

    private(set) var notes: [Note] = []

    init(fileNotebook: FileNotebook) {
        self.fileNotebook = fileNotebook
    }

    override func main() {
        notes = fileNotebook.getList()
    }
}

protocol OperationFactory : class {
    func buildGetNoteListOperation() -> (Operation & NoteListable)
}

class ConcreteOperationFactory : OperationFactory {
    private let fileNotebook: FileNotebook

    init(fileNotebook: FileNotebook) {
        self.fileNotebook = fileNotebook
    }

    func buildGetNoteListOperation() -> (Operation & NoteListable) {
        return GetNoteListOperation(fileNotebook: fileNotebook)
    }
}
