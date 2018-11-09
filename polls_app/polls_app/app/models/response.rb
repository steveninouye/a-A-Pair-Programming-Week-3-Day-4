# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  answer_choice_id :integer          not null
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validate :not_duplicate_response

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question


  def sibling_responses
    question.responses.where.not(responses: {id: id})
  end

  def respondent_already_answered?
    sibling_responses.exists?(respondent.id)
  end

  def not_duplicate_response
    errors[:user_id] << "You've Already Responded 👹" if respondent_already_answered?
  end
end
