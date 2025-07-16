// Copyright 2019-2020 CoreOffice contributors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//  Created by Max Desiatov on 27/10/2018.
//

/** An array of `Relationship` values. This type directly maps the internal XML structure of the
 `.xlsx` format.
 */
public struct Relationships: Codable, Equatable {
  public let items: [Relationship]

  enum CodingKeys: String, CodingKey {
    case items = "relationship"
  }
}

/** Relationship to an entity stored in a given `.xlsx` archive. These can be worksheets,
 chartsheets, thumbnails and a few other internal entities. Most of the time users of CoreXLSX
 wouldn't need to handle relationships directly.
 */
public struct Relationship: Codable, Equatable {
  public enum SchemaType: Codable, Equatable {
    case calcChain
    case officeDocument
    case extendedProperties
    case packageCoreProperties
    case coreProperties
    case connections
    case worksheet
    case chartsheet
    case sharedStrings
    case styles
    case theme
    case pivotCache
    case metadataThumbnail
    case customProperties
    case externalLink
    case customXml
    case person
    case webExtensionTaskPanes
    case googleWorkbookMetadata
    case purlOCLC
    case sheetMetadata
    case classificationlabels
    case unknown(String)
    
    private var rawValue: String {
      switch self {
      case .calcChain:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        calcChain
        """
      case .officeDocument:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        officeDocument
        """
      case .extendedProperties:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        extended-properties
        """
      case .packageCoreProperties:
        return """
        http://schemas.openxmlformats.org/package/2006/relationships/metadata/\
        core-properties
        """
      case .coreProperties:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        metadata/core-properties
        """
      case .connections:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        connections
        """
      case .worksheet:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        worksheet
        """
      case .chartsheet:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        chartsheet
        """
      case .sharedStrings:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        sharedStrings
        """
      case .styles:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        styles
        """
      case .theme:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        theme
        """
      case .pivotCache:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        pivotCacheDefinition
        """
      case .metadataThumbnail:
        return """
        http://schemas.openxmlformats.org/package/2006/relationships/metadata/\
        thumbnail
        """
      case .customProperties:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        custom-properties
        """
      case .externalLink:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        externalLink
        """
      case .customXml:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
        customXml
        """
      case .person:
        return """
        http://schemas.microsoft.com/office/2017/10/relationships/\
        person
        """
      case .webExtensionTaskPanes:
        return """
        http://schemas.microsoft.com/office/2011/relationships/\
        webextensiontaskpanes
        """
      case .googleWorkbookMetadata:
        return """
        http://customschemas.google.com/relationships/workbookmetadata
        """
      case .purlOCLC:
        return """
        http://purl.oclc.org/ooxml/officeDocument/relationships/extendedProperties
        """
      case .sheetMetadata:
        return """
        http://schemas.openxmlformats.org/officeDocument/2006/relationships/sheetMetadata
        """
      case .classificationlabels:
        return """
        http://schemas.microsoft.com/office/2020/02/relationships/classificationlabels
        """
      case .unknown(let value):
        return value
      }
    }
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      let stringValue = try container.decode(String.self)
      
      // Try to match known schema types
      switch stringValue {
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           calcChain
           """:
        self = .calcChain
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           officeDocument
           """:
        self = .officeDocument
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           extended-properties
           """:
        self = .extendedProperties
      case """
           http://schemas.openxmlformats.org/package/2006/relationships/metadata/\
           core-properties
           """:
        self = .packageCoreProperties
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           metadata/core-properties
           """:
        self = .coreProperties
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           connections
           """:
        self = .connections
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           worksheet
           """:
        self = .worksheet
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           chartsheet
           """:
        self = .chartsheet
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           sharedStrings
           """:
        self = .sharedStrings
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           styles
           """:
        self = .styles
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           theme
           """:
        self = .theme
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           pivotCacheDefinition
           """:
        self = .pivotCache
      case """
           http://schemas.openxmlformats.org/package/2006/relationships/metadata/\
           thumbnail
           """:
        self = .metadataThumbnail
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           custom-properties
           """:
        self = .customProperties
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           externalLink
           """:
        self = .externalLink
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/\
           customXml
           """:
        self = .customXml
      case """
           http://schemas.microsoft.com/office/2017/10/relationships/\
           person
           """:
        self = .person
      case """
           http://schemas.microsoft.com/office/2011/relationships/\
           webextensiontaskpanes
           """:
        self = .webExtensionTaskPanes
      case """
           http://customschemas.google.com/relationships/workbookmetadata
           """:
        self = .googleWorkbookMetadata
      case """
           http://purl.oclc.org/ooxml/officeDocument/relationships/extendedProperties
           """:
        self = .purlOCLC
      case """
           http://schemas.openxmlformats.org/officeDocument/2006/relationships/sheetMetadata
           """:
        self = .sheetMetadata
      case """
           http://schemas.microsoft.com/office/2020/02/relationships/classificationlabels
           """:
        self = .classificationlabels
      default:
        // For any unknown schema type, store it as unknown
        self = .unknown(stringValue)
      }
    }
    
    public func encode(to encoder: Encoder) throws {
      var container = encoder.singleValueContainer()
      try container.encode(rawValue)
    }
  }

  /// The identifier for this entity.
  public let id: String

  /// The type of this entity.
  public let type: SchemaType

  /// The path to this entity in the `.xlsx` archive.
  public let target: String

  func path(from root: String) -> String {
    Path(target).isRoot ? target : "\(root)/\(target)"
  }
}
