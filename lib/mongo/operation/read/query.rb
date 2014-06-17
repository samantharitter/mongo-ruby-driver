# Copyright (C) 2009-2014 MongoDB, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Mongo

  module Operation

    module Read

      # A MongoDB query operation.
      #
      # @since 3.0.0
      class Query
        include Executable

        # Initialize the query operation.
        #
        # @example
        #   include Mongo
        #   include Operation
        #   Read::Query.new({ :selector => { :foo => 1 },
        #                     :db_name => 'TEST_DB',
        #                     :coll_name => 'test-coll',
        #                     :opts => { :limit => 2 } })
        #
        # @param [ Hash ] spec The specifications for the query.
        #
        # @option spec :selector [ Hash ] The query selector.
        # @option spec :db_name [ String ] The name of the database on which
        #   the query should be run.
        # @option spec :coll_name [ String ] The name of the collection on which
        #   the query should be run.
        # @option spec :opts [ Hash ] Options for the query.
        #
        # @since 3.0.0
        def initialize(spec)
          @spec = spec
        end

        # Execute the operation.
        #
        # @param [ Mongo::Server::Context ] The context for this operation.
        #
        # @return [ QueryResponse ] the operation response.
        #
        # @since 2.0.0
        def execute(context)
          QueryResponse.new(super)
        end

        private

        # The selector for the query.
        #
        # @return [ Hash ] The query selector.
        #
        # @since 3.0.0
        def selector
          @spec[:selector]
        end

        # The options for the query.
        #
        # @return [ Hash ] The query options.
        #
        # @since 3.0.0
        def opts
          @spec[:opts] || {}
        end

        # The wire protocol message for this query operation.
        #
        # @return [ Mongo::Protocol::Query ] Wire protocol message.
        #
        # @since 3.0.0
        def message
          Mongo::Protocol::Query.new(db_name, coll_name, selector, opts)
        end

        # Objects representing a db response to a query operation.
        #
        # @since 2.0.0
        class QueryResponse
          include Responsive
          include ReadableResponse
        end
      end
    end
  end
end
