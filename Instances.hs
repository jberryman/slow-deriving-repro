{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE BlockArguments, TemplateHaskell, LambdaCase, NamedFieldPuns, KindSignatures, DataKinds, DeriveFunctor , StandaloneDeriving ,DeriveDataTypeable, DeriveGeneric, TypeSynonymInstances, FlexibleInstances, FlexibleContexts, DeriveFoldable, DeriveTraversable, DeriveLift, InstanceSigs  #-}

-- | Instances for types from "Hasura.Backends.MSSQL.Types.Internal" that're slow to compile.
module Instances () where

-- import Data.Aeson.Extended
-- import Data.Aeson.Types
-- import Data.Text.Extended (ToTxt (..))
-- import Database.ODBC.SQLServer qualified as ODBC
import Hasura.Backends.MSSQL.Types.Internal
-- import Hasura.Incremental.Internal.Dependency
-- import Hasura.Prelude
import Language.Haskell.TH
import Language.Haskell.TH.Syntax
import GHC.Generics
import Data.Data
import Data.Traversable

$( fmap concat $ for
     [''Aliased]
     \name ->
       [d|

         -- instance Hashable a => Hashable ($(conT name) a)

         -- instance Cacheable a => Cacheable ($(conT name) a)


         -- instance NFData a => NFData ($(conT name) a)



         deriving instance Data a => Data ($(conT name) a)
         |]
 )

$( fmap concat $ for
     [ ''UnifiedTableName,
       ''UnifiedObjectRelationship,
       ''UnifiedArrayRelationship,
       ''UnifiedUsing,
       ''UnifiedOn,
       ''UnifiedColumn,
       ''TempTableName,
       ''SomeTableName
     ]
     \name ->
       [d|

         -- instance Hashable $(conT name)

         -- instance Cacheable $(conT name)



         deriving instance Data $(conT name)

         -- instance NFData $(conT name)

         |]
 )

$( fmap concat $ for
     [ ''Where,
       ''For,
       ''Aggregate,
       ''EntityAlias,
       ''ForJson,
       ''JsonCardinality,
       ''Root,
       ''OrderBy,
       ''JoinAlias,
       ''Reselect,
       ''ColumnName,
       ''DataLength,
       ''Expression,
       ''FunctionApplicationExpression,
       ''MethodApplicationExpression,
       ''NullsOrder,
       ''Order,
       ''ScalarType,
       ''TableName,
       ''Select,
       ''With,
       ''Top,
       ''FieldName,
       ''JsonPath,
       ''Op,
       ''SpatialOp,
       ''Projection,
       ''From,
       ''OpenJson,
       ''JsonFieldSpec,
       ''Join,
       ''JoinSource,
       ''SelectIntoTempTable,
       ''SITTConstraints,
       ''InsertValuesIntoTempTable,
       ''InsertOutput,
       ''Inserted,
       ''OutputColumn,
       ''TempTable,
       ''Deleted,
       ''DeleteOutput,
       ''Values,
       ''Delete,
       ''Insert,
       ''Merge,
       ''MergeUsing,
       ''MergeOn,
       ''MergeWhenMatched,
       ''MergeWhenNotMatched
     ]
     \name ->
       [d|

         -- instance Hashable $(conT name)

         -- instance Cacheable $(conT name)



         deriving instance Data $(conT name)

         -- instance NFData $(conT name)
         |]
 )



--------------------------------------------------------------------------------
-- Third-party types

-- instance Cacheable ODBC.Value

-- instance Cacheable ODBC.Binary

--------------------------------------------------------------------------------
-- Debug instances

-- instance ToTxt ScalarType where
--   toTxt = tshow -- TODO: include schema

-- instance ToTxt TableName where
--   toTxt TableName {tableName, tableSchema} =
--     if tableSchema == "dbo"
--       then tableName
--       else tableSchema <> "." <> tableName

-- instance ToTxt ColumnName where
--   toTxt = columnNameText


--------------------------------------------------------------------------------
-- Manual instances


-- instance Hashable n => Hashable (Countable n)

-- instance Cacheable n => Cacheable (Countable n)



deriving instance Data n => Data (Countable n)

-- instance NFData n => NFData (Countable n)





-- instance NFData a => NFData (BooleanOperators a)

-- instance Hashable a => Hashable (BooleanOperators a)

-- instance Cacheable a => Cacheable (BooleanOperators a)
