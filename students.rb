require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'students.sqlite'
)

class Student < ActiveRecord::Base
  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  AGE_MINIMUM = 16

  #validates_format_of :website, with: /\Ahttp:/
  #validates_numericality_of :number_of_dogs, greater_than: 0
  validate :proper_age, :proper_name, :proper_surname, 
           :proper_website_address, :student_must_have_dog

  def complete_name
    self.name + " " + self.surnames 
  end

  private

  def student_must_have_dog
    if number_of_dogs <= 0
      errors.add(:number_of_dogs, "Hay man you must have a dog")
    end
  end

  def proper_website_address
    unless website.include?("http://")
      errors.add(:website, "You should enter http://")
    end
  end

  def proper_surname
    if surnames.nil? 
      errors.add(:surnames, "Input a surname please")
    end
  end

  def proper_name
    if name.nil?
      errors.add(:name, "Input a name please")
    end
  end

  def proper_age
    unless birthday < AGE_MINIMUM.years.ago
      errors.add(:birthday, 'is too young')
    end
  end
end
