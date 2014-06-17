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

      # Common methods for responses to read queries.
      #
      # @since 2.0.0
      module ReadableResponse

        # Cursor id, to be used for additional get mores.
        #
        # @return [ Integer ] the cursor id.
        #
        # @since 2.0.0
        def cursor_id
          msg.cursor_id
        end

        # Get the starting position of this query within the query's cursor.
        #
        # @return [ Integer ] the starting point.
        #
        # @since 2.0.0
        def starting_from
          msg.starting_from
        end

        # Get the array of documents returned by this query.
        #
        # @return [ Array ] the result documents.
        #
        # @since 2.0.0
        def docs
          msg.documents
        end

        private

        # No-op, this should be overriden by Readable classes.
        #
        # @return [ Hash ] the message.
        #
        # @since 2.0.0
        def msg
          {}
        end
      end
    end
  end
end
