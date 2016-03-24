class ContactAssessment
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :contact, :contact_id, :user_id

  def initialize(contact)
    @contact    = contact
    @contact_id = contact.id
    @user_id    = contact.user_id
  end

  def new_preparation
    @preparation = Preparation.new(user_id: user_id, prep_id: contact_id, prep_type: "Contact")
  end

  def create_and_check(keyword)
    new_preparation
    @preparation.question = Question.find_by(keyword: keyword)
    @preparation.save
  end

  def run_all_checks
    contact_keywords = %(confirmed_contact)

    contact_keywords.each do |k|
      create_and_check(k)
    end
  end
end
