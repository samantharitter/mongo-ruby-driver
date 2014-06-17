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
    module Error

      # Objects describing write concern database errors.
      #
      # @since 2.0.0
      module WriteConcernError
        include Errorable

        # Return a document identifying the write concern setting for to this error.
        #
        # @return [ Hash ] Write concern setting.
        #
        # @since 2.0.0
        def err_info
          @msg[:errInfo]
        end
      end
    end
  end
end
