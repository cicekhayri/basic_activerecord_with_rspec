require_relative '../students'
require 'pry'

describe Student do
  before do
    @student = Student.new
    @student.name = "Hayri"
    @student.surnames = "Cicek"
    @student.birthday = 31.years.ago
    @student.website = "http://hoshilab.com"
    @student.number_of_dogs = 1

    @student2 = Student.new
    @student2.name = "John"
    @student2.surnames = "Dubi Dubi"
    @student2.birthday = 11.years.ago
    @student2.website = "http://johndubidubi.com"
    @student2.number_of_dogs = 1
  end

  describe "Student #1" do
    it "should not save if student name is not present" do
      @student.name = nil
      expect(@student.valid?).to eql(false)
    end

    it "should not save if surname is not present" do
      @student.surnames = nil
      expect(@student.valid?).to eql(false)
    end

    it "should not save if student is not older than 16" do
      @student.birthday = 13.years.ago
      expect(@student.valid?).to eql(false)
    end

    it "should only accept student which have dogs :)" do
      @student.number_of_dogs = 0
      expect(@student.valid?).to eql(false)
    end

    it "should have website address which starts with http://" do
      @student.website = "twitter.com"
      expect(@student.valid?).to eql(false)
    end

    it "should have a complete name method with firstname and surname" do
      expect(@student.complete_name).to eql("Hayri Cicek")
    end

    it "should have a complete name if another student" do
      expect(@student2.complete_name).to eql("John Dubi Dubi")
    end
  end
end
