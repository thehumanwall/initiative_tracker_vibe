class Score < ApplicationRecord
  belongs_to :scale
  belongs_to :team
  belongs_to :action_item
end
