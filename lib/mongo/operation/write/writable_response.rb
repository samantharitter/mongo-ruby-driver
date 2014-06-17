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
    module Write

      # Methods for parsing out fields for a response to a write command.
      #
      # @since 2.0.0
      module WritableResponse

        # The number of documents inserted by this operation.
        #
        # @return [ Integer ] nInserted.
        #
        # @since 2.0.0
        def n_inserted
          msg.documents[0][:nInserted]
        end

        # The number of documents removed by this operation.
        #
        # @return [ Integer ] nRemoved.
        #
        # @since 2.0.0
        def n_removed
          msg.documents[0][:nRemoved]
        end

        # The number of documents matched by this operation.
        #
        # @return [ Integer ] nMatched.
        #
        # @since 2.0.0
        def n_matched
          msg.documents[0][:nMatched]
        end

        # The number of documents modified by this operation.
        #
        # @return [ Integer ] nModified.
        #
        # @since 2.0.0
        def n_modified
          msg.documents[0][:nModified]
        end

        # The number of documents upserted by this operation.
        #
        # @return [ Integer ] nUpserted.
        #
        # @since 2.0.0
        def n_upserted
          msg.documents[0][:nUpserted]
        end

        # Did this operation encounter a write error?
        #
        # @return [ true, false ] success of this operation.
        #
        # @since 2.0.0
        def write_error?
          false
        end

        # Return the write error for this operation, if there was one.
        #
        # @return [ Mongo::Operation::Error::WriteError ] error.
        #
        # @since 2.0.0
        def write_error
          nil
        end

        # Did this operation encounter a write concern error?
        #
        # @return [ true, false ] error.
        #
        # @since 2.0.0
        def write_concern_error?
          false
        end

        # Return the write concern error for this operation, if there was one.
        #
        # @return [ Mongo::Operation::Error::WriteConcernError ] error.
        #
        # @since 2.0.0
        def write_concern_error
          nil
        end
      end
    end
  end
end
