import Foundation
import XCTest
import Plummet



class FieldTests: XCTestCase {
  func testDescription() {
    XCTAssertEqual(HeaderField.accept.description, "Accept")
    XCTAssertEqual(HeaderField.other("foo").description, "foo")
  }
  
  
  func testStringLiteralMakesKnownTypeIfKnown() {
    let knownSubject: HeaderField = "Accept"
    switch knownSubject {
    case .other:
      XCTFail()
    case .accept:
      break
    default:
      XCTFail()
    }
  }

  
  func testStringLiteralOtherType() {
    let otherSubject: HeaderField = "Foo"
    switch otherSubject {
    case .other(let s):
      XCTAssertEqual(s, "Foo")
    default:
      XCTFail()
    }
  }
  
  
  func testEquality() {
    XCTAssertEqual(HeaderField.accept, HeaderField.accept)
    XCTAssertNotEqual(HeaderField.accept, HeaderField.acceptCharset)
    XCTAssertEqual(HeaderField.other("foo"), HeaderField.other("foo"))
    XCTAssertEqual(HeaderField.other("FOO"), HeaderField.other("foo"))
    XCTAssertEqual(HeaderField.accept, HeaderField.other("Accept"))
    XCTAssertEqual(HeaderField.accept, HeaderField.other("ACCEPT"))
  }
  
  
  func testButThoughEqualTheyAreNotTheSame() {
    let knownSubject = HeaderField.accept
    let otherSubject = HeaderField.other("Accept")
    XCTAssertEqual(knownSubject, otherSubject)
    
    switch knownSubject {
    case .other("Accept"):
      XCTFail()
    case .accept:
      break
    default:
      XCTFail()
    }
    
    switch otherSubject {
    case .accept:
      XCTFail()
    case .other("Accept"):
      break
    default:
      XCTFail()
    }
  }
  
  
  func testCommutativeProperty() {
    XCTAssertEqual("Accept", HeaderField.accept)
    XCTAssertEqual("Accept", HeaderField.accept.description)
    XCTAssertEqual("Accept-Charset", HeaderField.acceptCharset)
    XCTAssertEqual("Accept-Charset", HeaderField.acceptCharset.description)
    XCTAssertEqual("Accept-Encoding", HeaderField.acceptEncoding)
    XCTAssertEqual("Accept-Encoding", HeaderField.acceptEncoding.description)
    XCTAssertEqual("Accept-Language", HeaderField.acceptLanguage)
    XCTAssertEqual("Accept-Language", HeaderField.acceptLanguage.description)
    XCTAssertEqual("Accept-Version", HeaderField.acceptVersion)
    XCTAssertEqual("Accept-Version", HeaderField.acceptVersion.description)
    XCTAssertEqual("Authorization", HeaderField.authorization)
    XCTAssertEqual("Authorization", HeaderField.authorization.description)
    XCTAssertEqual("Cache-Control", HeaderField.cacheControl)
    XCTAssertEqual("Cache-Control", HeaderField.cacheControl.description)
    XCTAssertEqual("Connection", HeaderField.connection)
    XCTAssertEqual("Connection", HeaderField.connection.description)
    XCTAssertEqual("Cookie", HeaderField.cookie)
    XCTAssertEqual("Cookie", HeaderField.cookie.description)
    XCTAssertEqual("Content-Length", HeaderField.contentLength)
    XCTAssertEqual("Content-Length", HeaderField.contentLength.description)
    XCTAssertEqual("Content-MD5", HeaderField.contentMD5)
    XCTAssertEqual("Content-MD5", HeaderField.contentMD5.description)
    XCTAssertEqual("Content-Type", HeaderField.contentType)
    XCTAssertEqual("Content-Type", HeaderField.contentType.description)
    XCTAssertEqual("Date", HeaderField.date)
    XCTAssertEqual("Date", HeaderField.date.description)
    XCTAssertEqual("Host", HeaderField.host)
    XCTAssertEqual("Host", HeaderField.host.description)
    XCTAssertEqual("Origin", HeaderField.origin)
    XCTAssertEqual("Origin", HeaderField.origin.description)
    XCTAssertEqual("Referer", HeaderField.referer)
    XCTAssertEqual("Referer", HeaderField.referer.description)
    XCTAssertEqual("User-Agent", HeaderField.userAgent)
    XCTAssertEqual("User-Agent", HeaderField.userAgent.description)
    XCTAssertEqual("RandomThing", HeaderField.other("RandomThing"))
    XCTAssertEqual("RandomThing", HeaderField.other("RandomThing").description)
  }
}
