///
/// Auto-generated by Stone, do not modify.
///

import Foundation

/// Datatypes and serializers for the team_common namespace
public class TeamCommon {
    /// Information about a group.
    public class GroupSummary: CustomStringConvertible {
        /// (no description)
        public let groupName: String
        /// (no description)
        public let groupId: String
        /// External ID of group. This is an arbitrary ID that an admin can attach to a group.
        public let groupExternalId: String?
        /// The number of members in the group.
        public let memberCount: UInt32?
        public init(groupName: String, groupId: String, groupExternalId: String? = nil, memberCount: UInt32? = nil) {
            stringValidator()(groupName)
            self.groupName = groupName
            stringValidator()(groupId)
            self.groupId = groupId
            nullableValidator(stringValidator())(groupExternalId)
            self.groupExternalId = groupExternalId
            nullableValidator(comparableValidator())(memberCount)
            self.memberCount = memberCount
        }
        public var description: String {
            return "\(SerializeUtil.prepareJSONForSerialization(GroupSummarySerializer().serialize(self)))"
        }
    }
    public class GroupSummarySerializer: JSONSerializer {
        public init() { }
        public func serialize(value: GroupSummary) -> JSON {
            let output = [ 
            "group_name": Serialization._StringSerializer.serialize(value.groupName),
            "group_id": Serialization._StringSerializer.serialize(value.groupId),
            "group_external_id": NullableSerializer(Serialization._StringSerializer).serialize(value.groupExternalId),
            "member_count": NullableSerializer(Serialization._UInt32Serializer).serialize(value.memberCount),
            ]
            return .Dictionary(output)
        }
        public func deserialize(json: JSON) -> GroupSummary {
            switch json {
                case .Dictionary(let dict):
                    let groupName = Serialization._StringSerializer.deserialize(dict["group_name"] ?? .Null)
                    let groupId = Serialization._StringSerializer.deserialize(dict["group_id"] ?? .Null)
                    let groupExternalId = NullableSerializer(Serialization._StringSerializer).deserialize(dict["group_external_id"] ?? .Null)
                    let memberCount = NullableSerializer(Serialization._UInt32Serializer).deserialize(dict["member_count"] ?? .Null)
                    return GroupSummary(groupName: groupName, groupId: groupId, groupExternalId: groupExternalId, memberCount: memberCount)
                default:
                    fatalError("Type error deserializing")
            }
        }
    }

    /// Information about a group.
    public class AlphaGroupSummary: TeamCommon.GroupSummary {
        /// Who is allowed to manage the group.
        public let groupManagementType: TeamCommon.GroupManagementType
        public init(groupName: String, groupId: String, groupManagementType: TeamCommon.GroupManagementType, groupExternalId: String? = nil, memberCount: UInt32? = nil) {
            self.groupManagementType = groupManagementType
            super.init(groupName: groupName, groupId: groupId, groupExternalId: groupExternalId, memberCount: memberCount)
        }
        public override var description: String {
            return "\(SerializeUtil.prepareJSONForSerialization(AlphaGroupSummarySerializer().serialize(self)))"
        }
    }
    public class AlphaGroupSummarySerializer: JSONSerializer {
        public init() { }
        public func serialize(value: AlphaGroupSummary) -> JSON {
            let output = [ 
            "group_name": Serialization._StringSerializer.serialize(value.groupName),
            "group_id": Serialization._StringSerializer.serialize(value.groupId),
            "group_management_type": TeamCommon.GroupManagementTypeSerializer().serialize(value.groupManagementType),
            "group_external_id": NullableSerializer(Serialization._StringSerializer).serialize(value.groupExternalId),
            "member_count": NullableSerializer(Serialization._UInt32Serializer).serialize(value.memberCount),
            ]
            return .Dictionary(output)
        }
        public func deserialize(json: JSON) -> AlphaGroupSummary {
            switch json {
                case .Dictionary(let dict):
                    let groupName = Serialization._StringSerializer.deserialize(dict["group_name"] ?? .Null)
                    let groupId = Serialization._StringSerializer.deserialize(dict["group_id"] ?? .Null)
                    let groupManagementType = TeamCommon.GroupManagementTypeSerializer().deserialize(dict["group_management_type"] ?? .Null)
                    let groupExternalId = NullableSerializer(Serialization._StringSerializer).deserialize(dict["group_external_id"] ?? .Null)
                    let memberCount = NullableSerializer(Serialization._UInt32Serializer).deserialize(dict["member_count"] ?? .Null)
                    return AlphaGroupSummary(groupName: groupName, groupId: groupId, groupManagementType: groupManagementType, groupExternalId: groupExternalId, memberCount: memberCount)
                default:
                    fatalError("Type error deserializing")
            }
        }
    }

    /// The group type determines how a group is managed.
    public enum GroupManagementType: CustomStringConvertible {
        /// A group which is managed by team admins only.
        case CompanyManaged
        /// A group which is managed by selected users.
        case UserManaged
        /// (no description)
        case Other

        public var description: String {
            return "\(SerializeUtil.prepareJSONForSerialization(GroupManagementTypeSerializer().serialize(self)))"
        }
    }
    public class GroupManagementTypeSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: GroupManagementType) -> JSON {
            switch value {
                case .CompanyManaged:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("company_managed")
                    return .Dictionary(d)
                case .UserManaged:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("user_managed")
                    return .Dictionary(d)
                case .Other:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("other")
                    return .Dictionary(d)
            }
        }
        public func deserialize(json: JSON) -> GroupManagementType {
            switch json {
                case .Dictionary(let d):
                    let tag = Serialization.getTag(d)
                    switch tag {
                        case "company_managed":
                            return GroupManagementType.CompanyManaged
                        case "user_managed":
                            return GroupManagementType.UserManaged
                        case "other":
                            return GroupManagementType.Other
                        default:
                            return GroupManagementType.Other
                    }
                default:
                    fatalError("Failed to deserialize")
            }
        }
    }

    /// The group type determines how a group is created and managed.
    public enum GroupType: CustomStringConvertible {
        /// A group to which team members are automatically added. Applicable to team folders
        /// https://www.dropbox.com/help/986 only.
        case Team
        /// A group is created and managed by a user.
        case UserManaged
        /// (no description)
        case Other

        public var description: String {
            return "\(SerializeUtil.prepareJSONForSerialization(GroupTypeSerializer().serialize(self)))"
        }
    }
    public class GroupTypeSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: GroupType) -> JSON {
            switch value {
                case .Team:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("team")
                    return .Dictionary(d)
                case .UserManaged:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("user_managed")
                    return .Dictionary(d)
                case .Other:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("other")
                    return .Dictionary(d)
            }
        }
        public func deserialize(json: JSON) -> GroupType {
            switch json {
                case .Dictionary(let d):
                    let tag = Serialization.getTag(d)
                    switch tag {
                        case "team":
                            return GroupType.Team
                        case "user_managed":
                            return GroupType.UserManaged
                        case "other":
                            return GroupType.Other
                        default:
                            return GroupType.Other
                    }
                default:
                    fatalError("Failed to deserialize")
            }
        }
    }

}
