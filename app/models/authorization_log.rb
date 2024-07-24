class AuthorizationLog < ApplicationRecord
  enum :token_type, { guest: 0, normal: 1 }
end
