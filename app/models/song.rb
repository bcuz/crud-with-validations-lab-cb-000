class Song < ActiveRecord::Base
  validates :title, presence: true
  # validates :release_year, presence: true unless :released == false
  validates :release_year, presence: true, :if => :should_have_year?, numericality: { less_than_or_equal_to: Time.now.year }
  # validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  # attr_accessor :released

  # works, not sure if its the best way.
  # https://stackoverflow.com/questions/13750436/rails-validating-a-field-is-present-only-if-another-is-present
  def should_have_year?
    self.released
  end
end
