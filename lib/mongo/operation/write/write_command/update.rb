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

      module WriteCommand

        # A MongoDB update write command operation.
        # Supported in server versions >= 2.5.5
        #
        # @example
        #   include Mongo
        #   include Operation
        #   Write::WriteCommand::Update.new({ :updates => [{ :q => { :foo => 1 },
        #                                                    :u => { :$set =>
        #                                                            { :bar => 1 }},
        #                                                    :multi  => true,
        #                                                    :upsert => false }],
        #                                     :db_name       => 'test',
        #                                     :coll_name     => 'test_coll',
        #                                     :write_concern => write_concern,
        #                                     :ordered       => true
        #                                   })
        #
        # @since 3.0.0
        class Update
          include Executable
          include Writable

          # Execute this operation.
          #
          # @param [ Mongo::Server::Context ] The context for this operation.
          #
          # @return [ Mongo::Operation::Write::WriteCommand::RemoveResponse ] the
          #   operation response.
          #
          # @since 2.0.0
          def execute(context)
            UpdateResponse.new(super)
          end

          private

          def secondary_ok?
            false
          end

          # The query selector for this update command operation.
          #
          # @return [ Hash ] The selector describing this update operation.
          #
          # @since 3.0.0
          def selector
            { :update        => coll_name,
              :updates       => @spec[:updates],
              :write_concern => write_concern,
              :ordered       => ordered?
            }
          end

          # Represent db responses to update operations.
          #
          # @since 2.0.0
          class UpdateResponse
            include Responsive
            include WritableResponse

            # Return the _id of the document upserted by this operation.
            #
            # @return [ BSON::ObjectId, Integer ] theupserted document.
            #
            # @since 2.0.0
            def upserted
              msg.documents[0][:upserted]
            end
          end
        end
      end
    end
  end
end
