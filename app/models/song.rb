class Song < ActiveRecord::Base
  # somehow
  validates :title, presence: true, :uniqueness => { :scope => :release_year }
  validates :release_year, presence: true, :if => :should_have_year?, numericality: { less_than_or_equal_to: Time.now.year }

  # uniq title based on release_year ?

  # works, not sure if its the best way.
  # https://stackoverflow.com/questions/13750436/rails-validating-a-field-is-present-only-if-another-is-present
  def should_have_year?
    self.released
  end
end
