module Graphql.Generator.InputObjectFile.Details exposing (InputObjectDetails, pickOptionalFields)

import Graphql.Parser.ClassCaseName as ClassCaseName exposing (ClassCaseName)
import Graphql.Parser.Type as Type exposing (TypeDefinition(..))


type alias InputObjectDetails =
    { definableType : Type.DefinableType
    , fields : List Type.Field
    , name : ClassCaseName
    , hasLoop : Bool
    , isOneOf : Bool
    }


pickOptionalFields : InputObjectDetails -> List Type.Field
pickOptionalFields { fields } =
    fields
        |> List.filter
            (\field ->
                case field.typeRef of
                    Type.TypeReference _ isNullable ->
                        isNullable == Type.Nullable
            )
