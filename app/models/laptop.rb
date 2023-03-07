class Laptop < ApplicationRecord
  searchkick word_middle: [:company, :model]
end
