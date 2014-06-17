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

    # Methods for parsing out fields from a db response.
    #
    # @since 3.0.0
    module Responsive

      # @return [ Protocol::Reply ] this response's message.
      attr_reader :msg

      # Initialize a new Response object.
      #
      # @param [ Protocol::Reply ] db response message.
      #
      # @since 3.0.0
      def initialize(msg)
        @msg = msg
      end

      # Parse the 'ok' field out from a db response to a write command.
      #
      # @return [ true, false ] was this operation successful?
      #
      # @since 3.0.0
      def success?
        msg.flags

        msg['ok'] == 1 || msg['ok'] == 1.0 || msg['ok'] == true
      end

      # Parse the 'n' field out from a db response to an operation.
      #
      # @return [ Integer ] number of documents matching query.
      #
      # @since 3.0.0
      def n
        msg.number_returned
      end

      # Return a hash representing this response object.
      #
      # @return [ Hash ] this response object.
      #
      # @since 3.0.0
      def hash
        msg.hash
      end
    end
  end
end
