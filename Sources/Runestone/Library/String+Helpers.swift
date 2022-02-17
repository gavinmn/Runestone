import Foundation

extension String {
    static var preferredUTF16Encoding: String.Encoding {
        // Implementation from https://github.com/ChimeHQ/SwiftTreeSitter/blob/main/Sources/SwiftTreeSitter/String%2BData.swift
        let dataA = "abc".data(using: .utf16LittleEndian)
        let dataB = "abc".data(using: .utf16)?.suffix(from: 2)
        return dataA == dataB ? .utf16LittleEndian : .utf16BigEndian
    }

    var containsASCIICharactersOnly: Bool {
        let containsNonASCIICharacter = unicodeScalars.contains(where: { !$0.isASCII })
        return !containsNonASCIICharacter
    }

    var byteCount: ByteCount {
        return ByteCount(utf16.count * 2)
    }
}
