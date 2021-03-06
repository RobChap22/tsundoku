class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :requests

  include PgSearch::Model
  pg_search_scope :global_search,
    associated_against: { book: [:title, :author] },
    using: { tsearch: { prefix: true } }
end
