module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :me, Types::UserType,
      description: "The current user"
    def me
      User.first
    end

    field :projects, [Types::ProjectType], null: false,
      description: "The projects for the current user"
    def projects
      Project.all
    end
  end
end
